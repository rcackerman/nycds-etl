import re, csv

INFILENAME = '.\dispo2'
OUTFILENAME = INFILENAME + '_cleaned'

def escape_quotes(row):
    """Escapes any rows with misplaced quotes
    """
    if re.search(r'[^\t"\n]"[^\t"\n]', row):
        row = re.sub(r'(?<=[^\t"\n])"(?=[^\t"\n])', r'\"', row)
    if re.search(r'(?<!\s)"(?="([\t\n]|$))', row):
        row = re.sub(r'(?<!\s)"(?="([\t\n]|$))', r'\"', row)
    row = re.split(r'\t', row)
    return row

def strip_surrounding_quotes(row):
    """Strips the leftover double quotes from PDCMS
    """
    row = [re.sub(r'^"|"$', '', field) for field in row]
    return row

# To split correctly, look ahead for a quote mark followed by a number.
with open('{}.csv'.format(INFILENAME), 'rb') as f:
    CSV_ROWS = re.split(r'\r\n(?="[0-9A])', f.read())

CSV_ROWS = [escape_quotes(row) for row in CSV_ROWS]
CSV_ROWS = [strip_surrounding_quotes(row) for row in CSV_ROWS]

with open('{}.csv'.format(OUTFILENAME), 'w') as of:
    writer = csv.writer(of,
                        doublequote=False,
                        escapechar='\\',
                        lineterminator='\n',
                        quoting=csv.QUOTE_ALL,
                        strict=True)
    writer.writerows(CSV_ROWS)
