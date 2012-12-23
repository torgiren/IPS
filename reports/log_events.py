#!/usr/bin/env python
import os
os.environ['DJANGO_SETTINGS_MODULE']='settings'
from django.core.management import setup_environ
import settings
from logs.models import *
setup_environ(settings)

import datetime

t=datetime.datetime.now()-datetime.timedelta(minutes=1)
#d=datetime.datetime.astimezone(datetime.tzinfo('Europe/Warsaw'))
#print d.datetime.now()
czas="%d %d:%d:"%(t.day,t.hour,t.minute)
plik=open("/var/log/ips.log")
lines=plik.readlines()
for line in lines:
	if czas in line:
		print line
		print "Linia pasuje"
