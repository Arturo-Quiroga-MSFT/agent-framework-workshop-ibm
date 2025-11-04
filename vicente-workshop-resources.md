# Microsoft Agent Framework Workshop Resources for IBM Brazil

**Prepared for**: Vicente Macial Junior  
**Date**: November 4, 2025  
**Purpose**: Multi-Agent Solutions Workshop with IBM Brazil

## Overview

This document provides comprehensive resources for a hands-on workshop on Microsoft Agent Framework, focusing on multi-agent solutions, MCP (Model Context Protocol) integration, and Azure AI Foundry observability.

---

## Core Microsoft Agent Framework Repositories

### 1. Microsoft Agent Framework (Main Repository)
- **Repository**: https://github.com/microsoft/agent-framework
- **Description**: The official Microsoft multi-language framework for building, orchestrating, and deploying AI agents (Python & .NET)
- **Key Features**: 
  - Multi-agent workflows with graph-based orchestration
  - Built-in OpenTelemetry observability
  - MCP (Model Context Protocol) support
  - DevUI for interactive development and debugging
- **Languages**: Python and C#/.NET with consistent APIs
  
### 2. Azure-Samples/azureai-samples
- **Repository**: https://github.com/Azure-Samples/azureai-samples
- **Description**: Official Azure AI samples with comprehensive agent examples
- **Key Sections**:
  - **Agent samples**: `/scenarios/Agents/samples/`
  - **Multi-agent examples**: `/scenarios/Assistants/multi-agent/`
  - **Agent tracing**: `/scenarios/agent-tracing/`
  - **MCP integration**: `/scenarios/Agents/samples/semantic-kernel-mcp/`
  - **Setup templates**: `/scenarios/Agents/setup/` (basic, standard, network-secured)

### 3. Microsoft Semantic Kernel
- **Repository**: https://github.com/microsoft/semantic-kernel
- **Description**: Enterprise-ready orchestration framework with multi-agent support and MCP integration
- **Stars**: 26.6k+ ⭐
- **Relevance**: Integrates seamlessly with Agent Framework and supports MCP plugins
- **Key Features**:
  - Model-agnostic SDK
  - Plugin ecosystem (MCP, OpenAPI, native code)
  - Multi-agent system orchestration
  - Vector DB support

---

## Specific Lab Resources by Topic

### Lab 1: Simple Multi-Agent Solution

#### Starting Point Repositories
**Python**:
- Basic agents: https://github.com/microsoft/agent-framework/tree/main/python/samples/getting_started/agents
- Workflows: https://github.com/microsoft/agent-framework/tree/main/python/samples/getting_started/workflows
- Multi-agent example: https://github.com/Azure-Samples/azureai-samples/tree/main/scenarios/Assistants/multi-agent

**C#/.NET**:
- Basic agents: https://github.com/microsoft/agent-framework/tree/main/dotnet/samples/GettingStarted/Agents
- Workflows: https://github.com/microsoft/agent-framework/tree/main/dotnet/samples/GettingStarted/Workflows
- Agent providers: https://github.com/microsoft/agent-framework/tree/main/dotnet/samples/GettingStarted/AgentProviders

#### What's Included
- Basic agent creation with Azure OpenAI
- Agent-to-agent communication patterns
- Tool/function calling
- Multi-agent orchestration with proxy agents
- Specialized agent roles (e.g., DALL-E, Vision, Billing, Refund)
- Thread management across agents

#### Key Concepts to Cover
1. Agent initialization with instructions
2. Creating threads for conversation management
3. Message dispatch between agents
4. Tool execution and function calling
5. Agent collaboration patterns

### Lab 2: MCP (Model Context Protocol) Integration

#### Starting Point Repositories
- **Semantic Kernel + MCP**: https://github.com/Azure-Samples/azureai-samples/tree/main/scenarios/Agents/samples/semantic-kernel-mcp
- **Agent Framework Documentation**: https://learn.microsoft.com/agent-framework/tutorials/agents/agent-as-mcp-tool

#### Sample Files
1. **agent_with_stdio_server.py** - GitHub MCP server integration via stdio
2. **agent_with_sse_server.py** - SSE-based MCP server integration
3. Both samples show Azure AI Foundry Agent Service + Semantic Kernel

