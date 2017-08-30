-- Postgresql schema, including changes
-- Prioritizing analysis instead of viewing in the app

-- Remove table Fil_Adjudication because it's empty
-- Remove table Fil_MemoPages2 because it's empty
-- Remove table Fil_SuppCharge because it's empty
-- Remove tables about income because they are empty

CREATE TABLE addresses (
  adr_nameid character varying,
  adr_file_number character varying,
  adr_type character varying,
  adr_date character varying,
  -- ALWAYS 0 adr_yrs_place character varying,
  -- ALWAYS 0 adr_yrs_area character varying,
  adr_print character varying,
  adr_street1 character varying,
  adr_street2 character varying,
  adr_city character varying,
  adr_state character varying,
  adr_zipcode character varying,
  adr_ph_number character varying,
  adr_more_phones character varying,
  UNIQUE (adr_nameid, adr_file_number, adr_type, adr_date, adr_street1)
);

ALTER TABLE addresses OWNER TO postgres;

CREATE INDEX adr_date_idx ON addresses (adr_date);
CREATE INDEX adr_street1_idx ON addresses (adr_street1);
CREATE INDEX adr_street2_idx ON addresses (adr_street2);
CREATE INDEX adr_full_address_idx ON addresses (adr_street1, adr_street2, adr_city, adr_state, adr_zipcode);
CREATE INDEX adr_phone_idx ON addresses (adr_ph_number);


CREATE TABLE cases (
  cas_clientid character varying,
  cas_aliasid character varying,
  cas_file_number character varying UNIQUE,
  cas_case_status character varying,
  cas_open_date character varying,
  cas_closed_date character varying,
  cas_case_type character varying,
  cas_case_detail character varying,
  cas_orig_tc_number character varying,
  cas_orig_tc_short character varying,
  cas_orig_tc_type character varying,
  cas_orig_tc_atd character varying,
  cas_tc_count character varying,
  cas_tc_number character varying,
  cas_tc_short character varying,
  cas_tc_type character varying,
  cas_tc_atd character varying,
  cas_more_chgs character varying,
  cas_fc_number character varying,
  cas_fc_short character varying,
  cas_fc_type character varying,
  cas_court character varying,
  cas_atty character varying,
  cas_judge character varying,
  cas_ada character varying,
  cas_intake_type character varying,
  cas_def_status character varying,
  cas_crime_date character varying,
  cas_crime_time character varying,
  cas_arrest_date character varying,
  cas_arrest_time character varying,
  cas_arrest_location character varying,
  cas_arrest_warrant character varying,
  cas_bail_set character varying,
  cas_bond character varying,
  cas_date_bail_posted character varying,
  cas_date_bail_set character varying,
  cas_imm_bond character varying,
  cas_bail_bond_notes text,
  cas_interviewed character varying,
  cas_intvw_atty character varying,
  cas_fam_file_number character varying,
  cas_extensions character varying,
  cas_clinic_ref_1 character varying,
  cas_priors character varying,
  cas_parole character varying,
  cas_probation character varying,
  cas_cr_number character varying,
  cas_entry_date character varying,
  cas_entry_time character varying,
  cas_entry_user character varying,
  cas_interview_date character varying,
  cas_indictment character varying,
  cas_sci character varying,
  cas_docket character varying,
  cas_din character varying,
  cas_arrest_number character varying,
  cas_idv_ct_number character varying,
  cas_precinct character varying,
  cas_warrant character varying,
  cas_pin character varying,
  cas_otherprov1 character varying,
  cas_otherprov2 character varying,
  cas_otherprov3 character varying,
  cas_idv_famfileno character varying,
  cas_number_type character varying,
  cas_arraigndate character varying,
  cas_sent_days numeric
);

ALTER TABLE cases OWNER TO postgres;

CREATE INDEX cas_clientid_idx ON cases (cas_clientid);
CREATE INDEX cas_aliasid_idx ON cases (cas_aliasid);
CREATE INDEX cas_person_idx ON cases (cas_aliasid, cas_clientid);
CREATE INDEX cas_closed_date_idx ON cases (cas_closed_date, cas_case_status);
CREATE INDEX cas_open_date_idx ON cases (cas_open_date);
CREATE INDEX cas_status_idx ON cases (cas_case_status);
CREATE INDEX cas_type_idx ON cases (cas_case_type);
CREATE INDEX cas_chg_num_idx ON cases (cas_tc_number);
CREATE INDEX cas_top_charge_idx ON cases (cas_tc_short);
CREATE INDEX cas_detail_idx ON cases (cas_case_detail);
CREATE INDEX cas_entry_date_idx ON cases (cas_entry_date DESC);
CREATE INDEX cas_indictment_idx ON cases (cas_indictment);
CREATE INDEX cas_docket_idx ON cases (cas_docket);
CREATE INDEX cas_judge_idx ON cases (cas_judge);
CREATE INDEX cas_entry_user_idx ON cases (cas_entry_user);



