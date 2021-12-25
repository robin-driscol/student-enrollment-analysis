from django.shortcuts import redirect, render
from django.db import connection
from .models import *
from .forms import CreateUserForm
# from tablib import Dataset

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
    
    if semesterID == None:
        semesterID = "Spring2020"

    cursor = connection.cursor()
    cursor.execute('''select ranges."range" "range", 
count((section_t.usectionid)) as "sections", 
round((count(section_t.usectionid))/12::numeric,2) as "classize_6", 
round((count(section_t.usectionid))/14::numeric,2) as "classize_7"
                        from
                        (
                            select 1 minRange, 10 maxRange, '1-10' "range"
                            union all
                            select 11, 20, '11-20'
                            union all
                            select 21, 30, '21-30'
                            union
                            select 31, 35, '31-35'
                            union all
                            select 36, 40, '36-40'
                            union all
                            select 41, 50, '41-50'
                            union all
                            select 51, 55, '51-55'
                            union all
                            select 56, 65, '56-65'
                        ) as ranges
                        left join section_t
                            on section_t.nstudentenrolled between ranges.minRange and ranges.maxRange
                        where section_t.csemesterid = %s
                        group by ranges.range
                        order by ranges.range''', (semesterID,))
    
    r = dictfetchall(cursor)

    # print(connection.queries)

    return render(request, 'dashboard/home.html', {'data': r, 'sem': semesterID})

def req2(request):
    semesterID = None
    if request.method == "POST":
        semesterID = request.POST.get("dropdown2")
    
    if semesterID == None:
        semesterID = "Autumn2021"

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

    return render(request, 'req2/req2.html', {'data': r, 'sem': semesterID})

def req3(request):
    semesterID = None
    if request.method == "POST":
        semesterID = request.POST.get("dropdown3")
    
    if semesterID == None:
        semesterID = "Spring2020"

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

    return render(request, 'req3/req3.html', {'data': r, 'data2': r2, 'sem': semesterID})








def req4(request):
    cursor = connection.cursor()
    cursor.execute('''
                 select rt.nroomcapacity "classsize", count(distinct rt.croomid) "iubresource", rt.nroomcapacity*count(distinct rt.croomid) "capacity"
from room_t rt
group by rt.nroomcapacity
order by rt.nroomcapacity asc''')
    
    cursor2 = connection.cursor()
    cursor2.execute('''
                    select count(distinct rt.croomid) "totalresource", sum(rt.nroomcapacity) "totalcapacity"
from room_t rt
                    ''')
    
    cursor3 = connection.cursor()
    cursor3.execute('''
                    select sum(rt.nroomcapacity),sum(rt.nroomcapacity)*12 "total6slot",
sum(rt.nroomcapacity)*14 "total7slot",
round((sum(rt.nroomcapacity)*12)/(3.5)) "total6Avg3",
round((sum(rt.nroomcapacity)*14)/(3.5)) "total7Avg3"
from room_t rt
                    ''')

    semesterID = None
    if request.method == "POST":
        semesterID = request.POST.get("dropdown4")

    if semesterID == None:
        semesterID = "Spring2020"              

    cursor4 = connection.cursor()
    cursor4.execute("""
with tbl(ranges, sec, cls6, cls7) as (select ranges."range" "range", 
count((section_t.usectionid)) as "sections", 
round((count(section_t.usectionid))/12::numeric,2) as "classize_6", 
round((count(section_t.usectionid))/14::numeric,2) as "classize_7"
                        from
                        (
                            select 1 minRange, 20 maxRange, 20 "range"
                            union all
                            select 21, 25, 25
                            union
                            select 26, 30, 30
                            union all
                            select 31, 35, 35
                            union all
                            select 36, 39, 36
                            union all
                            select 40, 40, 40
                            union all
                            select 50, 70, 50
                        ) as ranges
                        left join section_t
                            on section_t.nstudentenrolled between ranges.minRange and ranges.maxRange
                        where section_t.csemesterid like %s
                        group by ranges.range
                        order by ranges.range)
select rt.nroomcapacity "room", count(distinct rt.croomid) "iubresource", tbl.cls6, tbl.cls6 - count(distinct rt.croomid) "diff"
from room_t rt
right join tbl on 
rt.nroomcapacity = tbl.ranges
group by rt.nroomcapacity, tbl.cls6
order by rt.nroomcapacity asc""", (semesterID,))               
    r = dictfetchall(cursor)
    r2 = dictfetchall(cursor2)
    r3 = dictfetchall(cursor3)
    r4 = dictfetchall(cursor4)
    
    

    return render(request, 'req4/req4.html', {'data': r, 'data2': r2, 'data3': r3, 'data4': r4, 'sem': semesterID})

