from flask import Flask, request, jsonify
import whisper
import tempfile, os

app = Flask(__name__)
model = whisper.load_model("base")

@app.route("/transcribe", methods=["POST"])
def transcribe():
    if "file" not in request.files:
        return jsonify({"error": "No file provided"}), 400
    f = request.files["file"]
    tmp = tempfile.NamedTemporaryFile(delete=False, suffix=".mp3")
    f.save(tmp.name)
    res = model.transcribe(tmp.name)
    os.remove(tmp.name)
    return jsonify({"text": res["text"]})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
