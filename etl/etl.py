"""Extract data from CSVs into Pandas dataframes
"""

from os import path
import pandas
import numpy
import yaml
from sqlalchemy import create_engine
from base import *

CFG = yaml.load(open('config.yaml', 'r'))

ETL_ROOT_DIR = path.abspath(path.pardir)
ENGINE = create_engine('postgresql://postgres@localhost:5433/pdcms')

for key in CFG.keys():
    # Extract
    table = ETLDataTable(CFG[key]['table'], CFG[key]['file'])
    table.load_df()
    # table = table.strip_strings()
    print(table.frame.head())

    # Transform
    table.strip_strings()
    table.coerce_to_date(CFG[key]['date_columns'])

    # Load
    conn = ENGINE.connect()
    table.save_to_table(conn)
    conn.close()


