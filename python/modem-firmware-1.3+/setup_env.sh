#!/bin/bash

# Check if Python is installed
if ! command -v python &> /dev/null; then
    echo "Python is not installed. Please install Python and try again."
    exit 1
fi

# Create virtual environment
echo "Creating virtual environment..."
pip install virtualenv
python -m venv venv

# Activate virtual environment
echo "Activating virtual environment..."
source venv/Scripts/activate

# Install requirements if the requirements.txt file exists
if [[ -f "requirements.txt" ]]; then
    echo "Installing requirements from requirements.txt..."
    pip install -r requirements.txt
else
    echo "requirements.txt file not found. Skipping pip install."
fi

echo "Setup complete. Virtual environment initialized."

# Keep the virtual environment activated
exec bash
