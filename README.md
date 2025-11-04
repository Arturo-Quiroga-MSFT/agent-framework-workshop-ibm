# Microsoft Agent Framework Workshop for IBM Brazil

**Workshop Lead**: Vicente Macial Junior  
**Created by**: Arturo Rafael Quiroga Magana, Sr Partner Solutions Architect, Microsoft EPS Americas  
**Date**: [To be scheduled]  
**Duration**: 6-7 hours (with breaks)

## 🎯 Workshop Overview

This hands-on workshop will teach you how to build production-ready multi-agent AI systems using Microsoft Agent Framework, with a focus on:

1. **Multi-Agent Orchestration** - Building specialized agents that work together
2. **MCP Integration** - Connecting agents to external services via Model Context Protocol
3. **Azure AI Foundry Observability** - Monitoring and debugging agent systems in production

By the end of this workshop, you'll be able to design, build, and deploy intelligent multi-agent solutions for real-world business scenarios.

## 📚 Workshop Materials

| Document | Description |
|----------|-------------|
| [Workshop Resources](./vicente-workshop-resources.md) | Complete resource guide with GitHub repos and docs |
| [Lab Structure](./workshop-lab-structure.md) | Detailed lab instructions and exercises |
| [Codespaces Setup](./.devcontainer/README.md) | GitHub Codespaces configuration guide |

## 🚀 Quick Start (For Participants)

### Option 1: GitHub Codespaces (Recommended)

**Best for**: Zero-setup, consistent environment for all participants

1. **Open this repository in Codespaces**:
   - Click the green "Code" button
   - Select "Codespaces" tab
   - Click "Create codespace on main"
   - Wait 3-5 minutes for setup

2. **Authenticate with Azure**:
   ```bash
   az login --use-device-code
   az account set --subscription YOUR-SUBSCRIPTION-ID
   ```

3. **Configure environment**:
   ```bash
   # Edit .env file with your credentials
   code .env
   ```

4. **Test setup**:
   ```bash
   python test_setup.py
   ```

5. **Start Lab 1**:
   ```bash
   cd lab1
   code 01_basic_agent.py
   ```

### Option 2: Local Development

**Best for**: Experienced developers who prefer local environment

