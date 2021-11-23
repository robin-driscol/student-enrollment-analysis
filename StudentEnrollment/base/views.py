from django.shortcuts import redirect, render
from .models import *
from .forms import CreateUserForm
from tablib import Dataset

from django.contrib.auth import authenticate, login, logout

from django.contrib import messages
from django.contrib.auth.decorators import login_required
# Create your views here.

@login_required(login_url='login')
def dashboard(request):
    ClassSize = ClassSize_1.objects.all()
    context = {
        "ClassSizes": ClassSize,
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

@login_required(login_url='login')
def simple_upload(request):
    if request.method == 'POST':
        dataset = Dataset()
        new_example = request.FILES['myfile']

        if not new_example.name.endswith('xlsx'):
                messages.info(request, 'Wrong Format!')
                return render(request, 'upload/input.html')

        if new_example.name.endswith('xlsx'):
            imported_data = dataset.load(new_example.read(), format='xlsx')


        for data in imported_data:
            value = Example(
                data[0],
                data[1],
                data[2]
            )
            value.save()

    return render(request, 'upload/input.html')