# Detailed Lab Structure for Microsoft Agent Framework Workshop

**Workshop Duration**: 6-7 hours (including breaks and mini-hackathon)  
**Target Audience**: IBM Technical Team - PSAs, Architects, Developers  
**Difficulty Level**: Intermediate  

---

## Workshop Agenda

### Morning Session (9:00 AM - 12:30 PM)

#### 9:00 - 9:30: Introduction & Setup (30 min)
- Workshop objectives and outcomes
- Microsoft Agent Framework overview
- GitHub Codespaces setup and verification
- Azure resources check

#### 9:30 - 11:00: Lab 1 - Building Your First Multi-Agent System (90 min)
- Part A: Single agent basics (30 min)
- Part B: Multi-agent communication (45 min)
- Q&A and troubleshooting (15 min)

#### 11:00 - 11:15: Break ☕

#### 11:15 - 12:30: Lab 2 - MCP Integration (75 min)
- Part A: Understanding MCP protocol (15 min)
- Part B: Integrating MCP servers (45 min)
- Part C: Creating custom MCP tools (15 min)

### Afternoon Session (1:30 PM - 5:00 PM)

#### 1:30 - 2:45: Lab 3 - Azure AI Foundry Observability (75 min)
- Part A: OpenTelemetry basics (15 min)
- Part B: Local observability setup (30 min)
- Part C: Azure Monitor integration (30 min)

#### 2:45 - 3:00: Break ☕

#### 3:00 - 5:00: Mini Hackathon (120 min)
- Challenge introduction (15 min)
- Team coding (90 min)
- Presentations and wrap-up (15 min)

---

## Lab 1: Building Your First Multi-Agent System

### Learning Objectives
By the end of this lab, participants will be able to:
- Create and configure AI agents using Agent Framework
- Implement tool/function calling in agents
- Design multi-agent communication patterns
- Orchestrate multiple specialized agents

### Part A: Single Agent Basics (30 min)

#### Step 1: Create Your First Agent (10 min)

**File**: `lab1/01_basic_agent.py`

```python
"""
Lab 1A - Step 1: Create a Basic Agent
Learn how to create and interact with a simple AI agent
"""

import asyncio
import os
from agent_framework.azure import AzureOpenAIResponsesClient
from azure.identity import AzureCliCredential

async def main():
    # TODO: Initialize the Azure OpenAI client
    # Hint: Use AzureOpenAIResponsesClient with AzureCliCredential
    
    # TODO: Create an agent with a specific personality
    # Instructions: "You are a helpful assistant specialized in cloud architecture"
    # Name: "CloudArchitectBot"
    
    # TODO: Ask the agent a question
    # Question: "What are the key benefits of multi-agent systems?"
    
    pass

if __name__ == "__main__":
    asyncio.run(main())
```

**Expected Output**:
```
Multi-agent systems offer several key benefits:
1. Modularity - Each agent handles specific tasks
2. Scalability - Add specialized agents as needed
3. Maintainability - Easier to debug focused components
...
```

**Key Concepts**:
- Agent initialization
- Credential management
- Async/await patterns
- Environment variables

#### Step 2: Add Function Tools (20 min)

**File**: `lab1/02_agent_with_tools.py`

```python
"""
Lab 1A - Step 2: Agent with Function Tools
Learn how to equip agents with custom capabilities
"""

import asyncio
from typing import Annotated
from agent_framework.azure import AzureOpenAIResponsesClient
from azure.identity import AzureCliCredential

# TODO: Create a function tool for weather lookup
def get_weather(
    location: Annotated[str, "The city name"]
) -> Annotated[str, "Weather information"]:
    """Gets the current weather for a location"""
    # Simulated weather data
    weather_data = {
        "São Paulo": "Sunny, 28°C",
        "Rio de Janeiro": "Partly cloudy, 30°C",
        "Brasília": "Clear, 26°C"
    }
    return weather_data.get(location, "Weather data not available")

# TODO: Create a function tool for calculating cloud costs
def calculate_azure_cost(
    vm_count: Annotated[int, "Number of VMs"],
    vm_size: Annotated[str, "VM size (small/medium/large)"]
) -> Annotated[str, "Estimated monthly cost"]:
    """Calculates estimated Azure VM costs"""
    cost_per_vm = {"small": 50, "medium": 150, "large": 400}
    total = vm_count * cost_per_vm.get(vm_size.lower(), 100)
    return f"Estimated monthly cost: ${total} USD"

async def main():
    # TODO: Create agent with tools
    # Hint: Pass tools list when creating the agent
    
    # TODO: Test weather tool
    # Question: "What's the weather in São Paulo?"
    
    # TODO: Test cost calculator
    # Question: "How much would 5 medium VMs cost per month?"
    
    pass

if __name__ == "__main__":
    asyncio.run(main())
```

**Challenge Questions**:
1. How does the agent decide which tool to call?
2. What happens if the tool parameters are incorrect?
3. Can an agent call multiple tools in sequence?

### Part B: Multi-Agent Communication (45 min)

#### Step 3: Create Specialized Agents (20 min)

