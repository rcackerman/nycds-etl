from os import path
import pandas
import numpy
import yaml
from sqlalchemy import create_engine

ETL_DIR = path.dirname(path.abspath(__file__))
ROOT_DIR = path.dirname(ETL_DIR)
CFG = yaml.load(
            open(
                path.join(ETL_DIR, 'config.yaml'), 'r'))

class ETLDataTable():

    def __init__(self, table_name, file_name, columns_list=None):
        # Name of the database table
        self.table_name = table_name
        # Name of the CSV file
        self.file_name = file_name

        #Data Types to feed into read_csv
        try:
            self.columns = columns_list
        except:
            pass

    def load_df(self, **kwargs):
        """Read the csv associated with the table name,
        then import as a pandas DataFrame.
        """
        _ = path.join(ROOT_DIR, self.file_name)
        self.frame = pandas.read_csv(_, 
                               na_values = ['00000000', ' ', ''],
                               encoding='latin1',
                               dtype='object',
                               **kwargs)

    def lowercase_columns(self):
        """Set the columnnames to lowercase, for ease of querying
        """
        self.frame.columns = [i.lower() for i in self.frame.columns]

    def strip_strings(self):
        """Set any cell with only spaces to null.
        """
        self.frame = self.frame.replace(r'^\s+$', numpy.NaN, regex=True)

    def coerce_to_date(self, date_columns=None):
        """Coerce the columns listed in the config file into Pandas datetime
        so they can be transferred to PostgreSQL in that format. Drop any
        dates that can't be coerced.
        """
        self.frame[date_columns] = self.frame[date_columns].transform(
                lambda x: pandas.to_datetime(x,
                                             format='%Y%m%d',
                                             errors='coerce'))

    def save_to_table(self, conn, **kwargs): 
        """Save frame to a PostgreSQL, using Pandas built-in to_sql() method.
        """
        self.frame.to_sql(name=self.table_name,
                          con=conn,
                          if_exists = 'replace',
                          **kwargs)
