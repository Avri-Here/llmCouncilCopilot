# LLM Council

![llmcouncil](header.jpg)

The idea of this repo is that instead of asking a question to your favorite LLM provider (e.g. OpenAI GPT-5, DeepSeek-V3, Llama 4 Scout, Claude 3.5 Sonnet, etc.), you can group them into your "LLM Council". This repo is a simple, local web app that essentially looks like ChatGPT except it uses GitHub Models to send your query to multiple LLMs, it then asks them to review and rank each other's work, and finally a Chairman LLM produces the final response.

In a bit more detail, here is what happens when you submit a query:

1. **Stage 1: First opinions**. The user query is given to all LLMs individually, and the responses are collected. The individual responses are shown in a "tab view", so that the user can inspect them all one by one.
2. **Stage 2: Review**. Each individual LLM is given the responses of the other LLMs. Under the hood, the LLM identities are anonymized so that the LLM can't play favorites when judging their outputs. The LLM is asked to rank them in accuracy and insight.
3. **Stage 3: Final response**. The designated Chairman of the LLM Council takes all of the model's responses and compiles them into a single final answer that is presented to the user.

## Vibe Code Alert

This project was 99% vibe coded as a fun Saturday hack because I wanted to explore and evaluate a number of LLMs side by side in the process of [reading books together with LLMs](https://x.com/karpathy/status/1990577951671509438). It's nice and useful to see multiple responses side by side, and also the cross-opinions of all LLMs on each other's outputs. I'm not going to support it in any way, it's provided here as is for other people's inspiration and I don't intend to improve it. Code is ephemeral now and libraries are over, ask your LLM to change it in whatever way you like.

## Setup

### 1. Install Dependencies

The project uses [uv](https://docs.astral.sh/uv/) for project management.

**Backend:**
```bash
uv sync
```

**Frontend:**
```bash
cd frontend
npm install
cd ..
```

### 2. Configure GitHub Token

Create a `.env` file in the project root:

```bash
GITHUB_TOKEN=github_pat_...
```

Get your GitHub Personal Access Token at [GitHub Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens). You need a token with access to GitHub Models.

### 3. Configure Models (Optional)

Edit `backend/config.py` to customize the council with models from [GitHub Models](https://github.com/marketplace/models):

```python
COUNCIL_MODELS = [
    "GPT-4.1",                              # OpenAI's latest - best overall
    "DeepSeek-R1",                          # DeepSeek reasoning model
    "Llama-3.3-70B-Instruct",               # Meta's powerful 70B model
    "Grok-3",                               # xAI's flagship model
]

CHAIRMAN_MODEL = "GPT-4.1"
```

**Available models** (may vary by account):
- **OpenAI**: `GPT-4.1`, `gpt-4o`, `gpt-4o-mini`
- **Meta**: `Llama-3.3-70B-Instruct`, `Llama-4-Scout-17B-16E-Instruct`, `Llama-3.2-90B-Vision-Instruct`
- **DeepSeek**: `DeepSeek-V3-0324`, `DeepSeek-R1`, `DeepSeek-R1-0528`, `MAI-DS-R1`
- **xAI**: `Grok-3`, `Grok-3-Mini`
- **Microsoft**: `Phi-4` (if available)

**Note:** Not all models are available in all GitHub accounts. Model names are case-sensitive!

## Running the Application

**Option 1: Use the start script**
```bash
./start.sh
```

**Option 2: Run manually**

Terminal 1 (Backend):
```bash
uv run python -m backend.main
```

Terminal 2 (Frontend):
```bash
cd frontend
npm run dev
```

Then open http://localhost:5173 in your browser.

## Tech Stack

- **Backend:** FastAPI (Python 3.10+), async httpx, GitHub Models API
- **Frontend:** React + Vite, react-markdown for rendering
- **Storage:** JSON files in `data/conversations/`
- **Package Management:** uv for Python, npm for JavaScript