#### What's Included
- Using MCP servers with agents
- Exposing agents as MCP tools
- GitHub MCP server integration (repository access, issue triage)
- STDIO and SSE transport protocols
- MCP plugin creation in Semantic Kernel

#### Key Concepts to Cover
1. MCP protocol fundamentals
2. Creating MCP plugins from servers
3. Agent-as-tool patterns
4. Tool discovery and invocation
5. Security and authentication for MCP servers

#### Sample Use Cases
- GitHub issue triage agent
- Repository analysis and PR suggestions
- Code review automation
- Multi-repository orchestration

### Lab 3: Azure AI Foundry Observability

#### Starting Point Repositories
**Python**:
- Tracing samples: https://github.com/Azure-Samples/azureai-samples/tree/main/scenarios/Agents/samples/tracing
- OpenAI Agents tracing: https://github.com/Azure-Samples/azureai-samples/tree/main/scenarios/agent-tracing/openai-agents
- LangChain tracing: https://github.com/Azure-Samples/azureai-samples/tree/main/scenarios/agent-tracing/langchain

**C#/.NET**:
- Agent OpenTelemetry: https://github.com/microsoft/agent-framework/tree/main/dotnet/samples/GettingStarted/AgentOpenTelemetry

#### Documentation
- Tutorial: https://learn.microsoft.com/agent-framework/tutorials/agents/enable-observability
- User guide: https://learn.microsoft.com/agent-framework/user-guide/agents/agent-observability

#### What's Included
- OpenTelemetry integration (automatic)
- Azure Monitor/Application Insights export
- Console exporter for local development
- Distributed tracing for multi-agent systems
- Token usage metrics
- Function invocation tracking

#### Key Telemetry Data Collected

**Spans Created**:
1. `invoke_agent <agent_name>` - Top-level span with metadata
2. `chat <model_name>` - Model invocation with prompts/responses
3. `execute_tool <function_name>` - Function execution details

**Metrics Collected**:
1. `gen_ai.client.operation.duration` (histogram)
2. `gen_ai.client.token.usage` (histogram)
3. `agent_framework.function.invocation.duration` (histogram)

#### Key Concepts to Cover
1. OpenTelemetry fundamentals
2. Automatic instrumentation setup
3. Azure Monitor integration
4. Sensitive data handling
5. Debugging with traces
6. Performance optimization using metrics

---

## Additional Resources

### Official Documentation
- **Agent Framework Overview**: https://learn.microsoft.com/agent-framework/overview/agent-framework-overview
- **Quick Start**: https://learn.microsoft.com/agent-framework/tutorials/quick-start
- **Tutorials**: https://learn.microsoft.com/agent-framework/tutorials/overview
- **User Guide**: https://learn.microsoft.com/agent-framework/user-guide/overview
- **Multi-agent Training Module**: https://learn.microsoft.com/training/modules/develop-multi-agent-azure-ai-foundry/

### Migration Guides
- From Semantic Kernel: https://learn.microsoft.com/agent-framework/migration-guide/from-semantic-kernel
- From AutoGen: https://learn.microsoft.com/agent-framework/migration-guide/from-autogen

### Sample End-to-End Applications
1. **Travel Agent (Python)**: https://github.com/Azure-Samples/azureai-travel-agent-python
   - Complete agent service integration
   - File search and tool usage
   
2. **Contoso Chat**: https://github.com/Azure-Samples/contoso-chat
   - RAG-based retail copilot
   - Built with Prompty & Azure AI Studio
   
3. **Contoso Creative Writer**: https://github.com/Azure-Samples/contoso-creative-writer
   - Multi-agent creative writing solution
   - Advanced orchestration patterns

### Azure AI Agent Service Resources
**Python SDK Samples**: https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/ai/azure-ai-projects/samples/agents  
**C# SDK Samples**: https://github.com/Azure/azure-sdk-for-net/tree/main/sdk/ai/Azure.AI.Projects/tests/Samples/Agent

### Community and Support
- **Discord**: https://discord.gg/b5zjErwbQM (Microsoft Azure AI Foundry)
- **GitHub Discussions**: https://github.com/microsoft/agent-framework/discussions
- **MS Learn Documentation**: https://learn.microsoft.com/agent-framework/

