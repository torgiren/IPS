import smtplib
from email.mime.text import MIMEText
def sendmail(from_addr,to_addr,subject,content):
	msg=MIMEText(content)
	msg['Subject']=subject
	msg['From']=from_addr
	msg['To']=to_addr
	s=smtplib.SMTP('localhost')
	s.sendmail(from_addr,[to_addr],msg.as_string())
	
