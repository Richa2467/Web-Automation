import json
import requests


headers = {'Content-Type': 'application/json'}


class ApiTesting(object):
	def __init__(self, url, login_name, login_password):
		self.url = url
		self.login_name = login_name
		self.login_password = login_password

	def send_oath_otp(self, user_name, otp_type):
		self.user_name = user_name
		self.otp_type = otp_type
		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"type": "send_oath_otp",
			"deliveryMethod": "{}".format(self.otp_type)
		}
		response = requests.post(self.url, headers=headers, data=json.dumps(myobj)).json()
		# return response.status_code
		return response['errorCode']

	def validate_user(self, user_name, password, no_auth):
		self.user_name = user_name
		self.password = password
		self.no_auth = no_auth
		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"type": "validate_user",
			"pw": "{}".format(self.password),
			"noAuth": self.no_auth
		}

		response = requests.post(self.url, headers=headers, data=json.dumps(myobj)).json()
		# return response.status_code
		return response['errorCode']

	def validate_passcode(self, user_name, sent_otp):
		self.user_name = user_name
		self.sent_otp = sent_otp
		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"type": "validate_oath_otp",
			"otp": "{}".format(self.sent_otp),
			"psn": ""
		}
		response = requests.post(self.url, headers=headers, data=json.dumps(myobj)).json()
		# return response.status_code
		return response['errorCode']

	def update_user(self, user_name, new_firstname=None, new_lastname=None, new_mobile=None, new_email=None):
		self.user_name = user_name
		self.new_firstname = new_firstname
		self.new_lastname = new_lastname
		self.new_mobile = new_mobile
		self.new_email = new_email
		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"firstName": self.new_firstname,
			"lastName": self.new_lastname,
			"mobile": self.new_mobile,
			"email": self.new_email,
			"userStatus": 0,
			"type": "update_user"
		}
		response = requests.post(self.url, headers=headers, data=json.dumps(myobj)).json()
		return response['errorCode']
		# return response.status_code

	def add_token(self, user_name, device_type, otp_type):
		self.user_name = user_name
		self.device_type = device_type
		self.otp_type = otp_type
		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"type": "add_u2f_device",
			"deviceType": self.device_type, # https://surepassid.atlassian.net/wiki/spaces/ProdDoc/pages/30638095/Device+Type
			"OtpType": self.otp_type, # https://surepassid.atlassian.net/wiki/spaces/ProdDoc/pages/30638093/OTP+Type
			"notificationMethod": 0
		}
		response = requests.get(self.url, headers=headers, data=json.dumps(myobj)).json()
		return [response['errorCode'], response['deviceId']]

	def delete_token(self, user_name, token_serial):
		self.user_name = user_name
		self.token_serial = token_serial
		deviceSerialNo = ""
		myobj1 = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"type": "find_user"
		}
		response = requests.post(self.url, headers=headers, data=json.dumps(myobj1)).json()
		# return response
		# print(response)
		for i in response['Devices']:
			if i['tokenID'] == self.token_serial:
				deviceSerialNo = i['psn']

		myobj = {
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"username": "{}".format(self.user_name),
			"psn": "{}".format(deviceSerialNo),
			"type": "delete_device"
		}
		response = requests.post(self.url, headers=headers, data=json.dumps(myobj)).json()
		return response['errorCode']

	def create_session_token(self, user_name, password):
		self.user_name = user_name
		self.password = password

		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"type": "create_session_token",
			"pw": "{}".format(self.password),
			"sessionTokenDurationMinutes": "30",
			"sessionTokenType": "0",
		}
		response = requests.post(self.url, headers=headers, data=json.dumps(myobj)).json()
		return response['errorCode'], response['errorMessage']

	def add_user(self, user_name, first_name, email):
		self.user_name = user_name
		self.first_name = first_name
		self.email = email

		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"firstName": "{}".format(self.first_name),
			"lastName": "Tiger",  # // do not update this leave it as it is.
			"mobile": "+91(992)5852525",
			"email": "{}".format(self.email),
			"userStatus": 0,  # // enabled
			"type": "add_user",
		}
		response = requests.post(self.url, headers=headers, data=json.dumps(myobj)).json()
		return response['errorCode']

	def delete_user(self,user_name):
		self.user_name = user_name

		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"removeRelated": "false",
			"type": "delete_user",
		}
		response = requests.post(self.url, headers=headers, data=json.dumps(myobj)).json()
		return response['errorCode']

	def delete_user(self,user_name, login_name, login_password):
		self.user_name = user_name
		self.login_name = login_name
		self.login_password = login_password
		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"removeRelated": "false",
			"type": "delete_user",
		}
		print("Send Body Data : ", myobj)
		response = requests.post(self.url, headers=headers, data=json.dumps(myobj)).json()
		print("Response Data : ", response)
		return response['errorCode']

	def add_user_status_enable(self, user_name, spAccountLoginName, spAccountLoginKey, first_name, lastName, mobile,
							   email, userStatus, pw):
		self.user_name = user_name
		self.spAccountLoginName = spAccountLoginName
		self.spAccountLoginKey = spAccountLoginKey
		self.first_name = first_name
		self.lastName = lastName
		self.mobile = mobile
		self.email = email
		self.userStatus = userStatus
		self.pw = pw
		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.spAccountLoginName),
			"spAccountLoginKey": "{}".format(self.spAccountLoginKey),
			"firstName": "{}".format(self.first_name),
			"lastName": "{}".format(self.lastName),  # // do not update this leave it as it is.
			"mobile": "{}".format(self.mobile),
			"email": "{}".format(self.email),
			"userStatus": "{}".format(self.userStatus),  # // enabled
			"pw": "{}".format(self.pw),
			"type": "add_user",
		}

		print("Send Body Data : ", myobj)
		response = requests.post(self.url, headers=headers, data=json.dumps(myobj)).json()
		print("Response Data : ", response)
		return response['errorCode']

	def find_user_detail(self, user_name, login_name, login_password):
		# This can be used to fetch the details of the user.
		self.user_name = user_name
		self.login_name = login_name
		self.login_password = login_password
		myobj = {
			"username": "{}".format(self.user_name),
			"spAccountLoginName": "{}".format(self.login_name),
			"spAccountLoginKey": "{}".format(self.login_password),
			"type": "find_user"
		}
		print("Sent Body Data: ", myobj)
		response = requests.get(self.url, headers=headers, data=json.dumps(myobj)).json()
		print(response)
		return response['errorCode']