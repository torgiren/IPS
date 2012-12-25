# Create your views here.
from django.shortcuts import render_to_response
from models import *
def index(request):
	events=Event.objects.all()
	return render_to_response('index.html',{'items':events})
