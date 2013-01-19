#!/usr/bin/env python
import os,sys
os.chdir(os.path.dirname(sys.argv[0]))
os.environ['DJANGO_SETTINGS_MODULE']='settings'
from django.core.management import setup_environ
import settings
from logs.models import *
setup_environ(settings)

import datetime

t=datetime.datetime.now()-datetime.timedelta(minutes=1)
czas="%d %02d:%02d:"%(t.day,t.hour,t.minute)
plik=open("/var/log/ips.log")
lines=plik.readlines()
for line in lines:
	if czas in line:
		data=line.split()
		logczas="%d-%02d-%02d %s"%(t.year,t.month,t.day,data[2])
		data=data[7:]
		typ="Brak"
		src="Brak"
		dst="Brak"
		sport="Brak"
		dport="Brak"
		proto="Brak"
		typ=data[0]
		for d in data:
			if d.startswith("SRC="):
				src=d[4:]
			elif d.startswith("DST="):
				dst=d[4:]
			elif d.startswith("DPT="):
				dport=d[4:]
			elif d.startswith("SPT="):
				sport=d[4:]
			elif d.startswith("PROTO="):
				proto=d[6:]
		Event(czas=logczas,typ=typ,src=src,dst=dst,sport=sport,\
			dport=dport,proto=proto,log=line).save()
