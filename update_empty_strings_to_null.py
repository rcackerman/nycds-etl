# coding: utf-8

import psycopg2
from psycopg2 import extras
import pandas

UPDATE_BASE_QUERY = """
UPDATE {table} SET {column} = null WHERE {column} = ''
"""

conn = psycopg2.connect("host=localhost port=5433 user=postgres dbname=pdcms") 
with conn:
    with conn.cursor() as cur:
        cur.execute("""SELECT table_name, column_name FROM information_schema.columns
                       WHERE table_schema = 'public'
                       AND table_name not in ('court_list', 'regions_list')
                       AND data_type in ('character varying', 'text');""")
        columns = cur.fetchall()


# Set all columns to null if they are empty strings.
for c in columns:
    with conn:
        print(c)
        update_query = UPDATE_BASE_QUERY.format(table=c[0], column=c[1])
        with conn.cursor() as cur:
            cur.execute(update_query)

