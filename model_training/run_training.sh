#!/bin/bash

# Define paths
REQUIREMENTS_DIR="../"  
TRAINING_SCRIPT_DIR="model_training"  
TRAINING_SCRIPT="train_model.py"  
VENV_DIR="venv" 

# Navigate to the directory with requirements.txt and create a virtual environment
cd "$REQUIREMENTS_DIR" || { echo "Directory not found: $REQUIREMENTS_DIR"; exit 1; }

# Create a virtual environment if it doesn't already exist
if [ ! -d "$VENV_DIR" ]; then
    python3 -m venv "$VENV_DIR"
fi

# Activate the virtual environment
source "$VENV_DIR/bin/activate"

# Upgrade pip and install dependencies from requirements.txt
pip3 install --upgrade pip
pip3 install -r requirement.txt

# Navigate to the model training folder
cd "$TRAINING_SCRIPT_DIR" || { echo "Directory not found: $TRAINING_SCRIPT_DIR"; exit 1; }

# Run the Python training script
python3 "$TRAINING_SCRIPT"

# Deactivate the virtual environment
deactivate

echo "Training script executed successfully."
