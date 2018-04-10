from os import path
import pandas
import numpy
import yaml
from sqlalchemy import create_engine

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
        then import as a pandas DataFrame.
        """
        _ = path.join(path.abspath(path.pardir), self.file_name)
        self.frame = pandas.read_csv(_, 
                               na_values = ['00000000', ' ', ''],
                               encoding='latin1',
                               dtype='object',
                               **kwargs)

    def strip_strings(self):
        """Set any cell with only spaces to null.
        """
        self.frame = self.frame.replace(r'^\s+$', numpy.NaN, regex=True)

    def coerce_to_date(self):
        """Coerce the columns listed in the config file into Pandas datetime
        so they can be transferred to PostgreSQL in that format. Drop any
        dates that can't be coerced.
        """
        dcols = CFG[self.table_name]['date_columns']
        self.frame[dcols] = self.frame[dcols].transform(
                lambda x: pandas.to_datetime(x,
                                             format='%Y%m%d',
                                             errors='coerce'))

    def save_to_table(self, conn, **kwargs): 
        """Save frame to a PostgreSQL, using Pandas built-in to_sql() method.
        """
        self.frame.to_sql(name=self.table_name, con=conn, **kwargs)
