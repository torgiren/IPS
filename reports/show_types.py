#!/usr/bin/env python
import os
os.environ['DJANGO_SETTINGS_MODULE']='settings'
from django.core.management import setup_environ
import settings
from logs.models import *
setup_environ(settings)

for x in Type.objects.all():
	print x.nazwa
