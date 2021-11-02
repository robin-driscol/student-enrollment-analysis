from django.shortcuts import render
from .models import Example

# Create your views here.

def dashboard(request):
    examples = Example.objects.all()
    context = {
        "examples": examples,
    }
    return render(request, 'dashboard/home.html', context)