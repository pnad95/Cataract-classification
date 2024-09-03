# Cataract Classification Project

This project provides a binary classification model for detecting cataracts in images. It includes data exploration, model training, and deployment of a Flask API for making predictions.

## Project Structure

1. **Data Exploration**
   - **File**: `Data_exploration.ipynb`
   - **Objective**: Perform exploratory data analysis (EDA) to understand the dataset.

2. **Model Training**
   - **Files**:
     - `Model_train.py`: Script to train the model and save its weights.
     - `run_training.sh`: Shell script to set up the environment and execute `Model_train.py`.
     - `Model Training.ipynb`: Jupyter notebook showing training results, including performance metrics such as accuracy, precision, recall, and ROC AUC curves.

3. **Cataract Classification API**
   - **Files**:
     - `cataract_app.py`: Flask API script for predicting the presence of cataracts.
     - `setup_and_run.sh`: Shell script to set up the environment and start the Flask API.
     - `Cataract_in_human_eye.png`: Sample image for testing the API.

## How to Run the Cataract Classification API

### Step 1: Prepare the Data
1. Download the dataset from Kaggle.
2. Rename the dataset to `processed_images` and place it in the `model_training` folder.

### Step 2: Train the Model
1. Navigate to the `model_training` folder:
    ```bash
    cd path/to/model_training
    ```
2. Set permissions and run the training script:
    ```bash
    chmod +x run_training.sh
    ./run_training.sh
    ```
   - This will install required packages, train the model, and save the model weights in the `cataract_app` folder.

### Step 3: Set Up and Run the API
1. Navigate to the `cataract_app` folder:
    ```bash
    cd path/to/cataract_app
    ```
2. Set permissions and run the setup script:
    ```bash
    chmod +x setup_and_run.sh
    ./setup_and_run.sh
    ```
   - If port 5000 is occupied by another service, either kill the existing service or change the port in `cataract_app.py`.

3. **Checking and Killing Services** (if necessary):
    ```bash
    lsof -i :5000
    kill -9 PID
    ```

### Step 4: Test the API
1. Use `curl` to send a POST request with an image:
    ```bash
    curl -X POST -F "file=@Cataract_in_human_eye.png" http://127.0.0.1:5000/predict
    ```
   - **Expected Output Example**:
     ```json
     {"confidence":1.0,"has_cataract":true}
     ```

2. To test with a different image, place the image in the `cataract_app` folder and update the `curl` command with the new image name.