**File**: `lab1/03_specialized_agents.py`

```python
"""
Lab 1B - Step 3: Specialized Agents
Create multiple agents with different expertise
"""

import asyncio
from agent_framework.azure import AzureOpenAIResponsesClient
from azure.identity import AzureCliCredential

async def create_technical_agent():
    """Creates an agent specialized in technical architecture"""
    # TODO: Create agent with technical expertise
    # Instructions: "You are a senior cloud architect..."
    pass

async def create_business_agent():
    """Creates an agent specialized in business value"""
    # TODO: Create agent with business focus
    # Instructions: "You are a business consultant..."
    pass

async def create_security_agent():
    """Creates an agent specialized in security"""
    # TODO: Create agent with security expertise
    # Instructions: "You are a security specialist..."
    pass

async def main():
    # TODO: Create all three agents
    
    # TODO: Ask each agent about implementing a cloud solution
    question = "We need to migrate a legacy application to Azure. What should we consider?"
    
    # TODO: Collect and compare responses
    pass

if __name__ == "__main__":
    asyncio.run(main())
```

**Key Learning**:
- Agent specialization patterns
- Instruction engineering
- Role-based agent design

#### Step 4: Agent Orchestration with Proxy Pattern (25 min)

**File**: `lab1/04_agent_orchestration.py`

```python
"""
Lab 1B - Step 4: Multi-Agent Orchestration
Implement a coordinator agent that routes requests to specialists
"""

import asyncio
from typing import Annotated
from agent_framework.azure import AzureOpenAIResponsesClient
from azure.identity import AzureCliCredential

# Specialist agents (created separately)
technical_agent = None
business_agent = None
security_agent = None

def consult_technical_expert(
    question: Annotated[str, "Technical question to ask"]
) -> Annotated[str, "Technical expert's response"]:
    """Consults the technical architecture expert"""
    # TODO: Call technical_agent with the question
    pass

def consult_business_expert(
    question: Annotated[str, "Business question to ask"]
) -> Annotated[str, "Business expert's response"]:
    """Consults the business value expert"""
    # TODO: Call business_agent with the question
    pass

def consult_security_expert(
    question: Annotated[str, "Security question to ask"]
) -> Annotated[str, "Security expert's response"]:
    """Consults the security specialist"""
    # TODO: Call security_agent with the question
    pass

async def main():
    global technical_agent, business_agent, security_agent
    
    # TODO: Initialize all specialist agents
    
    # TODO: Create coordinator agent with access to all specialists
    coordinator = # Create agent with all three functions as tools
    
    # TODO: Test with complex query requiring multiple experts
    query = """
    Our company wants to implement a multi-tenant SaaS solution on Azure.
    We need to understand the architecture, business model, and security considerations.
    """
    
    response = await coordinator.run(query)
    print(response)

if __name__ == "__main__":
    asyncio.run(main())
```

**Expected Behavior**:
1. Coordinator receives complex query
2. Identifies need for multiple specialist inputs
3. Calls each specialist agent via tools
4. Synthesizes comprehensive response

**Discussion Points**:
- When to use orchestration vs. direct agent calls?
- How to handle conflicting advice from specialists?
- Error handling in multi-agent systems

### Lab 1 Exercises & Challenges

**Exercise 1**: Add a "data_analyst_agent" to the specialist team  
**Exercise 2**: Implement conversation history across agent calls  
**Exercise 3**: Add error handling for failed agent invocations  
**Challenge**: Create a feedback loop where agents can critique each other's responses

---

## Lab 2: MCP (Model Context Protocol) Integration

### Learning Objectives
- Understand the MCP protocol and its benefits
- Integrate existing MCP servers with agents
- Create custom MCP tools
- Implement secure MCP communication

### Part A: Understanding MCP Protocol (15 min)

#### Introduction Presentation Topics
1. What is MCP and why it matters
2. MCP architecture: clients, servers, and transports
3. Use cases: GitHub integration, database access, API wrappers
4. Security considerations

#### Demo: Exploring an MCP Server
**File**: `lab2/00_explore_mcp.md`

```markdown
# MCP Server Exploration

## Available MCP Servers

1. **GitHub MCP Server**
   - Repository: https://github.com/modelcontextprotocol/servers/tree/main/src/github
   - Capabilities: Search repos, read files, create issues, list PRs
   - Transport: STDIO

2. **Azure MCP Server**
   - Repository: https://github.com/Azure/azure-mcp
   - Capabilities: Manage Azure resources via MCP
   - Transport: STDIO/SSE

## Exercise: Inspect MCP Server Tools

Use the following command to see what tools a server provides:

```bash
# List tools from GitHub MCP server
npx -y @modelcontextprotocol/inspector docker run -i --rm \
  -e GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_TOKEN \
  ghcr.io/github/github-mcp-server
```

**Questions**:
1. What tools does the server expose?
2. What parameters do the tools accept?
3. How are errors handled?
```

### Part B: Integrating MCP Servers (45 min)

#### Step 1: Setup GitHub MCP Server (15 min)

