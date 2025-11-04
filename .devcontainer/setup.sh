#!/bin/bash
set -e

echo "🚀 Setting up Microsoft Agent Framework Workshop environment..."

# Update package list
echo "📦 Updating package lists..."
sudo apt-get update -qq

# Install system dependencies
echo "📦 Installing system dependencies..."
sudo apt-get install -y -qq \
    git \
    curl \
    wget \
    vim \
    jq \
    tree \
    httpie

# Upgrade pip
echo "🐍 Upgrading pip..."
python -m pip install --upgrade pip setuptools wheel

# Install Python packages
echo "🐍 Installing Python packages..."
pip install --quiet \
    agent-framework \
    azure-ai-projects \
    azure-identity \
    semantic-kernel \
    openai \
    python-dotenv \
    black \
    pylint \
    ipykernel \
    jupyter \
    azure-monitor-opentelemetry \
    opentelemetry-api \
    opentelemetry-sdk \
    opentelemetry-exporter-otlp-proto-grpc \
    mcp

# Install .NET packages (if doing .NET labs)
echo "⚙️ Restoring .NET packages..."
if [ -d "dotnet-labs" ]; then
    cd dotnet-labs
    dotnet restore --verbosity quiet
    cd ..
fi

# Install Node.js packages for MCP inspector
echo "📦 Installing Node.js packages..."
npm install -g @modelcontextprotocol/inspector

# Setup Azure CLI extensions
echo "☁️ Installing Azure CLI extensions..."
az extension add --name azure-devops --only-show-errors 2>/dev/null || true

# Create workspace structure
echo "📁 Creating workspace structure..."
mkdir -p lab1 lab2 lab3 hackathon support

# Create .env template if it doesn't exist
if [ ! -f ".env" ]; then
    echo "📝 Creating .env template..."
    cat > .env << 'EOF'
# Azure OpenAI Configuration
AZURE_OPENAI_ENDPOINT=https://YOUR-RESOURCE.openai.azure.com
AZURE_OPENAI_API_KEY=YOUR-API-KEY-HERE
AZURE_OPENAI_RESPONSES_DEPLOYMENT_NAME=gpt-4o-mini
AZURE_OPENAI_API_VERSION=2024-08-01-preview

# Azure AI Foundry Configuration
AZURE_AI_PROJECT_ENDPOINT=https://YOUR-PROJECT.foundry.azure.com
AZURE_SUBSCRIPTION_ID=YOUR-SUBSCRIPTION-ID
AZURE_RESOURCE_GROUP=YOUR-RESOURCE-GROUP

# Application Insights (for observability)
APPLICATION_INSIGHTS_CONNECTION_STRING=InstrumentationKey=YOUR-KEY;IngestionEndpoint=https://YOUR-REGION.in.applicationinsights.azure.com/

# GitHub Configuration (for MCP labs)
GITHUB_PERSONAL_ACCESS_TOKEN=YOUR-GITHUB-PAT

# Optional: Azure Functions
AZURE_FUNCTIONS_ENVIRONMENT=Development
EOF
    echo "✅ Created .env template - Please configure with your values"
fi

# Create README in workspace root
if [ ! -f "README.md" ]; then
    echo "📝 Creating workspace README..."
    cat > README.md << 'EOF'
# Microsoft Agent Framework Workshop

Welcome to the Microsoft Agent Framework Workshop!

## 🎯 Quick Start

1. **Configure Environment**:
   ```bash
   # Copy and edit .env file with your credentials
   cp .env.example .env
   # Edit with: code .env
   ```

2. **Authenticate with Azure**:
   ```bash
   az login
   az account set --subscription YOUR-SUBSCRIPTION-ID
   ```

3. **Verify Setup**:
   ```bash
   python -c "import agent_framework; print('✅ Agent Framework installed')"
   az account show
   ```

## 📚 Labs

- **Lab 1**: Building Multi-Agent Systems → `lab1/`
- **Lab 2**: MCP Integration → `lab2/`
- **Lab 3**: Azure AI Foundry Observability → `lab3/`
- **Hackathon**: Build Your Solution → `hackathon/`

## 🔧 Useful Commands

