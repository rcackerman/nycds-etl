import csv
import psycopg2

FILENAME = '.\dispo2_cleaned.csv'

SQL_STATEMENT = """
    COPY %s FROM STDIN WITH
    CSV
    HEADER
    DELIMITER AS ','
"""

def copy_csv(connection, table_name, csv_file):
    """Open CSV and copy into database table.
    Heavily borrowed from https://www.laurivan.com/load-a-csv-file-with-header-in-postgres-via-psycopg/
    """
    cur = connection.cursor()
    cur.copy_expert(sql=SQL_STATEMENT % table_name, file=csv_file)
    connection.commit()
    cur.close()


conn = psycopg2.connect("dbname=pdcms user=postgres port=5433")

with open(FILENAME, 'rb') as f:
    copy_csv(conn, 'dispositions', f)