CREATE TABLE custody_statuses (
  cust_file_number character varying,
  cust_nameid character varying,
  cust_date_entered character varying,
  cust_def_case_status character varying,
  UNIQUE(cust_nameid, cust_file_number, cust_date_entered)
);

ALTER TABLE custody_statuses OWNER TO postgres;

CREATE INDEX cust_code_idx ON custody_statuses (cust_def_case_status);
CREATE INDEX custody_date_idx ON custody_statuses (cust_date_entered, cust_def_case_status);
CREATE INDEX custody_nameid_idx ON custody_statuses (cust_nameid, cust_file_number, cust_date_entered DESC);


CREATE TABLE dispositions (
  dsp_file_number character varying,
  dsp_order integer,
  dsp_top_chg boolean,
  dsp_in_chg_count character varying,
  dsp_ini_chg_short character varying,
  dsp_ini_chg_number character varying,
  dsp_ini_chg_type character varying,
  dsp_ini_chg_atd character varying,
  dsp_case_open_date character varying,
  dsp_date character varying,
  dsp_action character varying,
  dsp_final_chg_short character varying,
  dsp_final_chg_number character varying,
  dsp_final_chg_type character varying,
  dsp_final_chg_atd character varying,
  dsp_notes text,
  UNIQUE (dsp_file_number, dsp_top_chg, dsp_final_chg_number, dsp_order)
);


ALTER TABLE dispositions OWNER TO postgres;

CREATE INDEX dsp_action_idx ON dispositions (dsp_action, dsp_top_chg);
CREATE INDEX dsp_date_action_idx ON dispositions (dsp_date DESC, dsp_top_chg, dsp_action);
CREATE INDEX dsp_fin_chg_dsc_idx ON dispositions (dsp_final_chg_short, dsp_top_chg);
CREATE INDEX dsp_fin_chg_num_idx ON dispositions (dsp_final_chg_number, dsp_top_chg);
CREATE INDEX dsp_fin_chg_typ_idx ON dispositions (dsp_final_chg_type, dsp_top_chg);
CREATE INDEX dsp_top_chg_idx ON dispositions (dsp_top_chg);
CREATE INDEX dsp_ini_chg_atd_idx ON dispositions (dsp_ini_chg_atd, dsp_top_chg);
CREATE INDEX dsp_ini_chg_dsc_idx ON dispositions (dsp_ini_chg_short, dsp_top_chg);
CREATE INDEX dsp_ini_chg_num_idx ON dispositions (dsp_ini_chg_number, dsp_top_chg);
CREATE INDEX dsp_ini_chg_typ_idx ON dispositions (dsp_ini_chg_type, dsp_top_chg);


CREATE TABLE events (
  evt_file_number character varying,
  evt_event_type character varying,
  evt_event_date character varying,
  evt_court character varying,
  evt_purpose character varying,
  evt_time character varying,
  evt_attorney character varying,
  evt_judge character varying,
  evt_ada character varying,
  evt_notes text,
  UNIQUE (evt_file_number, evt_event_date, evt_court, evt_purpose, evt_time, evt_attorney)
);

ALTER TABLE events OWNER TO postgres;

CREATE INDEX evt_court_idx ON events (evt_court, evt_event_date);
CREATE INDEX evt_date_idx ON events (evt_event_date);
CREATE INDEX evt_attorney_idx ON events (evt_attorney);
CREATE INDEX evt_main_d_idx ON events (evt_file_number, evt_event_date);

CREATE TABLE loi (
  loi_name_link character varying,
  loi_name_link_alias character varying,
  loi_file_number character varying,
  loi_system_date character varying,
  loi_nameid character varying,
  loi_nameid_alias character varying,
  loi_type character varying,
  loi_dob character varying,
  loi_ssn character varying,
  loi_nysid character varying,
  loi_notes text,
  UNIQUE (loi_name_link, loi_file_number, loi_nameid, loi_type)
);

ALTER TABLE loi OWNER TO postgres;

CREATE INDEX loi_file_number_idx ON loi (loi_file_number);
CREATE INDEX loi_nam_alias_idx ON loi (loi_nameid, loi_nameid_alias);
CREATE INDEX loi_lnk_alias_idx ON loi (loi_name_link, loi_name_link_alias);
CREATE INDEX loi_nysid_idx ON loi (loi_nysid);
CREATE INDEX loi_nameid_idx ON loi (loi_nameid);
CREATE INDEX loi_type_idx ON loi (loi_type);
CREATE INDEX loi_sys_date_idx ON loi (loi_system_date);


