import re, csv

def split_lines(file_object):
    """Split lines based on the number of columns in the header line.
    """
    file_text = file_object.read()
    n = len(file_text.splitlines()[0].split('\t')) - 1

    # Multiplying by the number of fields - 1 so we don't have to deal with
    # re.split() dealing weirdly with capturing groups.
    # This is hack-y code. Don't do this at home.
    line = re.compile('\r\n(?="' + '[^\t\n]*?\t'* n + '[^\t\n]*)')
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

def check_and_write(csv_rows):
    for i, l in enumerate(csv_rows):
        if len(l) != len(csv_rows[0]):
            print i, l
            return False
    print 'All systems go'
    with open('{}.csv'.format(OUTFILENAME), 'w+') as of:
        writer = csv.writer(of,
                            lineterminator='\n',
                            quoting=csv.QUOTE_ALL,
                            strict=True)
        writer.writerows(csv_rows)


INFILENAME = 'results'
OUTFILENAME = INFILENAME + '_cleaned'

# To split correctly, look ahead for a quote mark followed by a number.
with open('{}.csv'.format(INFILENAME), 'rb') as f:
    CSV_ROWS = split_lines(f)

# A blank last line will leave an extra \r\n in the final row, so delete it.
CSV_ROWS[-1] = re.sub(r'""\r\n', '""', CSV_ROWS[-1])

CSV_ROWS = [escape_quotes(row) for row in CSV_ROWS]
CSV_ROWS = [strip_surrounding_quotes(row) for row in CSV_ROWS]

check_and_write(CSV_ROWS)