**File**: `lab2/01_github_mcp_setup.py`

```python
"""
Lab 2B - Step 1: GitHub MCP Server Setup
Connect an agent to GitHub via MCP
"""

import asyncio
import os
from azure.identity import AzureCliCredential
from semantic_kernel.agents import AzureAIAgent, AzureAIAgentSettings
from semantic_kernel.connectors.mcp import MCPStdioPlugin

async def main():
    # Step 1: Create GitHub Personal Access Token
    # Instructions:
    # 1. Go to https://github.com/settings/tokens
    # 2. Generate token with 'repo' and 'read:org' scopes
    # 3. Set as environment variable: GITHUB_PERSONAL_ACCESS_TOKEN
    
    # TODO: Create MCP plugin for GitHub
    github_plugin = MCPStdioPlugin(
        name="github",
        description="GitHub Plugin via MCP",
        command="docker",
        args=[
            "run", "-i", "--rm",
            "-e", "GITHUB_PERSONAL_ACCESS_TOKEN",
            "ghcr.io/github/github-mcp-server"
        ],
        env={"GITHUB_PERSONAL_ACCESS_TOKEN": os.getenv("GITHUB_PERSONAL_ACCESS_TOKEN")}
    )
    
    # TODO: Create Azure AI Agent with GitHub plugin
    async with (
        AzureCliCredential() as creds,
        AzureAIAgent.create_client(credential=creds) as client,
        github_plugin
    ):
        agent = AzureAIAgent(
            client=client,
            definition=await client.agents.create_agent(
                model=AzureAIAgentSettings.create().model_deployment_name,
                name="GitHubAgent",
                instructions="You help users interact with GitHub repositories.",
                plugins=[github_plugin]
            )
        )
        
        # TODO: Test the integration
        response = await agent.get_response(
            messages="List the open issues in the microsoft/agent-framework repository"
        )
        print(response.content)

if __name__ == "__main__":
    asyncio.run(main())
```

**Verification Steps**:
- [ ] GitHub token is set correctly
- [ ] MCP server container starts
- [ ] Agent receives GitHub tools
- [ ] Successfully queries GitHub data

#### Step 2: Build a GitHub Triage Agent (30 min)

**File**: `lab2/02_github_triage_agent.py`

```python
"""
Lab 2B - Step 2: GitHub Issue Triage Agent
Build an intelligent agent that triages GitHub issues
"""

import asyncio
import os
from azure.identity import AzureCliCredential
from semantic_kernel.agents import AzureAIAgent, AzureAIAgentSettings, AzureAIAgentThread
from semantic_kernel.connectors.mcp import MCPStdioPlugin

async def main():
    # TODO: Setup GitHub MCP plugin (from previous step)
    
    # TODO: Create issue triage agent
    instructions = """
    You are a GitHub Issue Triage Agent for the microsoft/semantic-kernel repository.
    
    Your responsibilities:
    1. Find issues tagged 'triage' and 'python'
    2. Analyze the issue description
    3. Suggest appropriate assignees based on:
       - Recent PR activity in related areas
       - Committer history
       - Expertise shown in similar issues
    4. Provide context like related issues or suggested fixes
    
    Be thorough but concise in your recommendations.
    """
    
    async with (
        AzureCliCredential() as creds,
        AzureAIAgent.create_client(credential=creds) as client,
        github_plugin
    ):
        agent = AzureAIAgent(
            client=client,
            definition=await client.agents.create_agent(
                model=AzureAIAgentSettings.create().model_deployment_name,
                name="GitHubTriageAgent",
                instructions=instructions,
                plugins=[github_plugin]
            )
        )
        
        thread: AzureAIAgentThread = None
        
        # TODO: Interactive loop for triage tasks
        print("GitHub Triage Agent Ready!")
        print("Commands:")
        print("  - 'triage' - Find and triage untriaged Python issues")
        print("  - 'status <issue_number>' - Check issue status")
        print("  - 'exit' - Quit")
        
        while True:
            user_input = input("\nYou: ")
            
            if user_input.lower() == "exit":
                break
            elif user_input.lower() == "triage":
                query = "Find the latest untriaged, unassigned issues tagged with 'python' and suggest assignees"
            else:
                query = user_input
            
            response = await agent.get_response(messages=query, thread=thread)
            print(f"\nAgent: {response.content}")
            thread = response.thread

if __name__ == "__main__":
    asyncio.run(main())
```

**Expected Features**:
- Query GitHub issues via MCP
- Analyze issue content
- Search for relevant PRs
- Suggest assignees with justification
- Maintain conversation context

### Part C: Creating Custom MCP Tools (15 min)

#### Step 3: Expose Agent as MCP Tool

**File**: `lab2/03_agent_as_mcp_tool.py`

