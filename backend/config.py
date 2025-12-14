"""Configuration for the LLM Council."""

import os
from dotenv import load_dotenv

load_dotenv()

# GitHub Personal Access Token
GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")

# Council members - list of GitHub Models identifiers
COUNCIL_MODELS = [
    "GPT-4.1",                              # OpenAI's latest - best overall
    "DeepSeek-R1",                          # DeepSeek reasoning model
    "Llama-3.3-70B-Instruct",               # Meta's powerful 70B model
    "Grok-3",      
    "GPT-4.1",                              # OpenAI's latest - best overall
    "gpt-4o",                              # OpenAI's latest - best overall
    "gpt-4o-mini",                            # xAI's flagship model
]



# Chairman model - synthesizes final response
CHAIRMAN_MODEL = "GPT-4.1"

# GitHub Models API endpoint
GITHUB_MODELS_API_URL = "https://models.inference.ai.azure.com/chat/completions"

# Data directory for conversation storage
DATA_DIR = "data/conversations"
