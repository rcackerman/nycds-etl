import pandas
import numpy
import yaml
from os import path

CFG = yaml.load(open('config.yaml', 'r'))

class ETLDataTable():

    def __init__(self, table_name):
        # Name of the database table
        self.table_name = CFG[table_name]['table']
        # Name of the CSV file
        self.file_name = CFG[table_name]['file']
        # Whether file has note fields
        self.notes = CFG[table_name]['notes']

        #Data Types to feed into read_csv
        try:
            self.columns = CFG[table_name]['columns']
        except:
            pass

    def load_df(self, **kwargs):
        """Read the csv associated with the table name,
        then import as a pandas DataFrame
        """
        _ = path.join(path.abspath(path.pardir), self.file_name)
        self.frame = pandas.read_csv(_, 
                               na_values = ['00000000', ' ', ''],
                               encoding="latin1",
                               dtype="object",
                               **kwargs)

    def strip_strings(self):
        self.frame = self.frame.replace(r'^\s+$', numpy.NaN, regex=True)

    def coerce_to_date(self):
        for dcol in CFG[self.table_name]['date_columns']:
            print(dcol)
