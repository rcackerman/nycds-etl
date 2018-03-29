"""Extract data from CSVs into Pandas dataframes
"""

import pandas
from os import path
from base import *

ETL_ROOT_DIR = path.abspath(path.pardir)

for key in CFG.keys():
    table = DataTable(key).load_df(ETL_ROOT_DIR)
    print(dir(table))
    # table = table.strip_strings()
    print(table.head())
