"""Extract data from CSVs into Pandas dataframes
"""

from os import path
import pandas
import numpy
import yaml
from sqlalchemy import create_engine
from sqlalchemy.schema import DropSchema
from base import *


ENGINE = create_engine('postgresql://postgres@localhost:5433/pdcms')

# Drop schema for a fresh start
# with ENGINE.connect() as conn:
    # conn.execute(DropSchema('audit', cascade=True))

for key in CFG.keys():
    # Extract
    table = ETLDataTable(CFG[key]['table'], CFG[key]['file'])
    table.load_df()
    # table = table.strip_strings()
    print(table.frame.head())

    # Transform
    table.lowercase_columns()
    table.strip_strings()
    table.coerce_to_date(CFG[key]['date_columns'])

    # Load
    conn = ENGINE.connect()
    table.save_to_table(conn)
    conn.close()

# Indexing everything
with ENGINE.connect() as conn:
    # conn.execute('CREATE INDEX adr_date_idx ON addresses (adr_date);')
    # conn.execute('CREATE INDEX adr_street1_idx ON addresses (adr_street1);')
    # conn.execute('CREATE INDEX adr_street2_idx ON addresses (adr_street2);')
    # conn.execute('CREATE INDEX adr_phone_idx ON addresses (adr_ph_number);')
    conn.execute('CREATE INDEX cas_clientid_idx ON cases (cas_clientid);')
    conn.execute('CREATE INDEX cas_aliasid_idx ON cases (cas_aliasid);')
    conn.execute('CREATE INDEX cas_person_idx ON cases (cas_aliasid, cas_clientid);')
    conn.execute('CREATE INDEX cas_closed_date_idx ON cases (cas_closed_date, cas_case_status);')
    conn.execute('CREATE INDEX cas_open_date_idx ON cases (cas_open_date);')
    conn.execute('CREATE INDEX cas_status_idx ON cases (cas_case_status);')
    conn.execute('CREATE INDEX cas_type_idx ON cases (cas_case_type);')
    conn.execute('CREATE INDEX cas_chg_num_idx ON cases (cas_tc_number);')
    conn.execute('CREATE INDEX cas_top_charge_idx ON cases (cas_tc_short);')
    conn.execute('CREATE INDEX cas_detail_idx ON cases (cas_case_detail);')
    conn.execute('CREATE INDEX cas_entry_date_idx ON cases (cas_entry_date DESC);')
    conn.execute('CREATE INDEX cas_indictment_idx ON cases (cas_indictment);')
    conn.execute('CREATE INDEX cas_docket_idx ON cases (cas_docket);')
    conn.execute('CREATE INDEX cas_judge_idx ON cases (cas_judge);')
    conn.execute('CREATE INDEX cas_entry_user_idx ON cases (cas_entry_user);')
    conn.execute('CREATE INDEX cust_code_idx ON custody_statuses (cust_def_case_status);')
    conn.execute('CREATE INDEX custody_date_idx ON custody_statuses (cust_date_entered, cust_def_case_status);')
    conn.execute('CREATE INDEX dsp_action_idx ON dispositions (dsp_action, dsp_top_chg);')
    conn.execute('CREATE INDEX dsp_date_action_idx ON dispositions (dsp_date DESC, dsp_top_chg, dsp_action);')
    conn.execute('CREATE INDEX dsp_fin_chg_dsc_idx ON dispositions (dsp_final_chg_short, dsp_top_chg);')
    conn.execute('CREATE INDEX dsp_fin_chg_num_idx ON dispositions (dsp_final_chg_number, dsp_top_chg);')
    conn.execute('CREATE INDEX dsp_fin_chg_typ_idx ON dispositions (dsp_final_chg_type, dsp_top_chg);')
    conn.execute('CREATE INDEX dsp_top_chg_idx ON dispositions (dsp_top_chg);')
    conn.execute('CREATE INDEX dsp_ini_chg_atd_idx ON dispositions (dsp_ini_chg_atd, dsp_top_chg);')
    conn.execute('CREATE INDEX dsp_ini_chg_dsc_idx ON dispositions (dsp_ini_chg_short, dsp_top_chg);')
    conn.execute('CREATE INDEX dsp_ini_chg_num_idx ON dispositions (dsp_ini_chg_number, dsp_top_chg);')
    conn.execute('CREATE INDEX dsp_ini_chg_typ_idx ON dispositions (dsp_ini_chg_type, dsp_top_chg);')
    conn.execute('CREATE INDEX evt_court_idx ON events (evt_court, evt_event_date);')
    conn.execute('CREATE INDEX evt_date_idx ON events (evt_event_date);')
    conn.execute('CREATE INDEX evt_attorney_idx ON events (evt_attorney);')
    conn.execute('CREATE INDEX evt_main_d_idx ON events (evt_file_number, evt_event_date);')
    conn.execute('CREATE INDEX loi_file_number_idx ON loi (loi_file_number);')
    conn.execute('CREATE INDEX loi_nam_alias_idx ON loi (loi_nameid, loi_nameid_alias);')
    conn.execute('CREATE INDEX loi_lnk_alias_idx ON loi (loi_name_link, loi_name_link_alias);')
    conn.execute('CREATE INDEX loi_nysid_idx ON loi (loi_nysid);')
    conn.execute('CREATE INDEX loi_nameid_idx ON loi (loi_nameid);')
    conn.execute('CREATE INDEX loi_type_idx ON loi (loi_type);')
    conn.execute('CREATE INDEX loi_sys_date_idx ON loi (loi_system_date);')
    conn.execute('CREATE INDEX mem_attorney_idx ON main_memos (mem_attorneyid);')
    conn.execute('CREATE INDEX mem_date_idx ON main_memos (mem_date);')
    conn.execute('CREATE INDEX nam_alias_link_idx ON names (nam_alias_link);')
    conn.execute('CREATE INDEX nam_nysid_idx ON names (nam_nysid);')
    conn.execute('CREATE INDEX nam_full_name_idx ON names (nam_last_name, nam_first_name);')
    conn.execute('CREATE INDEX nam_interpreter_idx ON names (nam_interpreter);')
    conn.execute('CREATE INDEX res_file_number_idx ON results (res_file_number);')
    conn.execute('CREATE INDEX res_code_idx ON results (res_code);')
    conn.execute('CREATE INDEX res_detail_idx ON results (res_detail);')
    conn.execute('CREATE INDEX res_purpose_idx ON results (res_purpose);')
    conn.execute('CREATE INDEX res_date_idx ON results (res_date);')
    conn.execute('CREATE INDEX res_userid_idx ON results (res_userid);')
    conn.execute('CREATE INDEX snt_file_number_idx on sentences (snt_file_number);')
    conn.execute('CREATE INDEX snt_type_idx ON sentences (snt_type);')
    conn.execute('CREATE INDEX snt_chg_dscr_idx ON sentences (snt_chg_descr);')
    conn.execute('CREATE INDEX snt_condition_idx ON sentences (snt_condition);')
    conn.execute('CREATE INDEX snt_date_idx ON sentences (snt_date);')