```python
"""
Lab 2B - Step 3: Expose Agent as MCP Tool
Make your agent available to other MCP clients
"""

import asyncio
from azure.identity import AzureCliCredential
from agent_framework.azure import AzureOpenAIResponsesClient
from mcp.server.stdio import stdio_server
import anyio

async def main():
    # TODO: Create a specialized agent
    client = AzureOpenAIResponsesClient(credential=AzureCliCredential())
    agent = client.create_agent(
        name="AzureCostAnalyzer",
        instructions="""
        You are an Azure cost analysis expert.
        Help users understand and optimize their Azure spending.
        """
    )
    
    # TODO: Expose agent as MCP server
    server = agent.as_mcp_server()
    
    # TODO: Start MCP server on stdio
    async def handle_stdin():
        async with stdio_server() as (read_stream, write_stream):
            await server.run(
                read_stream,
                write_stream,
                server.create_initialization_options()
            )
    
    print("MCP Server running on stdio...")
    print("Agent 'AzureCostAnalyzer' is now available as an MCP tool")
    await handle_stdin()

if __name__ == "__main__":
    anyio.run(main)
```

**Testing the MCP Tool**:
```bash
# In another terminal, test with MCP inspector
npx -y @modelcontextprotocol/inspector python lab2/03_agent_as_mcp_tool.py
```

### Lab 2 Exercises & Challenges

**Exercise 1**: Add the Azure MCP server to access Azure resources  
**Exercise 2**: Create an agent that uses both GitHub and Azure MCP servers  
**Exercise 3**: Implement error handling for MCP server disconnections  
**Challenge**: Build a PR review agent that comments on code quality

---

## Lab 3: Azure AI Foundry Observability

### Learning Objectives
- Understand OpenTelemetry fundamentals
- Implement local observability for debugging
- Integrate Azure Monitor for production monitoring
- Analyze agent performance and token usage

### Part A: OpenTelemetry Basics (15 min)

#### Conceptual Overview
**Topics to Cover**:
1. What is OpenTelemetry?
2. Traces, spans, and metrics
3. Distributed tracing in multi-agent systems
4. Semantic conventions for GenAI

#### Demo: Observing Agent Execution

**File**: `lab3/00_observability_concepts.md`

```markdown
# Observability Concepts

## Why Observability Matters for Agents

1. **Debugging**: See exactly what the agent is doing
2. **Performance**: Track latency and token usage
3. **Cost**: Monitor API calls and optimize spending
4. **Reliability**: Detect failures and bottlenecks
5. **Compliance**: Audit agent behavior

## OpenTelemetry Components

### Traces
- Represent the journey of a request
- Composed of spans (individual operations)
- Show parent-child relationships

### Spans
- `invoke_agent` - Top-level agent invocation
- `chat` - LLM call with prompts/responses
- `execute_tool` - Function execution

### Metrics
- `gen_ai.client.operation.duration` - Operation time
- `gen_ai.client.token.usage` - Token consumption
- `agent_framework.function.invocation.duration` - Tool execution time

## Exporters

1. **Console** - For local development
2. **OTLP** - For Aspire Dashboard, Jaeger, etc.
3. **Azure Monitor** - For production monitoring
```

### Part B: Local Observability Setup (30 min)

#### Step 1: Console Exporter (15 min)

**File**: `lab3/01_console_observability.py`

```python
"""
Lab 3B - Step 1: Console Observability
View agent traces in the console for local debugging
"""

import asyncio
from agent_framework.azure import AzureOpenAIResponsesClient
from agent_framework.observability import setup_observability
from azure.identity import AzureCliCredential

async def main():
    # TODO: Setup observability with console exporter
    setup_observability(
        exporter="console",
        enable_sensitive_data=True  # Show prompts/responses in dev
    )
    
    # TODO: Create agent with tools
    client = AzureOpenAIResponsesClient(credential=AzureCliCredential())
    
    def get_stock_price(symbol: str) -> str:
        """Gets the current stock price (simulated)"""
        prices = {"MSFT": "$420", "GOOGL": "$175", "AAPL": "$195"}
        return prices.get(symbol.upper(), "Unknown")
    
    agent = client.create_agent(
        name="StockAnalyst",
        instructions="You are a stock market analyst.",
        tools=[get_stock_price]
    )
    
    # TODO: Make requests and observe traces
    print("=" * 60)
    print("MAKING REQUEST 1")
    print("=" * 60)
    response1 = await agent.run("What's the price of Microsoft stock?")
    print(f"\nResponse: {response1}\n")
    
    print("=" * 60)
    print("MAKING REQUEST 2")
    print("=" * 60)
    response2 = await agent.run("Compare prices of MSFT and AAPL")
    print(f"\nResponse: {response2}\n")

if __name__ == "__main__":
    asyncio.run(main())
```

**Expected Console Output**:
```
==========================================================
MAKING REQUEST 1
==========================================================
{
  "name": "invoke_agent StockAnalyst",
  "context": {...},
  "kind": "SpanKind.INTERNAL",
  "parent_id": null,
  "start_time": "...",
  "end_time": "...",
  "attributes": {
    "agent.id": "...",
    "agent.name": "StockAnalyst",
    "gen_ai.system": "az.ai.agents"
  }
}
{
  "name": "chat gpt-4o-mini",
  "parent_id": "...",
  "attributes": {
    "gen_ai.request.model": "gpt-4o-mini",
    "gen_ai.response.finish_reasons": ["stop"],
    "gen_ai.usage.input_tokens": 45,
    "gen_ai.usage.output_tokens": 12
  }
}
{
  "name": "execute_tool get_stock_price",
  "parent_id": "...",
  "attributes": {
    "function.name": "get_stock_price",
    "function.parameters": "{\"symbol\": \"MSFT\"}",
    "function.result": "$420"
  }
}

Response: The current price of Microsoft stock is $420.
```

