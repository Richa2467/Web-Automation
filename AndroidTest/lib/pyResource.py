from PIL import Image
from pyzbar.pyzbar import decode
import urllib.request


def decode_activation_code():
    data = decode(Image.open('..//appData//QRCode.png'))
    print(data[0].data)
    return str(data[0].data)


def download_image(src):
    urllib.request.urlretrieve(src, "..//appData//QRCode.png")

# import json
# import requests
# from PIL import Image
# from pyzbar.pyzbar import decode
# import urllib.request
#
# url = 'https://sandbox.surepassid.com/AuthServer/REST/U2F/U2FServer.aspx'
#
# headers = {"Content-Type": "application/json"}
#
# myobj = {
#     "username": "gabriel",
#     "spAccountLoginName": "vo5vvRVi3WW50QwNVfLUUCoSrayybXrAKidfHwG8",
#     "spAccountLoginKey": "0wAaNurG8LtenEsJcE1GULhctip4KYzkFfjkhPbV",
#     "removeRelated": "false",
#     "type": "delete_user",
# }
#
# response = requests.get(url, headers=headers, data=json.dumps(myobj)).json()
# print(response)
#
#
# # Initialize driver
#
# def decode_activation_code():
#     data = decode(Image.open('..\\appData\\QRCode.png'))
#     print((data[0].data))
#     return str(data[0].data)
#
#
# def download_image(src):
#     urllib.request.urlretrieve(src, "..\\appData\\QRCode.png")
