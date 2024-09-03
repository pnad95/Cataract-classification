#!/bin/bash

# Define paths
REQUIREMENTS_DIR="../"  # Adjust this if requirements.txt is in a different directory
TRAINING_SCRIPT_DIR="model_training"  # Adjust if your script is in a different directory
TRAINING_SCRIPT="train_model.py"  # Adjust if your script has a different name
VENV_DIR="venv"  # Directory name for virtual environment

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

# Optionally, clean up the virtual environment if you want to remove it
# rm -rf "$VENV_DIR"

echo "Training script executed successfully."
