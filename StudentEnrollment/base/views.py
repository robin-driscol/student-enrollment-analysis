from django.shortcuts import render

# Create your views here.
context = {}
def dashboard(request):
    return render(request, 'dashboard/home.html', context)