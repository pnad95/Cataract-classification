from flask import Flask, request, jsonify
from tensorflow.keras.models import load_model
from tensorflow.keras.preprocessing import image
import numpy as np

app = Flask(__name__)

# Load the pre-trained model
model = load_model('final_model.keras')

def preprocess_image(img_path):
    """Load and preprocess the image."""
    img = image.load_img(img_path, target_size=(224, 224))
    img_array = image.img_to_array(img)
    img_array = np.expand_dims(img_array, axis=0)  # Add batch dimension
    img_array /= 255.0  # Normalize to [0, 1]
    return img_array

@app.route('/predict', methods=['POST'])
def predict():
    """Predict whether an image has cataracts or not."""
    if 'file' not in request.files:
        return jsonify({'error': 'No file provided'}), 400

    file = request.files['file']
    if file.filename == '':
        return jsonify({'error': 'No selected file'}), 400

    try:
        img_path = 'temp.png'  # Save the uploaded image temporarily
        file.save(img_path)
        img_array = preprocess_image(img_path)
        
        # Predict
        prediction_prob = model.predict(img_array)[0][0]
        is_cataract = prediction_prob <= 0.5
        if is_cataract:
            confidence = round(1 - prediction_prob, 3)  # Confidence for cataract
        else:
            confidence = round(prediction_prob, 3)  
        result = {'has_cataract': bool(is_cataract), 'confidence': float(confidence)}
        
        return jsonify(result)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