---

## GitHub Codespaces Approach

### Why GitHub Codespaces is Excellent for This Workshop

✅ **Zero setup time** - Attendees can start coding immediately  
✅ **Consistent environment** - Everyone has identical configuration  
✅ **Pre-configured dependencies** - All packages and tools ready  
✅ **Azure authentication** - Can be pre-configured or guided  
✅ **Cost-effective** - Free tier available, easy resource management  
✅ **Accessible** - Works from any device with a browser  

### Implementation Strategy

1. **Fork** the `Azure-Samples/azureai-samples` repository
2. **Add** comprehensive `.devcontainer` configuration
3. **Pre-configure** all required tools and VS Code extensions
4. **Create** step-by-step README files for each lab
5. **Include** sample `.env.template` files with clear instructions
6. **Test** the complete flow before the workshop

---

## Workshop Prerequisites

### Participant Requirements
- GitHub account (for Codespaces access)
- Basic Python or C# knowledge
- Understanding of REST APIs and JSON
- Familiarity with AI/ML concepts (helpful but not required)

### Azure Resources Needed
- Azure subscription (can use free tier or Azure Pass)
- Azure AI Foundry project setup
- Azure OpenAI service deployment (gpt-4o or gpt-4o-mini)
- Application Insights instance (for observability lab)

### Optional Setup
- Azure CLI installed (for local development)
- Visual Studio Code with extensions
- Git client

---

## Quick Reference Links

```
Core Repositories:
├─ Agent Framework: https://github.com/microsoft/agent-framework
├─ Azure AI Samples: https://github.com/Azure-Samples/azureai-samples
└─ Semantic Kernel: https://github.com/microsoft/semantic-kernel

Lab Resources:
├─ Multi-Agent Examples: /scenarios/Assistants/multi-agent/
├─ MCP Integration: /scenarios/Agents/samples/semantic-kernel-mcp/
├─ Observability: /scenarios/agent-tracing/
└─ Agent Setup: /scenarios/Agents/setup/

Documentation:
├─ Framework Docs: https://learn.microsoft.com/agent-framework/
├─ Training Module: https://learn.microsoft.com/training/modules/develop-multi-agent-azure-ai-foundry/
└─ API Reference: https://learn.microsoft.com/python/api/overview/azure/ai-projects-readme
```

---

## Recommended Technology Stack

### For Python Workshop
```python
# Core packages
agent-framework>=1.0.0
azure-ai-projects>=1.0.0
azure-identity>=1.15.0
semantic-kernel>=1.0.0

# Observability
opentelemetry-api>=1.20.0
opentelemetry-sdk>=1.20.0
azure-monitor-opentelemetry>=1.2.0

# MCP Support
mcp>=0.9.0
```

### For C# Workshop
```xml
<PackageReference Include="Microsoft.Agents.AI.OpenAI" Version="1.0.0-preview.*" />
<PackageReference Include="Azure.AI.Projects" Version="1.0.0-preview.*" />
<PackageReference Include="Azure.Identity" Version="1.11.0" />
<PackageReference Include="Microsoft.SemanticKernel.Agents.Core" Version="1.0.0" />
<PackageReference Include="OpenTelemetry" Version="1.7.0" />
<PackageReference Include="Azure.Monitor.OpenTelemetry.Exporter" Version="1.2.0" />
```

---

## Success Metrics for Workshop

1. ✅ All participants can create and run a basic agent
2. ✅ Successfully implement multi-agent communication
3. ✅ Integrate at least one MCP server
4. ✅ View traces in Azure Monitor or console
5. ✅ Complete mini-hackathon project demonstrating learned concepts

---

## Next Steps

1. Review the detailed lab structure in `workshop-lab-structure.md`
2. Check the GitHub Codespaces configuration in `.devcontainer/`
3. Review sample solutions in respective lab folders
4. Test the complete workshop flow
5. Prepare presentation slides with architecture diagrams

---

**Prepared by**: Arturo Quiroga  
**For**: Vicente Macial Junior - IBM Brazil  
**Date**: November 4, 2025
