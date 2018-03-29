"""Transformations necessary for 
"""
import pandas
import numpy

def fix_dates(self):
"""Some fixes for dates:
    * delete if the month and day is the same as another, correct year
    *   collapse the purposes if necessary
    * a few dates with 2008 became 1864 for some reason
    * if the year is just missing first 2 digits, add those
    * if all events except the bad one happen in a single year, use that year


