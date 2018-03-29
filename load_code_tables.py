"""Imports CSVs of the definitions for
dipsosition action codes, event type codes,
event purpose codes, result code codes,
and result purpose codes into PostgreSQL
"""

import psycopg2

FILENAMES = {'dispositions.csv': 'disposition_actions',
             'event_purposes.csv': 'event_purposes',
             'result_purposes.csv': 'result_purposes',
             'result_codes.csv': 'result_codes'}

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

CONN = psycopg2.connect("dbname=pdcms user=postgres port=5433")

for k, v in FILENAMES.items():
    print(v)
    del_string = "DELETE FROM {};".format(v)
    select_string = "SELECT COUNT(*) FROM {};".format(v)

    with CONN:
        with CONN.cursor() as cursor:
            cursor.execute(del_string)

    # Check that delete worked
    with CONN:
        with CONN.cursor() as cursor:
            cursor.execute(select_string)
            print(cursor.fetchall())

    with CONN:
        with CONN.cursor() as cursor:
            with open(k, 'rb') as f:
                cursor.copy_expert(sql=SQL_STATEMENT % v, file=f)

    # Check that copy worked
    with CONN:
        with CONN.cursor() as cursor:
            cursor.execute(select_string)
            print(cursor.fetchall())

CONN.close()
