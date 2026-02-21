import http.client

from faker import Faker
import time
import datetime
from datetime import datetime, timedelta, date

def timelocal():
    x =datetime.now()
    return (x.strftime("%m-%d-%Y"))

def timepro():
    x= date.today()
    return x

def addtime(par):
    x =datetime.today()
    y = x - datetime.timedelta(minutes=3)
    return (y.time())

def Dalastime():
    y =datetime.now(datetime.timezone(datetime.timedelta(hours=-5,minutes=1)))
    return (y.strftime("%H:%M"))

def DummyFirstName():
    fake = Faker()
    return fake.first_name()

def DummylastName():
    fake = Faker()
    return fake.last_name()

def Dummyemail():
    fake = Faker()
    return fake.email()

def DummyPhone():
    fake = Faker()
    return fake.phone_number()

def Dummy_st_Address():
    fake = Faker()
    return fake.street_address()

def DummyCity():
    fake = Faker()
    return fake.city()

def DummyProvince():
    fake = Faker()
    return fake.province_abbr()

def DummyPostal():
    fake = Faker()
    return fake.postalcode()

def DummyBrokername():
    fake = Faker()
    return fake.company()

def DummyRandomNumber():
    fake = Faker()
    return fake.random_number()

def add_minutes(timeval, delta):
    return (datetime.strptime(timeval, '%m/%d/%Y %I:%M:%S %p') + timedelta(minutes=int(delta))).strftime("%H:%M")

def get_field(element_array, field):
    dict_array = dict(element_array)
    return dict_array[field]