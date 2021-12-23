from django.shortcuts import redirect, render
from django.db import connection
from .models import *
from .forms import CreateUserForm
from tablib import Dataset

from django.contrib.auth import authenticate, login, logout

from django.contrib import messages
from django.contrib.auth.decorators import login_required
# Create your views here.

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
    ]

@login_required(login_url='login')
def dashboard(request):
    semesterID = None
    if request.method == "POST":
        semesterID = request.POST.get("dropdown")

    data1 = (semesterID, semesterID, semesterID)
    cursor = connection.cursor()
    cursor.execute('''select ranges."range",
count(section_t.usectionid) filter (where section_t.csemesterid = %s) as "sections",
(count(section_t.usectionid) filter (where section_t.csemesterid = %s))/12 as "classize_6",
(count(section_t.usectionid) filter (where section_t.csemesterid = %s))/14 as "classize_7"
                        from
                        (
                            select 1 minRange, 10 maxRange, '1-10' "range"
                            union all
                            select 11, 20, '11-20'
                            union all
                            select 21, 30, '21-30'
                            union
                            select 31, 40, '31-40'
                            union all
                            select 41, 50, '41-50'
                            union all
                            select 51, 60, '51-60'
                        ) as ranges
left join section_t
    on section_t.nstudentenrolled between ranges.minRange and ranges.maxRange
group by ranges.range
order by ranges.range''', data1)
    
    r = dictfetchall(cursor)

    # print(connection.queries)

    return render(request, 'dashboard/home.html', {'data': r})

def req2(request):
    semesterID = None
    if request.method == "POST":
        semesterID = request.POST.get("dropdown2")

    # if request.method == "POST":
    #     semesterID = request.POST.get("dropdown")

#     ClassSize = ClassSize_1.objects.all()
#     context = {
#         "ClassSizes": ClassSize,
#     }

    cursor = connection.cursor()
    query = """select ranges."range" "Classsize",
count(section_t.usectionid) filter (where course_t.cdepartmentid = 'SBE') as "SBE",
count(section_t.usectionid) filter (where course_t.cdepartmentid = 'SELS') as "SELS",
count(section_t.usectionid) filter (where course_t.cdepartmentid like 'SETS'
                                    or course_t.cdepartmentid like 'PhySci'
                                    or course_t.cdepartmentid like'CSE'
                                    or course_t.cdepartmentid like 'EEE') as "SETS",
count(section_t.usectionid) filter (where course_t.cdepartmentid = 'SLASS') as "SLASS",
count(section_t.usectionid) filter (where course_t.cdepartmentid = 'SPPH') as "SPPH",
count(section_t.usectionid) "sections"
                        from course_t,
                        (select 1 minRange, 10 maxRange, '1-10' "range"
                            union all
                            select 11, 20, '11-20'
                            union all
                            select 21, 30, '21-30'
                            union
                            select 31, 40, '31-40'
                            union all
                            select 41, 50, '41-50'
                            union all
                            select 51, 60, '51-60'
                        ) as ranges
                        left join section_t
                            on section_t.nstudentenrolled between ranges.minRange and ranges.maxRange
                        where section_t.csemesterid = %s and course_t.ccourseid = section_t.ccourseid
                        group by ranges.range
                        order by ranges.range
"""
    cursor.execute(query,(semesterID,))
    r = dictfetchall(cursor)

    return render(request, 'req2/req2.html', {'data': r})

def req3(request):
    semesterID = None
    if request.method == "POST":
        semesterID = request.POST.get("dropdown3")

    cursor = connection.cursor()
    data3 = (semesterID,semesterID)
    cursor.execute('''select st3.cschoolid,SUM(st.nstudentenrolled) "Sum",
ROUND(AVG(st.nstudentenrolled)::numeric,2) "Avgenrolled",
ROUND(AVG(rt.nroomcapacity)::numeric,2) "Avgroom",
ROUND(AVG(rt.nroomcapacity)::numeric,2) - ROUND(AVG(st.nstudentenrolled)::numeric,2) "Difference",
ROUND((AVG(rt.nroomcapacity) - AVG(st.nstudentenrolled))/AVG(rt.nroomcapacity)*100) "Unused"
from section_t st, course_t ct, school_t st3, department_t dt, room_t rt
where st.ccourseid = ct.ccourseid and
ct.cdepartmentid = dt.cdepartmentid and
dt.cschoolid = st3.cschoolid and
rt.croomid = st.croomid and
st.csemesterid = %s
group by st3.cschoolid
union
select csemesterid,
SUM(st.nstudentenrolled) "Sum",
ROUND(AVG(st.nstudentenrolled)::numeric,2) "Avgenrolled",
ROUND(AVG(rt.nroomcapacity)::numeric,2) "Avgroom",
ROUND(AVG(rt.nroomcapacity)::numeric,2) - ROUND(AVG(st.nstudentenrolled)::numeric,2) "Difference",
ROUND((AVG(rt.nroomcapacity) - AVG(st.nstudentenrolled))/AVG(rt.nroomcapacity)*100) "Unused"
from section_t st, course_t ct, school_t st3, department_t dt, room_t rt
where st.ccourseid = ct.ccourseid and
ct.cdepartmentid = dt.cdepartmentid and
dt.cschoolid = st3.cschoolid and
rt.croomid = st.croomid and
st.csemesterid = %s
group by csemesterid
order by "Sum"''', data3)
    
    cursor2 = connection.cursor()
    data4 = (semesterID,semesterID,semesterID,semesterID)
    cursor2.execute('''
                    select ROUND(AVG(st.nstudentenrolled)::numeric,2) "Avg"
from section_t st 
where st.csemesterid = %s
union
select ROUND(AVG(rt.nroomcapacity)::numeric,2)
from section_t st, room_t rt
where st.csemesterid = %s
union
select ROUND(AVG(rt.nroomcapacity)::numeric,2) - ROUND(AVG(st.nstudentenrolled)::numeric,2)
from section_t st, room_t rt
where st.csemesterid = %s
union
select ROUND(((AVG(rt.nroomcapacity) - AVG(st.nstudentenrolled))/AVG(rt.nroomcapacity)*100)::numeric,2)
from section_t st, room_t rt
where st.csemesterid = %s
                    ''', data4)

    r = dictfetchall(cursor)
    r2 = dictfetchall(cursor2)

    return render(request, 'req3/req3.html', {'data': r, 'data2': r2})

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


# @login_required(login_url='login')
# def simple_upload(request):
#     if request.method == 'POST':
#         dataset = Dataset()
#         new_example = request.FILES['myfile']

#         if not new_example.name.endswith('xlsx'):
#                 messages.info(request, 'Wrong Format!')
#                 return render(request, 'upload/input.html')

#         if new_example.name.endswith('xlsx'):
#             imported_data = dataset.load(new_example.read(), format='xlsx')


#         for data in imported_data:
#             value = Example(
#                 data[0],
#                 data[1],
#                 data[2]
#             )
#             value.save()

#     return render(request, 'upload/input.html')