CREATE TABLE main_memos (
  mem_file_number character varying,
  mem_number character varying,
  mem_attorneyid character varying,
  mem_date character varying,
  mem_event_date character varying,
  mem_reference text,
  UNIQUE (mem_file_number, mem_number, mem_attorneyid, mem_date)
);

ALTER TABLE main_memos OWNER TO postgres;

CREATE INDEX mem_attorney_idx ON main_memos (mem_attorneyid);
CREATE INDEX mem_date_idx ON main_memos (mem_date);


CREATE TABLE names (
  nam_nameid character varying PRIMARY KEY UNIQUE,
  nam_alias_link character varying,
  nam_moris_number character varying,
  nam_nysid character varying,
  nam_ssn character varying,
  nam_alien_number character varying,
  nam_fbi_number character varying,
  nam_last_name character varying,
  nam_soundx character varying,
  nam_first_name character varying,
  nam_middle_name character varying,
  nam_dob character varying,
  nam_interpreter character varying,
  nam_country_born character varying,
  nam_race character varying,
  nam_gender character varying,
  nam_ethnicity character varying,
  nam_marital_status character varying,
  nam_household_size character varying,
  nam_school character varying,
  nam_last_grade character varying,
  nam_citizenship character varying,
  nam_green_card character varying,
  nam_imm_stat character varying,
  nam_imm_date_gc character varying,
  nam_imm_eff_dt_stat character varying,
  nam_imm_entry_date character varying,
  nam_imm_entry_stat character varying,
  nam_imm_ice_detainer character varying,
  nam_imm_pre_deported character varying,
  nam_status_source character varying,
  nam_when_status character varying,
  nam_military_service character varying,
  nam_mil_rank character varying,
  nam_mil_branch character varying,
  nam_mil_svc_dates character varying,
  nam_mil_dischg_type character varying,
  nam_mil_decor_combat character varying,
  nam_in_area_since character varying,
  nam_type_of_name character varying,
  nam_outst_warr character varying
);

ALTER TABLE names OWNER TO postgres;

CREATE INDEX nam_alias_link_idx ON names (nam_alias_link);
CREATE INDEX nam_nysid_idx ON names (nam_nysid);
CREATE INDEX nam_full_name_idx ON names (nam_last_name, nam_first_name);
CREATE INDEX nam_interpreter_idx ON names (nam_interpreter);

CREATE TABLE results (
  res_file_number character varying,
  res_userid character varying,
  res_code character varying,
  res_date character varying,
  res_court character varying,
  res_purpose character varying,
  res_detail character varying,
  UNIQUE (res_file_number, res_date, res_userid, res_code, res_court, res_purpose, res_detail)
);

ALTER TABLE results OWNER TO postgres;

CREATE INDEX res_file_number_idx ON results (res_file_number);
CREATE INDEX res_code_idx ON results (res_code);
CREATE INDEX res_detail_idx ON results (res_detail);
CREATE INDEX res_purpose_idx ON results (res_purpose);
CREATE INDEX res_date_idx ON results (res_date);
CREATE INDEX res_userid_idx ON results (res_userid);


CREATE TABLE sentences (
  snt_file_number character varying,
  snt_order integer,
  snt_topchg boolean,
  snt_chg_number character varying,
  snt_chg_descr character varying,
  snt_chg_type character varying,
  snt_date character varying,
  snt_type character varying,
  snt_length character varying,
  snt_condition character varying,
  snt_notes character varying,
  UNIQUE (snt_file_number, snt_topchg, snt_order, snt_date, snt_chg_number)
);

ALTER TABLE sentences OWNER TO postgres;

CREATE INDEX snt_file_number_idx on sentences (snt_file_number);
CREATE INDEX snt_type_idx ON sentences (snt_type);
CREATE INDEX snt_chg_dscr_idx ON sentences (snt_chg_descr);
CREATE INDEX snt_condition_idx ON sentences (snt_condition);
CREATE INDEX snt_date_idx ON sentences (snt_date);


CREATE TABLE court_list (
  ct_code character varying UNIQUE,
  ct_description character varying,
  ct_street character varying,
  ct_city character varying,
  ct_state character varying,
  ct_zipcode character varying,
  ct_phone_num character varying,
  ct_time character varying,
  ct_group character varying
);

ALTER TABLE court_list OWNER TO postgres;


CREATE TABLE regions_list (
  rg_code character varying UNIQUE,
  rg_name character varying,
  rg_logical boolean,
  rg_spare character varying
);

ALTER TABLE regions_list OWNER TO postgres;
