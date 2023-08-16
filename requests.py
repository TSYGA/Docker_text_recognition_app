import requests

url = "http://127.0.0.1:5000/text_recognition"

print('Введите имя файла')
file_path = input()

print('Введите язык')
leng = input()

img = open(file_path, 'rb')

response = requests.post(url, data={'lang': leng}, files = {'image': img})

print(response.content.decode('utf-8'))
