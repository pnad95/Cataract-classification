#!/bin/bash

# Define variables
VENV_DIR="venv"
FLASK_APP="cataract_app.py"
MODEL_FILE="final_model.keras"
REQUIREMENTS_FILE="../requirement.txt"

# Check if virtual environment directory exists
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    python3 -m venv $VENV_DIR
else
    echo "Virtual environment already exists."
fi

# Activate virtual environment
source $VENV_DIR/bin/activate

# Upgrade pip
pip3 install --upgrade pip

# Install required packages
if [ -f "$REQUIREMENTS_FILE" ]; then
    echo "Installing packages from $REQUIREMENTS_FILE..."
    pip3 install -r $REQUIREMENTS_FILE
else
    echo "Requirements file not found!"
    exit 1
fi

# Check if model file exists
if [ ! -f "$MODEL_FILE" ]; then
    echo "Model file $MODEL_FILE not found!"
    exit 1
fi

# Run the Flask app
echo "Starting Flask app..."
export FLASK_APP=$FLASK_APP
flask run
