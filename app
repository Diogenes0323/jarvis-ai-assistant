from flask import Flask, render_template, request, jsonify
import speech_recognition as sr
import pyttsx3

app = Flask(__name__)
recognizer = sr.Recognizer()
tts_engine = pyttsx3.init()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/process', methods=['POST'])
def process():
    if request.method == 'POST':
        input_text = request.form['input_text']
        response_text = f"Processed input: {input_text}"
        tts_engine.say(response_text)
        tts_engine.runAndWait()
        return jsonify({'response': response_text})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