def req5(request):
    semesterID = None
    if request.method == "POST":
        semesterID = request.POST.get("dropdown5")
    
    if semesterID == None:
        semesterID = "Spring2020"

    cursor = connection.cursor()
    query = """
    with ranges as (
    select (generate_series(1,70)) as nrange 
)
select ranges.nrange,
count(st.usectionid) filter (where course_t.cdepartmentid = 'SELS') as "SELS",
count(st.usectionid) filter (where course_t.cdepartmentid = 'SBE') as "SBE",
count(st.usectionid) filter (where course_t.cdepartmentid like 'SETS' 
                                    or course_t.cdepartmentid like 'PhySci'
                                    or course_t.cdepartmentid like'CSE'
                                    or course_t.cdepartmentid like 'EEE') as "SETS",
count(st.usectionid) filter (where course_t.cdepartmentid = 'SLASS') as "SLASS",
count(st.usectionid) filter (where course_t.cdepartmentid = 'SPPH') as "SPPH",
count(st.usectionid) filter (where course_t.cdepartmentid = 'SELS') + 
count(st.usectionid) filter (where course_t.cdepartmentid = 'SBE') + 
count(st.usectionid) filter (where course_t.cdepartmentid like 'SETS' 
                                    or course_t.cdepartmentid like 'PhySci'
                                    or course_t.cdepartmentid like'CSE'
                                    or course_t.cdepartmentid like 'EEE') +
count(st.usectionid) filter (where course_t.cdepartmentid = 'SLASS') + 
count(st.usectionid) filter (where course_t.cdepartmentid = 'SPPH') as "total"
from section_t st, ranges, course_t
where st.csemesterid = %s and course_t.ccourseid = st.ccourseid and ranges.nrange = st.nstudentenrolled
group by ranges.nrange
order by ranges.nrange asc
"""
    cursor.execute(query,(semesterID,))
    r = dictfetchall(cursor)
    return render(request, 'req5/req5.html', {'data':r, 'sem': semesterID})


def req6(request):
    cursor = connection.cursor()
    cursor.execute('''
                with tbl(Semester, Semester_num, year, SBE, SLASS, sets, SPPH, SELS, total) as 
(select distinct st.csemesterid "semester", sem.nsemesternum "semester_Num",sem.cyearid "year",
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid = 'SBE')) as "SBE",
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid = 'SLASS')) as "SLASS",
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid like 'SETS'
                                    or ct.cdepartmentid like 'PhySci'
                                    or ct.cdepartmentid like'CSE'
                                    or ct.cdepartmentid like 'EEE')) as "SETS",
coalesce((sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid = 'SPPH')),0) as "SPPH",
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid = 'SELS')) as "SELS",
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid = 'SBE')) +
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid = 'SLASS')) +
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid like 'SETS'
                                    or ct.cdepartmentid like 'PhySci'
                                    or ct.cdepartmentid like'CSE'
                                    or ct.cdepartmentid like 'EEE'))+
coalesce((sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid = 'SPPH')),0)+
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid = 'SELS')) as "Total"
from section_t st, course_t ct, semester_t sem 
where st.ccourseid = ct.ccourseid and st.csemesterid = sem.csemesterid 
group by st.csemesterid, sem.nsemesternum, sem.cyearid
order by sem.cyearid, sem.nsemesternum asc)
select * ,
coalesce((total - LAG(total,1) OVER (ORDER BY year, semester_num)) * 100 / LAG(total,1) OVER (ORDER BY year, semester_num),0) as "Difference" 
from tbl order by year, semester_num''')


    r = dictfetchall(cursor)
   
    return render(request, 'req6/req6.html', {'data': r})


def req7(request):
    cursor = connection.cursor()
    cursor.execute('''
            with tbl(Semester, Semester_num, year, PhySci, CSE, EEE, sets) as 
(select distinct st.csemesterid "Semester", sem.nsemesternum "Semester_Num",sem.cyearid "year",
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid = 'PhySci')) as "physci",
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid = 'CSE')) as "cse",
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid like 'EEE')) as "eee",
(sum(st.nstudentenrolled * ct.nnumofcred) filter (where ct.cdepartmentid like 'SETS')) as "sets"
from section_t st, course_t ct, semester_t sem 
where st.ccourseid = ct.ccourseid and st.csemesterid = sem.csemesterid 
group by st.csemesterid, sem.nsemesternum, sem.cyearid
order by sem.cyearid, sem.nsemesternum asc)
select * ,
coalesce((PhySci - LAG(PhySci,1) OVER (ORDER BY year, semester_num)) * 100 / LAG(PhySci,1) OVER (ORDER BY year, semester_num), 0) as "physcip",
coalesce((CSE - LAG(CSE,1) OVER (ORDER BY year, semester_num)) * 100 / LAG(CSE,1) OVER (ORDER BY year, semester_num), 0) as "csep",
coalesce((EEE - LAG(EEE,1) OVER (ORDER BY year, semester_num)) * 100 / LAG(EEE,1) OVER (ORDER BY year, semester_num), 0) as "eep",
coalesce((sets - LAG(sets,1) OVER (ORDER BY year, semester_num)) * 100 / LAG(sets,1) OVER (ORDER BY year, semester_num), 0) as "setsp"
from tbl order by year;''')


    r = dictfetchall(cursor)
    return render(request, 'req7/req7.html', {'data': r})



















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

