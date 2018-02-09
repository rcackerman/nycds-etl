# nycds-etl
The saddest of ETL processes

### Things to know

1. CSVs must use tabs instead of commas, since many notes contain `,"`, which confuses everything.
2. Export using the queries in `exporting_from_pervasive.sql`. These queries do not include columns that are never used.


### Steps
This ETL is currently pretty fragile. You must run these steps in order.

1. In the export dialogue, select the checkbox to include headers, use tab-separation and the pre-selected format.
2. Save the file in the PDCMS folder on the server, with the correct name (below).
3. Transfer from server to Z to this folder. This may take a while. (Save a copy as backup.)
4. Run `clean_csvs.py`.
5. Check that there is a `*_cleaned.csv` for every csv of data.
6. Run `load_csvs.py`.
7. Grab a coffe.
8. Run `update_empty_strings_to_null.py`.
9. Go for a long lunch.


### Names

| Name in PDCMS DB  | Necessary file name  |
|-------------------|----------------------|
| Fil_Addresses     | addresses.csv        |
|-------------------|----------------------|
| Fil_Cases         | cases.csv            |
|-------------------|----------------------|
| Fil_CustodyStatus2| custody_statuses.csv |
|-------------------|----------------------|
| Fil_Dispo2        | dispositions.csv     |
|-------------------|----------------------|
| Fil_Events        | events.csv           |
|-------------------|----------------------|
| Fil_LOI           | loi.csv              |
|-------------------|----------------------|
| Fil_MemoMain      | memo_main.csv        |
|-------------------|----------------------|
| Fil_Names         | names.csv            |
|-------------------|----------------------|
| Fil_Results       | results.csv          |
|-------------------|----------------------|
| Fil_Sent2         | sentences.csv        |
|-------------------|----------------------|