#### Prerequisites
- Python 3.10 or later
- .NET 8.0 SDK (for C# labs)
- Node.js 18 or later
- Docker Desktop
- Azure CLI
- VS Code with extensions:
  - Python
  - Azure Account
  - GitHub Copilot (optional)

#### Setup Steps

1. **Clone repository**:
   ```bash
   git clone <repository-url>
   cd workshop-repository
   ```

2. **Install Python dependencies**:
   ```bash
   python -m venv .venv
   source .venv/bin/activate  # Windows: .venv\Scripts\activate
   pip install -r requirements.txt
   ```

3. **Install .NET dependencies** (if doing C# labs):
   ```bash
   cd dotnet-labs
   dotnet restore
   cd ..
   ```

4. **Authenticate with Azure**:
   ```bash
   az login
   az account set --subscription YOUR-SUBSCRIPTION-ID
   ```

5. **Configure environment**:
   ```bash
   cp .env.example .env
   # Edit .env with your credentials
   ```

6. **Test setup**:
   ```bash
   python test_setup.py
   ```

## 📋 Prerequisites

### Knowledge Prerequisites
- Basic understanding of Python or C#
- Familiarity with REST APIs and JSON
- Basic understanding of AI/ML concepts (helpful but not required)
- Experience with Azure (helpful but not required)

### Azure Resources Required

You'll need access to the following Azure resources:

1. **Azure OpenAI Service**
   - Deployed model: `gpt-4o` or `gpt-4o-mini`
   - Endpoint and API key

2. **Azure AI Foundry Project** (recommended)
   - Project endpoint
   - Connected Azure OpenAI service

3. **Application Insights** (for Lab 3)
   - Connection string

**Don't have Azure resources?** Contact the workshop organizer for access to shared resources.

### GitHub Resources

For Lab 2 (MCP Integration):
- GitHub account
- Personal Access Token with `repo` and `read:org` scopes
- [Create token here](https://github.com/settings/tokens)

## 🗂️ Workshop Structure

### Morning Session (3.5 hours)

#### Lab 1: Multi-Agent Systems (90 min)
**Learning Objectives**:
- Create and configure AI agents
- Implement function calling
- Build multi-agent orchestration patterns

**Key Concepts**:
- Agent specialization
- Tool/function calling
- Proxy pattern for coordination
- Conversation threading

**Deliverables**:
- Working single agent with tools
- Multi-agent system with coordinator

#### Lab 2: MCP Integration (75 min)
**Learning Objectives**:
- Understand Model Context Protocol
- Integrate MCP servers with agents
- Create custom MCP tools

**Key Concepts**:
- MCP architecture
- STDIO and SSE transports
- GitHub MCP server integration
- Exposing agents as MCP tools

**Deliverables**:
- Agent connected to GitHub via MCP
- Custom MCP tool created

### Afternoon Session (3.5 hours)

#### Lab 3: Observability (75 min)
**Learning Objectives**:
- Implement OpenTelemetry tracing
- Use Azure Monitor for production monitoring
- Analyze agent performance and costs

**Key Concepts**:
- Distributed tracing
- Spans and metrics
- Azure Monitor integration
- Performance optimization

**Deliverables**:
- Local observability with console
- Production monitoring with Azure Monitor

#### Mini Hackathon (120 min)
**Challenge**: Build a complete multi-agent solution

**Options**:
1. Technical Documentation Assistant
2. DevOps Automation Agent
3. Customer Service Command Center

**Requirements**:
- Multi-agent orchestration
- MCP integration
- Full observability
- Real-world use case

## 📁 Repository Structure

```
workshop-repository/
├── .devcontainer/              # GitHub Codespaces configuration
│   ├── devcontainer.json       # Container setup
│   ├── setup.sh                # Automated setup script
│   └── README.md               # Codespaces documentation
├── lab1/                       # Lab 1: Multi-Agent Systems
│   ├── 01_basic_agent.py
│   ├── 02_agent_with_tools.py
│   ├── 03_specialized_agents.py
│   └── 04_agent_orchestration.py
├── lab2/                       # Lab 2: MCP Integration
│   ├── 00_explore_mcp.md
│   ├── 01_github_mcp_setup.py
│   ├── 02_github_triage_agent.py
│   └── 03_agent_as_mcp_tool.py
├── lab3/                       # Lab 3: Observability
│   ├── 00_observability_concepts.md
│   ├── 01_console_observability.py
│   ├── 02_otlp_observability.py
│   ├── 03_azure_monitor_setup.md
│   └── 04_production_monitoring.py
├── hackathon/                  # Mini Hackathon
│   ├── starter_template.py
│   ├── challenge1_documentation_assistant.md
│   ├── challenge2_devops_agent.md
│   └── challenge3_customer_service.md
├── support/                    # Supporting materials
│   ├── agent-framework-cheatsheet.md
│   └── troubleshooting.md
├── solutions/                  # Sample solutions (reference)
│   ├── lab1/
│   ├── lab2/
│   └── lab3/
├── .env.example                # Environment template
├── .gitignore                  # Git ignore rules
├── requirements.txt            # Python dependencies
├── test_setup.py               # Environment test script
├── vicente-workshop-resources.md  # Complete resource guide
├── workshop-lab-structure.md   # Detailed lab instructions
└── README.md                   # This file
```

## 🔧 Useful Commands

### Agent Development

```bash
# Run a lab exercise
python lab1/01_basic_agent.py

# Run with environment variables
python -c "from dotenv import load_dotenv; load_dotenv()" && python lab1/01_basic_agent.py

# Run in interactive mode
python -i lab1/01_basic_agent.py
```

### Observability

```bash
# Start Aspire Dashboard (OTLP collector)
docker run --rm -it -p 18888:18888 -p 4317:18889 \
  mcr.microsoft.com/dotnet/aspire-dashboard:latest

# Access at: http://localhost:18888

# View traces in Azure Monitor
az monitor app-insights query \
  --app YOUR-APP-INSIGHTS \
  --analytics-query "traces | where operation_Name startswith 'invoke_agent'"
```

### MCP Tools

```bash
# Test GitHub MCP server
docker run -i --rm \
  -e GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_PERSONAL_ACCESS_TOKEN \
  ghcr.io/github/github-mcp-server

# Inspect MCP server tools
npx @modelcontextprotocol/inspector \
  docker run -i --rm \
  -e GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_PERSONAL_ACCESS_TOKEN \
  ghcr.io/github/github-mcp-server
```

### Azure CLI

```bash
# Login
az login

# List subscriptions
az account list --output table

# Set subscription
az account set --subscription YOUR-SUBSCRIPTION-ID

# Show current account
az account show

# List Azure OpenAI deployments
az cognitiveservices account deployment list \
  --name YOUR-OPENAI-RESOURCE \
  --resource-group YOUR-RG
```

## 🎓 Learning Path

### Beginner Track
1. Complete all Lab 1 exercises
2. Complete Lab 2 Part A & B (skip Part C)
3. Complete Lab 3 Part A & B (skip Part C)
4. Simple hackathon challenge

### Advanced Track
1. Complete all labs including challenges
2. Implement custom MCP server
3. Advanced observability with custom metrics
4. Complex hackathon challenge with multiple MCP servers

### Expert Track
1. Complete all labs
2. Build custom multi-agent framework features
3. Implement advanced orchestration patterns
4. Production-ready hackathon solution with CI/CD

## 📊 Success Criteria

By the end of the workshop, you should be able to:

- [ ] Create and configure AI agents with specific personalities
- [ ] Implement function calling/tools for agents
- [ ] Design multi-agent systems with specialized roles
- [ ] Integrate MCP servers (like GitHub) with agents
- [ ] Create custom MCP tools from agents
- [ ] Implement OpenTelemetry tracing locally
- [ ] Configure Azure Monitor for production observability
- [ ] Analyze agent performance and token usage
- [ ] Build a complete multi-agent solution
- [ ] Deploy and monitor agents in production

## 🆘 Getting Help

### During Workshop
1. **Raise hand** - Instructor or TA will assist
2. **Slack channel** - Post questions to workshop channel
3. **Peer help** - Collaborate with fellow participants

### After Workshop
1. **GitHub Issues** - [microsoft/agent-framework](https://github.com/microsoft/agent-framework/issues)
2. **Documentation** - [Microsoft Learn](https://learn.microsoft.com/agent-framework/)
3. **Discord** - [Azure AI Foundry Community](https://discord.gg/b5zjErwbQM)
4. **Stack Overflow** - Tag: `azure-ai-agent-service`

### Common Issues

See [support/troubleshooting.md](./support/troubleshooting.md) for solutions to common problems.

## 📖 Additional Resources

### Official Documentation
- **Agent Framework**: https://learn.microsoft.com/agent-framework/
- **Azure AI Foundry**: https://learn.microsoft.com/azure/ai-foundry/
- **Semantic Kernel**: https://learn.microsoft.com/semantic-kernel/

### Sample Applications
- **Travel Agent**: https://github.com/Azure-Samples/azureai-travel-agent-python
- **Contoso Chat**: https://github.com/Azure-Samples/contoso-chat
- **Creative Writer**: https://github.com/Azure-Samples/contoso-creative-writer

### Learning Modules
- **Multi-Agent Development**: https://learn.microsoft.com/training/modules/develop-multi-agent-azure-ai-foundry/
- **Azure AI Fundamentals**: https://learn.microsoft.com/training/paths/get-started-azure-ai/

## 🤝 Contributing

Found an issue or want to improve the workshop materials?

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📝 Feedback

We'd love to hear your feedback!

- **During workshop**: Use feedback form (link provided)
- **After workshop**: Email to [organizer-email]
- **Suggestions**: Open GitHub issue with "Enhancement" label

## 📜 License

This workshop is licensed under the MIT License. See LICENSE file for details.

Workshop materials utilize Microsoft Agent Framework and Azure services, which have their own terms of service.

## 👥 Credits

**Workshop Development**:
- Vicente Macial Junior - IBM Brazil PSA
- Arturo Quiroga - Technical Advisor

**Based On**:
- Microsoft Agent Framework (https://github.com/microsoft/agent-framework)
- Azure AI Foundry samples (https://github.com/Azure-Samples/azureai-samples)
- Microsoft Semantic Kernel (https://github.com/microsoft/semantic-kernel)

**Special Thanks**:
- Microsoft Agent Framework team
- Azure AI Foundry team
- IBM Brazil AI Community

---

## 🎬 Let's Get Started!

Ready to build amazing multi-agent AI solutions?

**Codespaces users**: Your environment is ready! Start with `cd lab1`

**Local users**: Run `python test_setup.py` to verify your setup

**Questions**: Check the [workshop-lab-structure.md](./workshop-lab-structure.md) for detailed instructions

**Good luck and have fun!** 🚀🤖

---

**Last Updated**: November 4, 2025  
**Version**: 1.0  
**For**: IBM Brazil Multi-Agent Workshop