**Analysis Exercise**:
1. Count the total spans created
2. Calculate total token usage
3. Identify the critical path
4. Find the slowest operation

#### Step 2: OTLP Exporter with Aspire Dashboard (15 min)

**File**: `lab3/02_otlp_observability.py`

```python
"""
Lab 3B - Step 2: OTLP Observability
Send traces to Aspire Dashboard for visualization
"""

import asyncio
from agent_framework.azure import AzureOpenAIResponsesClient
from agent_framework.observability import setup_observability
from azure.identity import AzureCliCredential

async def main():
    # TODO: Setup observability with OTLP exporter
    # Aspire Dashboard default endpoint: http://localhost:4317
    setup_observability(
        exporter="otlp",
        otlp_endpoint="http://localhost:4317",
        enable_sensitive_data=True
    )
    
    # TODO: Create multi-agent system for better visualization
    client = AzureOpenAIResponsesClient(credential=AzureCliCredential())
    
    # Create specialized agents
    research_agent = client.create_agent(
        name="ResearchAgent",
        instructions="You research technical topics and provide detailed information."
    )
    
    summary_agent = client.create_agent(
        name="SummaryAgent",
        instructions="You create concise summaries of technical content."
    )
    
    # TODO: Orchestrated workflow
    query = "Explain microservices architecture"
    
    # Step 1: Research
    research_result = await research_agent.run(query)
    
    # Step 2: Summarize
    summary_query = f"Summarize this in 3 bullet points:\n{research_result}"
    summary_result = await summary_agent.run(summary_query)
    
    print(f"Summary:\n{summary_result}")

if __name__ == "__main__":
    asyncio.run(main())
```

**Setup Aspire Dashboard**:
```bash
# In a separate terminal
docker run --rm -it -p 18888:18888 -p 4317:18889 \
  mcr.microsoft.com/dotnet/aspire-dashboard:latest

# Access dashboard at http://localhost:18888
```

**Dashboard Exploration**:
1. View the distributed trace timeline
2. Examine span relationships
3. Filter by agent name
4. Analyze performance bottlenecks

### Part C: Azure Monitor Integration (30 min)

#### Step 3: Application Insights Setup (10 min)

**File**: `lab3/03_azure_monitor_setup.md`

```markdown
# Azure Monitor Setup

## Prerequisites

1. **Azure AI Foundry Project** with Application Insights enabled
2. **Connection String** from Application Insights resource

## Get Application Insights Connection String

### Method 1: Azure Portal
1. Go to Azure Portal
2. Navigate to your Application Insights resource
3. Click "Overview" → Copy "Connection String"

### Method 2: Azure CLI
```bash
az monitor app-insights component show \
  --app <app-insights-name> \
  --resource-group <rg-name> \
  --query connectionString -o tsv
```

### Method 3: From AI Foundry Project (Automatic)
```python
from agent_framework.azure import AzureAIAgentClient
from azure.identity import AzureCliCredential

client = AzureAIAgentClient(
    credential=AzureCliCredential(),
    project_endpoint="https://<project>.foundry.azure.com"
)

# Automatically retrieves and configures Application Insights
await client.setup_azure_ai_observability()
```

## Set Environment Variable

```bash
export APPLICATION_INSIGHTS_CONNECTION_STRING="InstrumentationKey=...;IngestionEndpoint=..."
```
```

#### Step 4: Production Monitoring (20 min)

**File**: `lab3/04_production_monitoring.py`

