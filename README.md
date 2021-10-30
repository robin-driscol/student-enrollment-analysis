# Student Enrollment Analysis Project

## Setup

Download and Install Python 3.9.6 from 
https://www.python.org/ftp/python/3.9.6/python-3.9.6-amd64.exe (Windows)

Download and Install Postgresql from 
https://get.enterprisedb.com/postgresql/postgresql-14.0-1-windows-x64.exe

```sh

Install Virtual Environment module to create venv:

pip install virtualenv
python -m venv env


Activate the venv: 
Scripts\Activate


Install Django:
pip install django

Install Postgresql package:
pip install psycopg2


```

Clone the repository into your local machine:
https://github.com/robin-driscol/student-enrollment-analysis.git

Copy and paste the settings.py file inside ```StudentEnrollment/StudentEnrollment/```


Open Terminal in the directory you saved the cloned repo and run the django:
```sh

>cd student-enrollment-analysis

>cd StudentEnrollment

>python manage.py runserver 

```

Open your browser and paste the URL:
http://127.0.0.1:8000