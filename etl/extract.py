"""Extract data from CSVs into Pandas dataframes
"""

import pandas
import yaml
from os import path

CFG = yaml.load(open('config.yaml', 'r'))

class DataTable:
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

    def load_df(self, root_path, **kwargs):
        csv_path = os.path.join(root_path, self.file_name)
        return pandas.read_csv(csv_path, 
                               na_values = ['00000000', ' ', ''],
                               encoding="latin1",
                               **kwargs)