```python
"""
Lab 3C - Step 4: Production Monitoring with Azure Monitor
Full observability for production multi-agent systems
"""

import asyncio
import os
from typing import Annotated
from agent_framework.azure import AzureAIAgentClient, AzureOpenAIResponsesClient
from agent_framework.observability import setup_observability
from azure.identity import AzureCliCredential

# Simulated production workload
async def simulate_customer_support():
    """Simulates a customer support multi-agent system"""
    
    # TODO: Setup Azure Monitor observability
    # Option 1: Manual setup
    setup_observability(
        exporter="azure_monitor",
        connection_string=os.getenv("APPLICATION_INSIGHTS_CONNECTION_STRING"),
        enable_sensitive_data=False  # Disable in production for privacy
    )
    
    # Option 2: Automatic with AI Foundry (recommended)
    # client = AzureAIAgentClient(
    #     credential=AzureCliCredential(),
    #     project_endpoint=os.getenv("AZURE_AI_PROJECT_ENDPOINT")
    # )
    # await client.setup_azure_ai_observability()
    
    # TODO: Create agent system
    responses_client = AzureOpenAIResponsesClient(credential=AzureCliCredential())
    
    # Billing specialist
    def get_billing_info(customer_id: Annotated[str, "Customer ID"]) -> str:
        """Retrieves customer billing information"""
        return f"Customer {customer_id}: Balance $500, Last payment: Nov 1"
    
    def process_refund(customer_id: Annotated[str, "Customer ID"], amount: Annotated[float, "Amount"]) -> str:
        """Processes a refund request"""
        return f"Refund of ${amount} processed for customer {customer_id}. Will appear in 5-7 days."
    
    billing_agent = responses_client.create_agent(
        name="BillingAgent",
        instructions="You handle billing inquiries, charges, and payment issues.",
        tools=[get_billing_info]
    )
    
    refund_agent = responses_client.create_agent(
        name="RefundAgent",
        instructions="You assist with refund requests, check eligibility, and process refunds.",
        tools=[process_refund]
    )
    
    # Coordinator agent
    def consult_billing(query: Annotated[str, "Billing question"]) -> str:
        """Consults billing specialist"""
        return asyncio.run(billing_agent.run(query))
    
    def consult_refund(query: Annotated[str, "Refund question"]) -> str:
        """Consults refund specialist"""
        return asyncio.run(refund_agent.run(query))
    
    coordinator = responses_client.create_agent(
        name="CoordinatorAgent",
        instructions="""You are a customer support coordinator. 
        Route questions to billing or refund specialists as needed.
        Provide complete answers with information from specialists.""",
        tools=[consult_billing, consult_refund]
    )
    
    # TODO: Simulate customer interactions
    customer_queries = [
        "I was charged twice for my subscription last month.",
        "How much do I owe on my account?",
        "I want a refund for the duplicate charge.",
        "When will my refund be processed?",
        "What's my current balance after the refund?"
    ]
    
    print("Simulating customer support interactions...\n")
    
    for i, query in enumerate(customer_queries, 1):
        print(f"\n{'='*60}")
        print(f"CUSTOMER QUERY {i}")
        print(f"{'='*60}")
        print(f"Customer: {query}")
        
        response = await coordinator.run(query)
        print(f"Agent: {response}")
        
        # Add delay to simulate realistic timing
        await asyncio.sleep(2)
    
    print("\n" + "="*60)
    print("Simulation complete!")
    print("="*60)
    print("\nView traces in Azure Portal:")
    print("1. Go to Application Insights resource")
    print("2. Click 'Transaction search' or 'Application map'")
    print("3. Filter by operation name: 'invoke_agent'")
    print("4. Examine distributed traces and dependencies")

async def main():
    await simulate_customer_support()

if __name__ == "__main__":
    asyncio.run(main())
```

**Azure Portal Analysis**:

1. **Transaction Search**:
   - Filter: `operation_Name == "invoke_agent CoordinatorAgent"`
   - View end-to-end transaction
   - Check dependencies (billing/refund agents)
   - Identify slow operations

2. **Application Map**:
   - Visualize agent relationships
   - See call patterns
   - Identify bottlenecks

3. **Performance**:
   - Average duration per agent
   - Token usage trends
   - Error rates

4. **Custom Queries** (Kusto):
```kusto
// Average tokens per agent
traces
| where operation_Name startswith "invoke_agent"
| extend agentName = tostring(customDimensions.["agent.name"])
| summarize 
    avg_input_tokens = avg(todouble(customDimensions.["gen_ai.usage.input_tokens"])),
    avg_output_tokens = avg(todouble(customDimensions.["gen_ai.usage.output_tokens"]))
  by agentName

// Tool execution frequency
traces
| where operation_Name startswith "execute_tool"
| extend toolName = tostring(customDimensions.["function.name"])
| summarize count() by toolName
| order by count_ desc
```

### Lab 3 Exercises & Challenges

**Exercise 1**: Add custom metrics for business KPIs (e.g., customer satisfaction)  
**Exercise 2**: Create alerts for high token usage or slow operations  
**Exercise 3**: Build a dashboard showing agent performance  
**Challenge**: Implement cost tracking per customer interaction

---

## Mini Hackathon: Build a Complete Multi-Agent Solution

### Duration: 120 minutes (2 hours)

### Objective
Build a production-ready multi-agent system that demonstrates:
- Multi-agent orchestration
- MCP integration
- Full observability
- Real-world use case

### Challenge Options

#### Challenge 1: Technical Documentation Assistant 🤖📚

**Requirements**:
1. **Research Agent**: Uses MCP to search Microsoft Learn docs
2. **Code Agent**: Generates code samples in multiple languages
3. **Review Agent**: Reviews code for best practices
4. **Coordinator**: Orchestrates the workflow

**MCP Servers**:
- Microsoft Learn MCP server (if available) or GitHub MCP
- File system MCP for local docs