```bash
# Run a lab
python lab1/01_basic_agent.py

# Start Aspire Dashboard (for observability)
docker run --rm -it -p 18888:18888 -p 4317:18889 \
  mcr.microsoft.com/dotnet/aspire-dashboard:latest

# Test MCP server
npx @modelcontextprotocol/inspector docker run -i --rm \
  -e GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_PERSONAL_ACCESS_TOKEN \
  ghcr.io/github/github-mcp-server
```

## 📖 Resources

- Workshop Guide: `workshop-lab-structure.md`
- Resource Links: `vicente-workshop-resources.md`
- Cheat Sheet: `support/agent-framework-cheatsheet.md`
- Troubleshooting: `support/troubleshooting.md`

## 🆘 Getting Help

1. Check the troubleshooting guide
2. Ask your instructor
3. Consult the documentation: https://learn.microsoft.com/agent-framework/

Happy coding! 🚀
EOF
fi

# Test Azure CLI login status
echo "🔐 Checking Azure CLI authentication..."
if az account show &>/dev/null; then
    echo "✅ Azure CLI authenticated"
    az account show --output table
else
    echo "⚠️  Azure CLI not authenticated. Run 'az login' when ready."
fi

# Pull Docker images that might be needed
echo "🐳 Pulling Docker images (this may take a few minutes)..."
docker pull mcr.microsoft.com/dotnet/aspire-dashboard:latest &
docker pull ghcr.io/github/github-mcp-server &
wait

# Create a simple test script
cat > test_setup.py << 'EOF'
#!/usr/bin/env python3
"""Test script to verify workshop environment setup"""

import sys

def test_imports():
    """Test that all required packages are installed"""
    packages = [
        'agent_framework',
        'azure.identity',
        'azure.ai.projects',
        'semantic_kernel',
        'opentelemetry',
        'mcp'
    ]
    
    print("🧪 Testing package imports...")
    failed = []
    
    for package in packages:
        try:
            __import__(package)
            print(f"  ✅ {package}")
        except ImportError as e:
            print(f"  ❌ {package}: {e}")
            failed.append(package)
    
    if failed:
        print(f"\n❌ Failed to import: {', '.join(failed)}")
        return False
    else:
        print("\n✅ All packages imported successfully!")
        return True

def test_azure_cli():
    """Test Azure CLI installation"""
    import subprocess
    print("\n🧪 Testing Azure CLI...")
    try:
        result = subprocess.run(['az', '--version'], 
                              capture_output=True, 
                              text=True, 
                              timeout=5)
        if result.returncode == 0:
            print("  ✅ Azure CLI installed")
            return True
        else:
            print("  ❌ Azure CLI error")
            return False
    except Exception as e:
        print(f"  ❌ Azure CLI not found: {e}")
        return False

def test_docker():
    """Test Docker installation"""
    import subprocess
    print("\n🧪 Testing Docker...")
    try:
        result = subprocess.run(['docker', '--version'], 
                              capture_output=True, 
                              text=True, 
                              timeout=5)
        if result.returncode == 0:
            print("  ✅ Docker installed")
            return True
        else:
            print("  ❌ Docker error")
            return False
    except Exception as e:
        print(f"  ❌ Docker not found: {e}")
        return False

def main():
    print("=" * 60)
    print("Microsoft Agent Framework Workshop - Environment Test")
    print("=" * 60)
    
    results = []
    results.append(test_imports())
    results.append(test_azure_cli())
    results.append(test_docker())
    
    print("\n" + "=" * 60)
    if all(results):
        print("✅ Environment setup complete! You're ready to start.")
        return 0
    else:
        print("⚠️  Some components failed. Check errors above.")
        return 1

if __name__ == "__main__":
    sys.exit(main())
EOF

chmod +x test_setup.py

echo ""
echo "=" * 60
echo "✅ Setup Complete!"
echo "=" * 60
echo ""
echo "🧪 Run environment test:"
echo "   python test_setup.py"
echo ""
echo "🔐 Authenticate with Azure:"
echo "   az login"
echo ""
echo "📖 View workshop materials:"
echo "   code workshop-lab-structure.md"
echo ""
echo "🚀 Start with Lab 1:"
echo "   cd lab1"
echo ""
echo "Happy coding! 🎉"
