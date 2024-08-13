import smtplib, ssl, email
import email.message
import mimetypes
import sys
import os
import math
from datetime import datetime
from datetime import timedelta
from robot.api import ExecutionResult, ResultVisitor
from email import encoders
from email.mime.base import MIMEBase
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.message import EmailMessage

sender_email = "senderemailId@gmail.com "
receiver_email = "receivermailId@gmail.com "
password = "mgstuctrlmedmyze(pwd)"

# Create MIMEMultipart object
msg = MIMEMultipart("alternative")
msg["Subject"] = "Test"
msg["From"] = sender_email
msg["To"] = receiver_email
filename = "C:/Users/Kalpesh Patel/SurePassIdGitRepo/LegacyMfaServerTestAutomation/testcases/log.html9location of the log file)"

# ======================== START OF CUSTOMIZE EMAIL CONTENT ================================== #

# Ignores following library keywords count in email report
ignore_library = [
    'BuiltIn',
    'SeleniumLibrary',
    'String',
    'Collections',
    'DateTime',
]

# Ignores following type keywords count in email report
ignore_type = [
    'foritem',
    'for',
]


# ======================== END OF CUSTOMIZE EMAIL CONTENT ================================== #

# ====== START OF PATH SELECTION ======= #

# Report to support file location as arguments
def getopts(argv):
    opts = {}
    while argv:
        if argv[0][0] == '-':
            if argv[0] in opts:
                opts[argv[0]].append(argv[1])
            else:
                opts[argv[0]] = [argv[1]]
        argv = argv[1:]
    return opts


myargs = getopts(sys.argv)

# input directory
if '-inputpath' in myargs:
    path = os.path.abspath(os.path.expanduser(myargs['-inputpath'][0]))
else:
    path = os.path.curdir

# output.xml file
if '-output' in myargs:
    output_name = os.path.join(path, myargs['-output'][0])
else:
    output_name = os.path.join(path, 'output-20220613-055145.xml')

# ====== END OF PATH SELECTION ======= #

# ====== GET ROBOT METRICS ======= #

# Read output.xml file
result = ExecutionResult(output_name)
result.configure(stat_config={'suite_stat_level': 2,
                              'tag_stat_combine': 'tagANDanother'})

total_suite = 0
passed_suite = 0
failed_suite = 0


class SuiteResults(ResultVisitor):

    def start_suite(self, suite):

        suite_test_list = suite.tests
        if not suite_test_list:
            pass
        else:
            global total_suite
            total_suite += 1
            if suite.status == "PASS":
                global passed_suite
                passed_suite += 1
            else:
                global failed_suite
                failed_suite += 1


result.visit(SuiteResults())

suitepp = math.ceil(passed_suite * 100.0 / total_suite)

elapsedtime = datetime(1970, 1, 1) + timedelta(milliseconds=result.suite.elapsedtime)
elapsedtime = elapsedtime.strftime("%X")

myResult = result.generated_by_robot

if myResult:
    generator = "Robot"
else:
    generator = "Rebot"

stats = result.statistics
total = stats.total.all.total
passed = stats.total.all.passed
failed = stats.total.all.failed

testpp = round(passed * 100.0 / total, 2)

total_keywords = 0
passed_keywords = 0
failed_keywords = 0


class KeywordResults(ResultVisitor):

    def start_keyword(self, kw):
        # Ignore library keywords
        keyword_library = kw.libname

        if any(library in keyword_library for library in ignore_library):
            pass
        else:
            keyword_type = kw.type
            if any(library in keyword_type for library in ignore_type):
                pass
            else:
                global total_keywords
                total_keywords += 1
                if kw.status == "PASS":
                    global passed_keywords
                    passed_keywords += 1
                else:
                    global failed_keywords
                    failed_keywords += 1


result.visit(KeywordResults())

kwpp = round(passed_keywords * 100.0 / total_keywords, 2)


# HTML Message Part
html = """
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Robotframework Metrics</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0 " />
      <style>
         body {
             background-color:#white; 
         }
         body, html, table,span,b {
             font-family: Calibri, Arial, sans-serif;
             font-size: 1em; 
         }
         .pastdue { color: crimson; }
         table {
             border: 1px solid silver;
             padding: 6px;
             margin-left: 30px;
             width: 600px;
         }
         thead {
             text-align: center;
             font-size: 1.1em;        
             background-color: #B0C4DE;
             font-weight: bold;
             color: #2D2C2C;
         }
         tbody {
            text-align: center;
         }
         th {
            word-wrap:break-word;
         }
         td {
            height: 25px;
         }
      </style>
   </head>
   <body>
   <span>Hi Team,<br>Following are the last ARC_UI smoke execution status.<br><br><b>Metrics:<b><br><br></span>
      <table>
         <thead>
            <th style="width: 25vh;"> Stats </th>
            <th style="width: 20vh;"> Total </th>
            <th style="width: 20vh;"> Pass </th>
            <th style="width: 20vh;"> Fail </th>
                  <th style="width: 15vh;"> Perc (%%)</th>
         </thead>
         <tbody>
            <tr>
               <td style="text-align: left;font-weight: bold;"> SUITE </td>
               <td style="text-align: center;">%s</td>
               <td style="text-align: center;">%s</td>
               <td style="text-align: center;">%s</td>
                     <td style="text-align: center;">%s</td>
            </tr>
            <tr>
               <td style="text-align: left;font-weight: bold;"> TESTS </td>
               <td style="text-align: center;">%s</td>
               <td style="text-align: center;">%s</td>
               <td style="text-align: center;">%s</td>
                     <td style="text-align: center;">%s</td>
            </tr>
            <tr>
               <td style="text-align: left;font-weight: bold;"> KEYWORDS </td>
               <td style="text-align: center;">%s</td>
               <td style="text-align: center;">%s</td>
               <td style="text-align: center;">%s</td>
                     <td style="text-align: center;">%s</td>
            </tr>
         </tbody>
      </table>

<span><br><b>Info:<b><br><br></span>
 <table>
         <tbody>
            <tr>
               <td style="text-align: left;font-weight: normal;width: 30vh;"> Execution Time </td>
               <td style="text-align: center;font-weight: normal;">%s h</td>
            </tr>
            <tr>
               <td style="text-align: left;font-weight: normal;width: 50vh;"> Generated By </td>
               <td style="text-align: center;font-weight: normal;">%s</td>
            </tr>
         </tbody>
      </table>

<span style="text-align: left;font-weight: normal;"><br>Please refer reports for detailed info.<br><br>Regards,<br>QA Team</span>

</body></html> 
""" % (total_suite, passed_suite, failed_suite, suitepp, total, passed, failed, testpp, total_keywords, passed_keywords,
       failed_keywords, kwpp, elapsedtime, generator)

part = MIMEText(html, "html")
msg.attach(part)

# Add Attachment
with open(filename, "rb") as attachment:
    part = MIMEBase("application", "octet-stream")
    part.set_payload(attachment.read())

encoders.encode_base64(part)

# Set mail headers
part.add_header(
    "Content-Disposition",
    "attachment", filename='log.html'
)
msg.attach(part)

# Create secure SMTP connection and send email

with smtplib.SMTP("smtp.gmail.com:587") as server:
    server.starttls()
    server.login(sender_email, password)
    server.sendmail(
        sender_email, receiver_email, msg.as_string()
    )