from django.shortcuts import redirect, render
from .models import Example
from .forms import CreateUserForm

from django.contrib.auth import authenticate, login, logout

from django.contrib import messages
from django.contrib.auth.decorators import login_required
# Create your views here.

@login_required(login_url='login')
def dashboard(request):
    examples = Example.objects.all()
    context = {
        "examples": examples,
    }
    return render(request, 'dashboard/home.html', context)

def registerPage(request):
    if request.user.is_authenticated:
        return redirect('home')

    else:
        form = CreateUserForm()

        if request.method == 'POST':
            form = CreateUserForm(request.POST)
            if form.is_valid():
                form.save()
                user = form.cleaned_data.get('username')
                messages.success(request, 'Account was created for ' + user)
                return redirect('login')

        context = {'form': form}
        return render(request, 'accounts/register.html', context)

def loginPage(request):

    if request.user.is_authenticated:
        return redirect('home')

    else:

        if request.method == 'POST':
            username = request.POST.get('username')
            password = request.POST.get('password')

            user = authenticate(request, username= username, password = password)

            if user is not None:
                login(request,user)
                return redirect('home')
            else:
                messages.info(request, 'Username or password is incorrect')

        context = {}    
        return render(request, 'accounts/login.html', context)

def logoutUser(request):
    logout(request)
    return redirect('login')