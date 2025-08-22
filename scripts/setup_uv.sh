#!/usr/bin/env bash
set -e

echo ">>> Checking for uv..."
if ! command -v uv &>/dev/null; then
  echo "uv not found. Please install uv first: https://docs.astral.sh/uv/"
  exit 1
fi

# Get the latest stable Python version available
LATEST_PY=$(uv python list | awk -F'-' '/cpython-[0-9]+\.[0-9]+(\.[0-9]+)?(-|$)/ {print $2}' | grep -v '[a-zA-Z]' | sort -V | tail -n 1)

echo ">>> Ensuring Python $LATEST_PY is installed with uv..."
uv python install $LATEST_PY

# Initialize project if no pyproject.toml
if [ ! -f "pyproject.toml" ]; then
  echo ">>> Initializing new project..."
  uv init
fi

echo ">>> Creating virtual environment (.venv) with Python $LATEST_PY..."
uv venv --python $LATEST_PY

# Ask for dependencies
read -p "Enter runtime dependencies to install (space-separated, or leave empty): " RUNTIME_DEPS
if [ ! -z "$RUNTIME_DEPS" ]; then
  echo ">>> Adding runtime dependencies..."
  uv add $RUNTIME_DEPS
fi

read -p "Enter development dependencies to install (space-separated, or leave empty): " DEV_DEPS
if [ ! -z "$DEV_DEPS" ]; then
  echo ">>> Adding dev dependencies..."
  uv add --dev $DEV_DEPS
fi

# Sync environment (install everything)
echo ">>> Syncing environment (installing all dependencies)..."
uv sync

echo ""
echo ">>> Setup complete!"
echo "Virtual environment: .venv (Python $LATEST_PY)"
echo ""
echo "Activate it with:"
echo "    source .venv/bin/activate"
echo ""
echo "Run code inside venv without activating using:"
echo "    uv run python your_script.py"