**Success Criteria**:
- [ ] User can ask: "Show me how to create an Azure Function in Python"
- [ ] System researches docs, generates code, reviews it
- [ ] Full trace visible in Azure Monitor
- [ ] Multi-language support (Python, C#, JavaScript)
- [ ] Code follows best practices

#### Challenge 2: DevOps Automation Agent 🚀🔧

**Requirements**:
1. **GitHub Agent**: Monitors repository via MCP
2. **Azure Agent**: Manages Azure resources via MCP
3. **Security Agent**: Scans for vulnerabilities
4. **Deployment Agent**: Orchestrates deployments

**MCP Servers**:
- GitHub MCP server
- Azure MCP server

**Success Criteria**:
- [ ] Detect new PR in repository
- [ ] Provision Azure resources for testing
- [ ] Run security scan
- [ ] Deploy and monitor
- [ ] Full observability of the pipeline

#### Challenge 3: Customer Service Command Center 📞💬

**Requirements**:
1. **Sentiment Agent**: Analyzes customer sentiment
2. **Knowledge Agent**: Searches documentation via MCP
3. **Ticket Agent**: Creates/updates support tickets
4. **Escalation Agent**: Determines when to escalate

**MCP Servers**:
- Custom ticketing system MCP
- Knowledge base MCP (could be file-based)

**Success Criteria**:
- [ ] Process customer queries with sentiment analysis
- [ ] Search relevant KB articles
- [ ] Auto-create tickets for issues
- [ ] Escalate urgent/negative sentiment cases
- [ ] Track metrics: resolution time, satisfaction

### Evaluation Criteria

| Criteria | Points | Description |
|----------|--------|-------------|
| **Functionality** | 30 | Does it work as described? |
| **Multi-Agent Design** | 20 | Effective agent specialization and orchestration |
| **MCP Integration** | 20 | Proper use of MCP servers |
| **Observability** | 15 | Complete traces and meaningful metrics |
| **Code Quality** | 10 | Clean, well-documented code |
| **Creativity** | 5 | Innovative features or approach |

### Submission

Each team will:
1. **Demo** (5 min): Live demonstration of the solution
2. **Code Review** (5 min): Walk through key components
3. **Observability** (3 min): Show Azure Monitor traces
4. **Q&A** (2 min): Answer questions

### Starter Template

**File**: `hackathon/starter_template.py`

```python
"""
Mini Hackathon Starter Template
Customize this template for your chosen challenge
"""

import asyncio
import os
from typing import Annotated
from agent_framework.azure import AzureOpenAIResponsesClient
from agent_framework.observability import setup_observability
from azure.identity import AzureCliCredential

# TODO: Setup observability
async def setup():
    """Initialize observability and authentication"""
    setup_observability(
        exporter="azure_monitor",
        connection_string=os.getenv("APPLICATION_INSIGHTS_CONNECTION_STRING")
    )

# TODO: Define your specialized agents
async def create_agents():
    """Create all specialized agents for your solution"""
    client = AzureOpenAIResponsesClient(credential=AzureCliCredential())
    
    # Agent 1
    agent1 = client.create_agent(
        name="Agent1Name",
        instructions="Your agent instructions...",
        tools=[]  # Add your tools
    )
    
    # Agent 2
    # ...
    
    return agent1  # Return all agents

# TODO: Define tool functions
def custom_tool(param: Annotated[str, "Description"]) -> str:
    """Your custom tool implementation"""
    pass

# TODO: Implement coordinator logic
async def coordinator_workflow(user_query: str):
    """Main workflow orchestration"""
    agents = await create_agents()
    
    # Your orchestration logic here
    
    pass

# TODO: Main execution
async def main():
    await setup()
    
    # Test your solution
    result = await coordinator_workflow("Your test query")
    print(result)

if __name__ == "__main__":
    asyncio.run(main())
```

---

## Supporting Materials

### Cheat Sheet: Agent Framework Quick Reference

**File**: `support/agent-framework-cheatsheet.md`

```markdown
# Agent Framework Cheat Sheet

## Creating Agents

### Azure OpenAI
```python
from agent_framework.azure import AzureOpenAIResponsesClient
from azure.identity import AzureCliCredential

client = AzureOpenAIResponsesClient(credential=AzureCliCredential())
agent = client.create_agent(
    name="MyAgent",
    instructions="Agent personality and role",
    tools=[func1, func2]
)
```

### Azure AI Foundry
```python
from agent_framework.azure import AzureAIAgentClient

client = AzureAIAgentClient(
    credential=AzureCliCredential(),
    project_endpoint="https://<project>.foundry.azure.com"
)
agent = await client.create_agent(model="gpt-4o", name="MyAgent")
```

## Running Agents

### Simple Run
```python
response = await agent.run("Your query")
print(response)
```

### Streaming
```python
async for chunk in agent.run_stream("Your query"):
    print(chunk, end="")
```

### With Thread (Multi-turn)
```python
thread = None
response = await agent.get_response(messages="Query", thread=thread)
thread = response.thread  # Maintain context
```

## Function Tools

```python
from typing import Annotated

def my_tool(
    param1: Annotated[str, "Parameter description"],
    param2: Annotated[int, "Another parameter"]
) -> Annotated[str, "Return value description"]:
    """Tool description for the agent"""
    return f"Result: {param1} {param2}"
```

## MCP Integration

### Add MCP Plugin
```python
from semantic_kernel.connectors.mcp import MCPStdioPlugin

plugin = MCPStdioPlugin(
    name="server_name",
    description="Server description",
    command="command",
    args=["arg1", "arg2"],
    env={"VAR": "value"}
)

agent = AzureAIAgent(client=client, plugins=[plugin])
```

### Expose Agent as MCP
```python
server = agent.as_mcp_server()

async with stdio_server() as (read_stream, write_stream):
    await server.run(read_stream, write_stream, 
                     server.create_initialization_options())
```

## Observability

### Setup
```python
from agent_framework.observability import setup_observability

# Console (dev)
setup_observability(exporter="console", enable_sensitive_data=True)

# OTLP (Aspire Dashboard)
setup_observability(exporter="otlp", otlp_endpoint="http://localhost:4317")

# Azure Monitor (production)
setup_observability(
    exporter="azure_monitor",
    connection_string=os.getenv("APPLICATION_INSIGHTS_CONNECTION_STRING"),
    enable_sensitive_data=False
)
```

### Auto Setup with AI Foundry
```python
client = AzureAIAgentClient(...)
await client.setup_azure_ai_observability()
```

## Common Patterns

### Multi-Agent Orchestration
```python
# Specialist as tool
def consult_specialist(query: str) -> str:
    return await specialist_agent.run(query)

# Coordinator with specialists
coordinator = client.create_agent(
    name="Coordinator",
    tools=[consult_specialist]
)
```

### Error Handling
```python
try:
    response = await agent.run(query)
except Exception as e:
    print(f"Agent error: {e}")
    # Handle or retry
```
```

### Troubleshooting Guide

**File**: `support/troubleshooting.md`

```markdown
# Troubleshooting Guide

## Common Issues

### Authentication Errors

**Problem**: `DefaultAzureCredential failed to retrieve a token`

**Solutions**:
1. Run `az login` in terminal
2. Check Azure subscription: `az account show`
3. Verify role assignments on Azure OpenAI resource
4. Use explicit credential:
   ```python
   from azure.identity import AzureCliCredential
   credential = AzureCliCredential()
   ```

### MCP Server Connection Issues

**Problem**: MCP server not starting or tools not available

**Solutions**:
1. Check Docker is running: `docker ps`
2. Verify environment variables are set
3. Test MCP server independently:
   ```bash
   docker run -i --rm -e GITHUB_PERSONAL_ACCESS_TOKEN \
     ghcr.io/github/github-mcp-server
   ```
4. Check server logs for errors

### Observability Not Working

**Problem**: No traces appearing in console or Azure Monitor

**Solutions**:
1. Verify `setup_observability()` is called BEFORE creating agents
2. Check Application Insights connection string
3. For Azure Monitor, wait 2-3 minutes for data to appear
4. Verify instrumentation key is correct
5. Check Azure Portal → Application Insights → Live Metrics

### Agent Not Calling Tools

**Problem**: Agent doesn't use provided functions

**Solutions**:
1. Verify function has proper type annotations
2. Add descriptive docstring
3. Check function name is descriptive
4. Review agent instructions - encourage tool use
5. Test with explicit instruction: "Use the [tool_name] tool to..."

### Rate Limiting / 429 Errors

**Problem**: `RateLimitError: Rate limit exceeded`

**Solutions**:
1. Add retry logic with exponential backoff
2. Check Azure OpenAI quota in portal
3. Reduce concurrent requests
4. Consider upgrading to higher tier
5. Implement request queuing

### Memory / Context Issues

**Problem**: Agent forgets previous conversation

**Solutions**:
1. Use thread object for multi-turn conversations
2. Store and reuse thread ID
3. Don't create new agent instance per request
4. Check token limits aren't exceeded

## Getting Help

1. **Documentation**: https://learn.microsoft.com/agent-framework/
2. **GitHub Issues**: https://github.com/microsoft/agent-framework/issues
3. **Discord**: https://discord.gg/b5zjErwbQM
4. **Stack Overflow**: Tag `azure-ai-agent-service`
```

---

## Workshop Materials Checklist

### Pre-Workshop (1 week before)
- [ ] GitHub Codespaces configured and tested
- [ ] Azure resources provisioned for all participants
- [ ] Sample solutions prepared and tested
- [ ] Presentation slides finalized
- [ ] Participant access verified

### Day Before
- [ ] Test all GitHub Codespaces
- [ ] Verify Azure quotas
- [ ] Send reminder email with prep instructions
- [ ] Prepare backup USB drives with materials

### Day Of
- [ ] Codespace URLs shared
- [ ] Azure credentials distributed
- [ ] Backup internet connection available
- [ ] Recording equipment tested (if recording)

### Post-Workshop
- [ ] Share recording and materials
- [ ] Collect feedback survey
- [ ] Follow-up Q&A session scheduled
- [ ] Certificate of completion sent

---

**Document Version**: 1.0  
**Last Updated**: November 4, 2025  
**Author**: Arturo Quiroga  
**For**: Vicente Macial Junior - IBM Brazil Workshop
