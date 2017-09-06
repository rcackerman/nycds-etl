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
    del_string = "DELETE FROM {};".format(v)
    select_string = "SELECT COUNT(*) FROM {};".format(v)

    with conn:
        with conn.cursor() as cursor:
            cursor.execute(del_string)

    # Check that delete worked
    with conn:
        with conn.cursor() as cursor:
            cursor.execute(select_string)
            print(cursor.fetchall())

    with conn:
        with conn.cursor() as cursor:
            with open(k, 'rb') as f:
                cursor.copy_expert(sql=SQL_STATEMENT % v, file=f)

    # Check that copy worked
    with conn:
        with conn.cursor() as cursor:
            cursor.execute(select_string)
            print(cursor.fetchall())

conn.close()
    # copy_csv(conn, v, f)
