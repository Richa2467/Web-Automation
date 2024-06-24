*** Variables ***
${invalidTokenSerialNo}         12345xyz
${TknSrNoerrorMsg}              Serial Number is a required field.
${invalidSrNoMsg}               Serial Number ${invalidTokenSerialNo} is not valid or does not exist.
#${alreadyAssignedErrMsg}       Token ${TokenSerialNo} is currently assigned to
${successTokenMsg}              Token was assigned and token activation email was sent.
${tokenActivationEmailMsg}      Your authentication device is ready. Here is that you will need to activate your device:
${warningEmailMsg}              Cannot send email because this token is not assigned to any user. Assign the token to a user and then re-send
