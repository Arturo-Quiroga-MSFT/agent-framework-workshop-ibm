# GitHub Codespaces Configuration for Microsoft Agent Framework Workshop

This directory contains the configuration for running the workshop in GitHub Codespaces.

## 📋 What's Included

### Container Configuration (`devcontainer.json`)
- **Base Image**: Python 3.11 development container
- **Additional Runtimes**: 
  - .NET 8.0 (for C# labs)
  - Node.js 20 (for MCP tools)
  - Docker-in-Docker (for MCP servers)
- **Azure CLI**: Pre-installed with extensions
- **VS Code Extensions**: 
  - Python, Pylance, Jupyter
  - Azure extensions
  - GitHub Copilot
  - Docker support
  - C# support

### Setup Script (`setup.sh`)
Automatically runs after container creation to:
1. Install all Python dependencies
2. Configure .NET packages
3. Install MCP inspector
4. Create workspace structure
5. Generate `.env` template
6. Pull required Docker images
7. Create test scripts

## 🚀 Quick Start for Workshop Participants

### 1. Open in Codespaces

Click the "Open in Codespaces" button or:

```bash
# From GitHub repository
Click "Code" → "Codespaces" → "Create codespace on main"
```

### 2. Wait for Setup

The container will automatically:
- Build the environment (~5 minutes first time)
- Install all dependencies
- Create lab folders
- Configure tools

### 3. Configure Azure Credentials

```bash
# Authenticate with Azure
az login --use-device-code

# Set your subscription
az account set --subscription YOUR-SUBSCRIPTION-ID

# Verify
az account show
```

### 4. Configure Environment Variables

```bash
# Edit the .env file
code .env

# Add your credentials:
# - Azure OpenAI endpoint and key
# - Azure AI Foundry project endpoint
# - Application Insights connection string
# - GitHub personal access token
```

### 5. Test Setup

```bash
# Run the environment test
python test_setup.py

# Should show:
# ✅ All packages imported successfully!
# ✅ Azure CLI installed
# ✅ Docker installed
```

### 6. Start Lab 1

```bash
cd lab1
code 01_basic_agent.py
```

## 🔧 Features

### Pre-configured Ports

| Port | Purpose | Auto-Forward |
|------|---------|--------------|
| 18888 | Aspire Dashboard | Notify |
| 4317 | OTLP Endpoint | Silent |
| 8000 | Web Applications | Open Browser |
| 7071 | Azure Functions | Notify |

### VS Code Settings

- Auto-save enabled
- Format on save with Black
- Auto-organize imports
- Pylint linting enabled
- Jupyter support

### Mounted Volumes

- Azure credentials (`~/.azure`) mounted for seamless auth
- Workspace folder accessible at `${containerWorkspaceFolder}`

## 📦 Installed Packages

### Python
```
agent-framework
azure-ai-projects
azure-identity
semantic-kernel
openai
azure-monitor-opentelemetry
opentelemetry-api
opentelemetry-sdk
mcp
jupyter
black
pylint
```

### Node.js
```
@modelcontextprotocol/inspector
```

### .NET
```
Microsoft.Agents.AI.OpenAI
Azure.AI.Projects
Azure.Identity
Microsoft.SemanticKernel
OpenTelemetry
```

## 🐳 Docker Images

Pre-pulled for quick access:
- `mcr.microsoft.com/dotnet/aspire-dashboard:latest` - For observability
- `ghcr.io/github/github-mcp-server` - For MCP labs

## 🔐 Security Notes

1. **Never commit `.env` file** - Contains secrets
2. **Use device code flow** - For Azure authentication in Codespaces
3. **Rotate tokens regularly** - Especially GitHub PAT
4. **Limit token scopes** - Only grant necessary permissions

## 🛠️ Customization

### Adding Python Packages

```bash
# In the Codespace terminal
pip install package-name

# Or add to setup.sh for all participants
```

### Adding VS Code Extensions

Edit `devcontainer.json`:
```json
"customizations": {
  "vscode": {
    "extensions": [
      "publisher.extension-id"
    ]
  }
}
```

### Changing Python Version

Edit `devcontainer.json`:
```json
"image": "mcr.microsoft.com/devcontainers/python:3.12"
```

## 🧪 Testing the Configuration Locally

```bash
# Install VS Code Dev Containers extension
# Open command palette (Ctrl+Shift+P)
# Run: "Dev Containers: Reopen in Container"
```

## 📊 Resource Requirements

- **CPU**: 2 cores minimum, 4 cores recommended
- **Memory**: 4 GB minimum, 8 GB recommended
- **Storage**: 32 GB minimum
- **Network**: Stable internet for Azure/GitHub access

## ⚡ Performance Tips

1. **Prebuilds**: Enable GitHub Codespaces prebuilds for faster startup
2. **Image Caching**: Docker images are pulled during setup to avoid delays
3. **Package Cache**: pip uses wheel cache for faster installs
4. **Parallel Setup**: Multiple tasks run concurrently in setup.sh

## 🐛 Troubleshooting

### Codespace Won't Start

1. Check GitHub Codespaces status
2. Try deleting and recreating the codespace
3. Check repository permissions

### Setup Script Fails

```bash
# Re-run setup manually
bash .devcontainer/setup.sh

# Check logs
cat /tmp/setup.log
```

### Azure CLI Not Authenticated

```bash
# Use device code flow (better for Codespaces)
az login --use-device-code

# Or use service principal
az login --service-principal \
  --username $AZURE_CLIENT_ID \
  --password $AZURE_CLIENT_SECRET \
  --tenant $AZURE_TENANT_ID
```

### Docker Not Working

```bash
# Restart Docker daemon
sudo systemctl restart docker

# Or rebuild container
# Command Palette → "Dev Containers: Rebuild Container"
```

## 📚 Additional Resources

- [VS Code Dev Containers](https://code.visualstudio.com/docs/devcontainers/containers)
- [GitHub Codespaces Docs](https://docs.github.com/en/codespaces)
- [Devcontainer Features](https://containers.dev/features)

## 🔄 Updating Configuration

After making changes to `devcontainer.json`:

```bash
# Rebuild container
# Command Palette (F1) → "Dev Containers: Rebuild Container"
```

## 💰 Cost Considerations

GitHub Codespaces pricing:
- Free tier: 120 core-hours/month (60 hours on 2-core)
- After free tier: ~$0.18/hour for 2-core machine

**Tips to reduce costs**:
1. Stop codespaces when not in use
2. Set auto-stop timeout (default 30 min)
3. Delete unused codespaces
4. Use smaller machine types for simple tasks

---

**Last Updated**: November 4, 2025  
**Maintained By**: Workshop Team  
**Version**: 1.0
