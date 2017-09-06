"""Cleans CSV output from PDCMS to prepare it for import into PostgreSQL
"""

import re
import csv

def split_lines(file_object, file_type):
    """Split lines based on the number of columns in the header line.
    """
    file_text = file_object.read()
    if file_type == 'normal':
        nb_of_fields = len(file_text.splitlines()[0].split('\t')) - 1

        # Multiplying by the number of fields - 1 so we don't have to deal with
        # re.split() dealing weirdly with capturing groups.
        # This is hack-y code. Don't do this at home.
        line = re.compile('(?<=")\r\n(?="' + '[^\t]*?\t'* nb_of_fields + '[^\t]*)')
    elif file_type == 'notes':
        line = re.compile('\r\n(?="[0-9ANY]+?")')
    return re.split(line, file_text)

def escape_quotes(row):
    """Escapes any rows with misplaced quotes
    """
    if re.search(r'[^\t"\n]"[^\t"\n]', row):
        row = re.sub(r'(?<=[^\t"\n])"(?=[^\t"\n])', r'""', row)
    if re.search(r'(?<!\s)"(?="([\t\n]|$))', row):
        row = re.sub(r'(?<!\s)"(?="([\t\n]|$))', r'""', row)
    row = re.split(r'\t', row)
    return row

def strip_surrounding_quotes(row):
    """Strips the leftover double quotes from PDCMS
    """
    row = [re.sub(r'^"|"$', '', field) for field in row]
    return row

def check_for_length(rows):
    """Checks each row to see if it's the same length as the header row,
    as a basic QA test.
    """
    for i, row in enumerate(rows):
        if len(row) != len(rows[0]):
            print(i, row)
            return False
    print('All rows match the header')

def write_to_file(rows):
    """Writes to a new, cleaned csv.
    """
    with open('{}.csv'.format(OUTFILENAME), 'w+') as out_f:
        writer = csv.writer(out_f,
                            lineterminator='\n',
                            quoting=csv.QUOTE_ALL,
                            strict=True)
        writer.writerows(rows)


NORMAL_FILES = ['addresses', 'cases', 'custody_statuses',
                'memo_main', 'names', 'results', 'loi']

NOTES_FILES = ['dispositions', 'events', 'sentences']

for cf in NORMAL_FILES:
    print(cf)
    OUTFILENAME = cf + '_cleaned'

    # To split correctly, look ahead for a quote mark followed by a number.
    with open('{}.csv'.format(cf), 'rb') as f:
        csv_rows = split_lines(f, 'normal')

    # A blank last line will leave an extra \r\n in the final row, so delete it.
    csv_rows[-1] = re.sub(r'""\r\n', '""', csv_rows[-1])

    csv_rows = [escape_quotes(row) for row in csv_rows]
    csv_rows = [strip_surrounding_quotes(row) for row in csv_rows]

    check_for_length(csv_rows)
    write_to_file(csv_rows)


for cf in NOTES_FILES:
    print(cf)
    OUTFILENAME = cf + '_cleaned'

    # To split correctly, look ahead for a quote mark followed by a number.
    with open('{}.csv'.format(cf), 'rb') as f:
        csv_rows = split_lines(f, 'notes')

    # A blank last line will leave an extra \r\n in the final row, so delete it.
    csv_rows[-1] = re.sub(r'""\r\n', '""', csv_rows[-1])

    csv_rows = [escape_quotes(row) for row in csv_rows]
    csv_rows = [strip_surrounding_quotes(row) for row in csv_rows]

    check_for_length(csv_rows)
    write_to_file(csv_rows)
