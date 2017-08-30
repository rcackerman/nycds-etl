-- Queries to get export data
SELECT
 adr_NameID,
 adr_File_Number,
 adr_Type,
 adr_Date,
 adr_Print,
 adr_Street1,
 adr_Street2,
 adr_City,
 adr_State,
 adr_ZipCode,
 adr_Ph_Number,
 adr_More_Phones
FROM Fil_Addresses
;

SELECT
  cas_ClientID,
  cas_AliasID,
  cas_File_Number,
  cas_Case_Status,
  cas_Open_Date,
  cas_Closed_Date,
  cas_Case_Type,
  cas_Case_Detail,
  cas_Orig_TC_Number,
  cas_Orig_TC_Short,
  cas_Orig_TC_Type,
  cas_Orig_TC_ATD,
  cas_TC_Count,
  cas_TC_Number,
  cas_TC_Short,
  cas_TC_Type,
  cas_TC_ATD,
  cas_More_Chgs,
  cas_FC_Number,
  cas_FC_Short,
  cas_FC_Type,
  cas_Court,
  cas_Atty,
  cas_Judge,
  cas_ADA,
  cas_Intake_Type,
  cas_Def_Status,
  cas_Crime_Date,
  cas_Crime_Time,
  cas_Arrest_Date,
  cas_Arrest_Time,
  cas_Arrest_Location,
  cas_Arrest_Warrant,
  cas_Bail_Set,
  cas_Bond,
  cas_Date_Bail_Posted,
  cas_Date_Bail_Set,
  cas_Imm_Bond,
  cas_Bail_Bond_Notes,
  cas_Interviewed,
  cas_Intvw_Atty,
  cas_Fam_File_Number,
  cas_Extensions,
  cas_Clinic_Ref_1,
  cas_Priors,
  cas_Parole,
  cas_Probation,
  cas_CR_Number,
  cas_Entry_Date,
  cas_Entry_Time,
  cas_Entry_User,
  cas_Interview_Date,
  cas_Indictment,
  cas_SCI,
  cas_Docket,
  cas_DIN,
  cas_Arrest_Number,
  cas_IDV_CT_Number,
  cas_Precinct,
  cas_Warrant,
  cas_PIN,
  cas_OtherProv1,
  cas_OtherProv2,
  cas_OtherProv3,
  cas_IDV_FamFileNo,
  cas_Number_Type,
  cas_ArraignDate,
  cas_Sent_Days
FROM Fil_Cases;

SELECT
res_File_Number,
res_USerID,
res_Code,
res_Date,
res_Court,
res_Purpose,
res_Detail
FROM Fil_Results;

SELECT
  snt_File_Number,
  snt_Order,
  snt_TopChg,
  snt_Chg_Number,
  snt_Chg_Descr,
  snt_Chg_Type,
  snt_Date,
  snt_Type,
  snt_Length,
  snt_Condition,
  snt_Notes
FROM Fil_Sent2;

SELECT
cust_File_Number,
cust_NameID,
cust_Date_Entered,
cust_Def_Case_Status
FROM Fil_CustodyStatus2;

SELECT
  dsp_File_Number,
  dsp_Order,
  dsp_Top_Chg,
  dsp_in_Chg_Count,
  dsp_ini_Chg_Short,
  dsp_ini_Chg_Number,
  dsp_ini_Chg_Type,
  dsp_ini_Chg_ATD,
  dsp_Date,
  dsp_Action,
  dsp_Final_Chg_Short,
  dsp_Final_Chg_Number,
  dsp_Final_Chg_Type,
  dsp_Final_Chg_ATD,
  dsp_Notes
FROM Fil_Dispo2
;

SELECT
  evt_File_Number,
  evt_Event_Type,
  evt_Event_Date,
  evt_Court,
  evt_Purpose,
  evt_Time,
  evt_Attorney,
  evt_Judge,
  evt_ADA,
  evt_Notes
FROM Fil_Events
;

SELECT
  loi_Name_Link,
  loi_Name_Link_Alias,
  loi_File_Number,
  loi_System_Date,
  loi_NameID,
  loi_NameID_Alias,
  loi_Type,
  loi_DOB,
  loi_SSN,
  loi_NYSID,
  loi_Notes
FROM Fil_LOI
;

SELECT
  mem_File_Number,
  mem_Number,
  mem_AttorneyID,
  mem_Date,
  mem_Event_Date,
  mem_Reference
FROM Fil_MemoMain;

SELECT
nam_NameID,
nam_Alias_Link,
nam_Moris_Number,
nam_NYSID,
nam_SSN,
nam_Alien_Number,
nam_FBI_Number,
nam_Last_Name,
nam_SoundX,
nam_First_Name,
nam_Middle_Name,
nam_DOB,
nam_Interpreter,
nam_Country_born,
nam_Race,
nam_Gender,
nam_Ethnicity,
nam_Marital_Status,
nam_Household_Size,
nam_School,
nam_Last_Grade,
nam_Citizenship,
nam_Green_Card,
nam_Imm_Stat,
nam_imm_Date_GC,
nam_imm_Eff_Dt_Stat,
nam_imm_Entry_Date,
nam_imm_Entry_Stat,
nam_imm_ICE_Detainer,
nam_imm_Pre_Deported,
nam_Status_Source,
nam_When_Status,
nam_Military_Service,
nam_mil_Rank,
nam_mil_Branch,
nam_mil_Svc_Dates,
nam_mil_Dischg_Type,
nam_mil_Decor_Combat,
nam_In_area_since,
nam_Type_of_Name,
nam_Outst_Warr
FROM Fil_Names;