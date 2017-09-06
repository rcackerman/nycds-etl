"""Imports cleaned CSVs into PostgreSQL
"""

import psycopg2

FILENAMES = {'addresses_cleaned.csv': 'addresses',
             'custody_statuses_cleaned.csv': 'custody_statuses',
             'dispositions_cleaned.csv': 'dispositions',
             'events_cleaned.csv': 'events',
             'memo_main_cleaned.csv': 'main_memos',
             'names_cleaned.csv': 'names',
             'results_cleaned.csv': 'results',
             'sentences_cleaned.csv': 'sentences',
             'loi_cleaned.csv': 'loi',
             'cases_cleaned.csv': 'cases'}

SQL_STATEMENT = """
    COPY %s FROM STDIN WITH
    CSV
    HEADER
    DELIMITER AS ','
"""

def copy_csv(connection, table_name, csv_file):
    """Open CSV and copy into database table.
    Heavily borrowed from
    https://www.laurivan.com/load-a-csv-file-with-header-in-postgres-via-psycopg/
    """
    cur = connection.cursor()
    cur.copy_expert(sql=SQL_STATEMENT % table_name, file=csv_file)
    connection.commit()
    cur.close()


conn = psycopg2.connect("dbname=pdcms user=postgres port=5433")

for k, v in FILENAMES.items():
    print(v)
    with open(k, 'rb') as f:
        copy_csv(conn, v, f)
