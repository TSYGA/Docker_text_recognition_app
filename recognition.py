from flask import Flask,  request, make_response
import easyocr

app = Flask(__name__)

def recognition(image, language):
	reader = easyocr.Reader([language.lower()])
	res = reader.readtext(image, detail=0, paragraph=True)
	return res

@app.route("/text_recognition", methods=["POST", "GET"])
def main():
	if request.method == 'POST':
		res = recognition(request.files['image'].read(), request.form['lang'])
		return '\n'.join(res)
	return 'Отправьте изображение'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0',  port=5000)
