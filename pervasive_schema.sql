/* ==========================================
 * TABLE: Fil_Addresses
 * ========================================== */
CREATE TABLE "Fil_Addresses"(
 "adr_NameID" CHAR(8),
 "adr_File_Number" CHAR(10),
 "adr_Type" CHAR(1),
 "adr_Date" DATE,
 "adr_Yrs_Place" SMALLINT,
 "adr_Yrs_Area" SMALLINT,
 "adr_Print" CHAR(1),
 "adr_Street1" CHAR(45),
 "adr_Street2" CHAR(45),
 "adr_City" CHAR(20),
 "adr_State" CHAR(2),
 "adr_ZipCode" CHAR(5),
 "adr_Ph_Number" CHAR(10),
 "adr_More_Phones" CHAR(1)
);
CREATE INDEX "adr_idx_Date" ON "Fil_Addresses"("adr_Date");
CREATE INDEX "adr_idx_Last" ON "Fil_Addresses"("adr_File_Number", "adr_Type", "adr_Date" DESC);
CREATE INDEX "adr_idx_Name" ON "Fil_Addresses"("adr_NameID", "adr_Type", "adr_Date" DESC);
CREATE UNIQUE INDEX "adr_idx_NameID" ON "Fil_Addresses"("adr_NameID", "adr_File_Number" DESC, "adr_Type", "adr_Date" DESC, "adr_Street1");


/* ==========================================
 * TABLE: Fil_Adjudication
 * ========================================== */
CREATE TABLE "Fil_Adjudication"(
 "adj_File_Number" CHAR(10),
 "adj_Top" BIT,
 "adj_ChildID" CHAR(8),
 "adj_Date" DATE,
 "adj_Code" CHAR(10),
 "adj_x_Date1" DATE,
 "adj_x_Date2" DATE,
 "adj_x_number1" DOUBLE,
 "adj_x_number2" DOUBLE,
 "adj_x_number3" DOUBLE,
 "adj_x_alpha1" CHAR(25),
 "adj_x_alpha2" CHAR(25),
 "adj_Notes" LONGVARCHAR
);
CREATE INDEX "idx_adj_Code" ON "Fil_Adjudication"("adj_Code", "adj_Top" DESC);
CREATE INDEX "idx_adj_Date_Code" ON "Fil_Adjudication"("adj_Date" DESC, "adj_Top" DESC, "adj_Code");
CREATE UNIQUE INDEX "idx_adj_File_Number" ON "Fil_Adjudication"("adj_File_Number", "adj_Top" DESC, "adj_Date", "adj_ChildID", "adj_Code");
CREATE INDEX "idx_adj_Latest" ON "Fil_Adjudication"("adj_File_Number", "adj_Top" DESC);
CREATE INDEX "idx_dsp_ini_Chg_Dsc" ON "Fil_Adjudication"("adj_ChildID", "adj_Top" DESC);


/* ==========================================
 * TABLE: Fil_Cases
 * ========================================== */
CREATE TABLE "Fil_Cases"(
 "cas_ClientID" CHAR(8),
 "cas_AliasID" CHAR(8),
 "cas_File_Number" CHAR(10),
 "cas_Linked_File" CHAR(10),
 "cas_Case_Status" CHAR(1),
 "cas_Open_Date" DATE,
 "cas_Age_at_Open" SMALLINT,
 "cas_Closed_Date" DATE,
 "cas_Case_Type" CHAR(20),
 "cas_Case_Detail" CHAR(20),
 "cas_Orig_TC_Number" CHAR(10),
 "cas_Orig_TC_Short" CHAR(22),
 "cas_Orig_TC_Type" CHAR(4),
 "cas_Orig_TC_ATD" CHAR(1),
 "cas_Orig_TC_UCR" CHAR(3),
 "cas_TC_Count" SMALLINT,
 "cas_TC_Number" CHAR(10),
 "cas_TC_Short" CHAR(22),
 "cas_TC_Type" CHAR(4),
 "cas_TC_ATD" CHAR(1),
 "cas_TC_UCR" CHAR(3),
 "cas_More_Chgs" CHAR(1),
 "cas_FC_Number" CHAR(10),
 "cas_FC_Short" CHAR(22),
 "cas_FC_Type" CHAR(4),
 "cas_Court" CHAR(4),
 "cas_Atty" CHAR(8),
 "cas_Judge" CHAR(20),
 "cas_ADA" CHAR(20),
 "cas_Intake_Type" CHAR(20),
 "cas_Def_Status" CHAR(5),
 "cas_Crime_Date" DATE,
 "cas_Age_at_Crime" SMALLINT,
 "cas_Crime_Time" TIME,
 "cas_Arrest_Date" DATE,
 "cas_Age_at_Arrest" SMALLINT,
 "cas_Arrest_Time" TIME,
 "cas_Arrest_Location" CHAR(200),
 "cas_Arrest_Warrant" CHAR(1),
 "cas_Bail_Set" DOUBLE,
 "cas_Bond" DOUBLE,
 "cas_Date_Bail_Posted" DATE,
 "cas_Where_Bail_Post" CHAR(20),
 "cas_Date_Bail_Set" DATE,
 "cas_Where_Bond_Post" CHAR(20),
 "cas_Surety_Name" CHAR(80),
 "cas_Bondsman_Name" CHAR(80),
 "cas_Surety_SSN" CHAR(9),
 "cas_Surety_Address" CHAR(240),
 "cas_Imm_Bond" DOUBLE,
 "cas_Bail_Bond_Notes" CHAR(240),
 "cas_Interviewed" BIT,
 "cas_Intvw_Atty" CHAR(8),
 "cas_Fam_File_Number" CHAR(25),
 "cas_Pre_24_Case" CHAR(10),
 "cas_Extensions" SMALLINT,
 "cas_Pending_Chgs" CHAR(1),
 "cas_Unusual_Features" CHAR(80),
 "cas_Injuries" CHAR(1),
 "cas_Photos" CHAR(1),
 "cas_Clinic_Ref_1" CHAR(1),
 "cas_Priors" CHAR(20),
 "cas_Prior_PD" CHAR(1),
 "cas_Prior_Felon" CHAR(1),
 "cas_Other_BW" CHAR(1),
 "cas_Prior_Sentence" CHAR(1),
 "cas_Prior_ROR" CHAR(1),
 "cas_Prior_BW" CHAR(1),
 "cas_Parole" CHAR(1),
 "cas_Probation" CHAR(1),
 "cas_Eligible" CHAR(1),
 "cas_Case_722D" CHAR(1),
 "cas_Assigned_ARR" CHAR(1),
 "cas_Case_Name" CHAR(50),
 "cas_Personal_Problem" CHAR(30),
 "cas_CR_Number" CHAR(10),
 "cas_Entry_Date" DATE,
 "cas_Entry_Time" TIME,
 "cas_Entry_User" CHAR(8),
 "cas_Interview_Date" DATE,
 "cas_Assignment_Type" CHAR(8),
 "cas_Yes_No" CHAR(1),
 "cas_Indictment" CHAR(20),
 "cas_SCI" CHAR(20),
 "cas_Docket" CHAR(20),
 "cas_DIN" CHAR(20),
 "cas_722D_Amt" DOUBLE,
 "cas_Arrest_Number" CHAR(20),
 "cas_Barcode" CHAR(20),
 "cas_Beneficiaries" CHAR(20),
 "cas_Booking_Number" CHAR(20),
 "cas_Close_Number" CHAR(20),
 "cas_Legacy_Number" CHAR(20),
 "cas_FCT_Number" CHAR(20),
 "cas_Folder_Number" CHAR(20),
 "cas_Fund" CHAR(20),
 "cas_Grant" CHAR(20),
 "cas_IDV_CT_Number" CHAR(20),
 "cas_IDV_Docket" CHAR(20),
 "cas_Office" CHAR(20),
 "cas_Petitions" CHAR(20),
 "cas_Precinct" CHAR(20),
 "cas_Warrant" CHAR(20),
 "cas_PIN" CHAR(20),
 "cas_RestitutionAmt" DOUBLE,
 "cas_VoucherAmt" DOUBLE,
 "cas_Other_Amt1" DOUBLE,
 "cas_Other_Amt2" DOUBLE,
 "cas_OtherProv1" CHAR(20),
 "cas_OtherProv2" CHAR(20),
 "cas_OtherProv3" CHAR(20),
 "cas_IDV_FamFileNo" CHAR(20),
 "cas_x_ImpNum6" CHAR(20),
 "cas_x_ImpNum7" CHAR(20),
 "cas_x_ImpNum8" CHAR(20),
 "cas_x_ImpNum9" CHAR(20),
 "cas_TrialType" CHAR(20),
 "cas_ATD_Case" CHAR(1),
 "cas_Pending_Cases" CHAR(1),
 "cas_Number_Type" CHAR(20),
 "cas_ArraignDate" DATE,
 "cas_Ind_Date" DATE,
 "cas_GJ_Date" DATE,
 "cas_x_Time1" TIME,
 "cas_x_Time2" TIME,
 "cas_x_Time3" TIME,
 "cas_Sent_Days" DOUBLE,
 "cas_NumOfDefs" DOUBLE,
 "cas_x_Number3" DOUBLE,
 "cas_x_Alpha1" CHAR(50),
 "cas_x_Alpha2" CHAR(50),
 "cas_x_Alpha3" CHAR(50)
);
CREATE INDEX "idx_Fam_File_Number" ON "Fil_Cases"("cas_Fam_File_Number");
CREATE INDEX "idx_cas_ADA" ON "Fil_Cases"("cas_ADA");
CREATE INDEX "idx_cas_Alias_Number" ON "Fil_Cases"("cas_AliasID", "cas_Open_Date" DESC, "cas_File_Number" DESC);
CREATE INDEX "idx_cas_Atty" ON "Fil_Cases"("cas_Atty");
CREATE INDEX "idx_cas_CR_Number" ON "Fil_Cases"("cas_CR_Number");
CREATE INDEX "idx_cas_Chg_Num" ON "Fil_Cases"("cas_TC_Number");
CREATE INDEX "idx_cas_Client_ID" ON "Fil_Cases"("cas_ClientID", "cas_File_Number" DESC);
CREATE INDEX "idx_cas_Closed_Date" ON "Fil_Cases"("cas_Closed_Date", "cas_Case_Status");
CREATE INDEX "idx_cas_Date_CT_Chg" ON "Fil_Cases"("cas_Open_Date", "cas_Court", "cas_TC_Short");
CREATE INDEX "idx_cas_Date_Chg_CT" ON "Fil_Cases"("cas_Open_Date", "cas_TC_Short", "cas_Court");
CREATE INDEX "idx_cas_Detail" ON "Fil_Cases"("cas_Case_Detail");
CREATE INDEX "idx_cas_Entry_Date" ON "Fil_Cases"("cas_Entry_Date" DESC);
CREATE INDEX "idx_cas_Entry_User" ON "Fil_Cases"("cas_Entry_User");
CREATE UNIQUE INDEX "idx_cas_File_Number" ON "Fil_Cases"("cas_File_Number");
CREATE INDEX "idx_cas_Indictment" ON "Fil_Cases"("cas_Indictment");
CREATE INDEX "idx_cas_Jdg" ON "Fil_Cases"("cas_Judge");
CREATE INDEX "idx_cas_Name" ON "Fil_Cases"("cas_Case_Name");
CREATE INDEX "idx_cas_Open_Date" ON "Fil_Cases"("cas_Open_Date");
CREATE INDEX "idx_cas_Status" ON "Fil_Cases"("cas_Case_Status");
CREATE INDEX "idx_cas_Top_Charge" ON "Fil_Cases"("cas_TC_Short");
CREATE INDEX "idx_cas_Type" ON "Fil_Cases"("cas_Case_Type");
CREATE INDEX "idx_case_Link_File" ON "Fil_Cases"("cas_Linked_File");


/* ==========================================
 * TABLE: Fil_CustodyStatus2
 * ========================================== */
CREATE TABLE "Fil_CustodyStatus2"(
 "cust_File_Number" CHAR(10),
 "cust_NameID" CHAR(8),
 "cust_Date_Entered" DATE,
 "cust_Def_Case_Status" CHAR(8)
);
CREATE INDEX "custody_Code" ON "Fil_CustodyStatus2"("cust_Def_Case_Status");
CREATE INDEX "custody_Date" ON "Fil_CustodyStatus2"("cust_Date_Entered", "cust_Def_Case_Status");
CREATE UNIQUE INDEX "custody_File_Number" ON "Fil_CustodyStatus2"("cust_File_Number", "cust_NameID", "cust_Date_Entered" DESC, "cust_Def_Case_Status");
CREATE INDEX "custody_NameID" ON "Fil_CustodyStatus2"("cust_NameID", "cust_File_Number", "cust_Date_Entered" DESC);


/* ==========================================
 * TABLE: Fil_Dispo2
 * ========================================== */
CREATE TABLE "Fil_Dispo2"(
 "dsp_File_Number" CHAR(10),
 "dsp_Order" SMALLINT,
 "dsp_Dispo_Type" CHAR(1),
 "dsp_ChildNo" CHAR(8),
 "dsp_Top_Chg" BIT,
 "dsp_in_Chg_Count" SMALLINT,
 "dsp_ini_Chg_Short" CHAR(22),
 "dsp_ini_Chg_Number" CHAR(10),
 "dsp_ini_Chg_Type" CHAR(4),
 "dsp_ini_Chg_ATD" CHAR(1),
 "dsp_ini_UCR" CHAR(3),
 "dsp_case_open_date" DATE,
 "dsp_Date" DATE,
 "dsp_Action" CHAR(10),
 "dsp_Final_Chg_Short" CHAR(22),
 "dsp_Final_Chg_Number" CHAR(10),
 "dsp_Final_Chg_Type" CHAR(4),
 "dsp_Final_Chg_ATD" CHAR(1),
 "dsp_Final_UCR" CHAR(3),
 "dsp_x_Date1" DATE,
 "dsp_x_Date2" DATE,
 "dsp_x_Date3" DATE,
 "dsp_x_number1" DOUBLE,
 "dsp_x_number2" DOUBLE,
 "dsp_x_number3" DOUBLE,
 "dsp_x_alpha1" CHAR(50),
 "dsp_x_alpha2" CHAR(50),
 "dsp_x_alpha3" CHAR(50),
 "dsp_ChildRow" BIT,
 "dsp_x_logical2" BIT,
 "dsp_x_logical3" BIT,
 "dsp_Notes" LONGVARCHAR
);
CREATE INDEX "idx_dsp_Action" ON "Fil_Dispo2"("dsp_Action", "dsp_Top_Chg");
CREATE INDEX "idx_dsp_Date_Action" ON "Fil_Dispo2"("dsp_Date" DESC, "dsp_Top_Chg", "dsp_Action");
CREATE INDEX "idx_dsp_File_Child" ON "Fil_Dispo2"("dsp_File_Number", "dsp_ChildRow", "dsp_Order", "dsp_Date", "dsp_ChildNo");
CREATE UNIQUE INDEX "idx_dsp_File_Number" ON "Fil_Dispo2"("dsp_File_Number", "dsp_ChildRow", "dsp_Top_Chg" DESC, "dsp_Order", "dsp_Date", "dsp_ini_Chg_Number");
CREATE INDEX "idx_dsp_Fin_Chg_Dsc" ON "Fil_Dispo2"("dsp_Final_Chg_Short", "dsp_Top_Chg");
CREATE INDEX "idx_dsp_Fin_Chg_Num" ON "Fil_Dispo2"("dsp_Final_Chg_Number", "dsp_Top_Chg");
CREATE INDEX "idx_dsp_Fin_Chg_Typ" ON "Fil_Dispo2"("dsp_Final_Chg_Type", "dsp_Top_Chg");
CREATE INDEX "idx_dsp_Fin_UCR" ON "Fil_Dispo2"("dsp_Final_UCR", "dsp_Top_Chg");
CREATE UNIQUE INDEX "idx_dsp_Latest" ON "Fil_Dispo2"("dsp_File_Number", "dsp_Order" DESC);
CREATE UNIQUE INDEX "idx_dsp_SentLink" ON "Fil_Dispo2"("dsp_File_Number", "dsp_Top_Chg" DESC, "dsp_Final_Chg_Number", "dsp_Order");
CREATE INDEX "idx_dsp_Top_Chg" ON "Fil_Dispo2"("dsp_Top_Chg");
CREATE INDEX "idx_dsp_ini_Chg_ATD" ON "Fil_Dispo2"("dsp_ini_Chg_ATD", "dsp_Top_Chg");
CREATE INDEX "idx_dsp_ini_Chg_Dsc" ON "Fil_Dispo2"("dsp_ini_Chg_Short", "dsp_Top_Chg");
CREATE INDEX "idx_dsp_ini_Chg_Num" ON "Fil_Dispo2"("dsp_ini_Chg_Number", "dsp_Top_Chg");
CREATE INDEX "idx_dsp_ini_Chg_Typ" ON "Fil_Dispo2"("dsp_ini_Chg_Type", "dsp_Top_Chg");
CREATE INDEX "idx_dsp_ini_UCR_O" ON "Fil_Dispo2"("dsp_ini_UCR", "dsp_Top_Chg");


/* ==========================================
 * TABLE: Fil_Events
 * ========================================== */
CREATE TABLE "Fil_Events"(
 "evt_File_Number" CHAR(10),
 "evt_Event_Type" CHAR(1),
 "evt_Event_Date" DATE,
 "evt_Court" CHAR(4),
 "evt_Purpose" CHAR(4),
 "evt_Time" TIME,
 "evt_Attorney" CHAR(8),
 "evt_Judge" CHAR(20),
 "evt_ADA" CHAR(20),
 "evt_ResultID" INTEGER,
 "evt_Marker" CHAR(1),
 "evt_Notes" LONGVARCHAR
);
CREATE INDEX "idx_evt_CT" ON "Fil_Events"("evt_Court", "evt_Event_Date");
CREATE INDEX "idx_evt_Date" ON "Fil_Events"("evt_Event_Date" DESC);
CREATE UNIQUE INDEX "idx_evt_Main_A" ON "Fil_Events"("evt_File_Number", "evt_Event_Date", "evt_Court", "evt_Purpose", "evt_Time", "evt_Attorney");
CREATE INDEX "idx_evt_Main_D" ON "Fil_Events"("evt_File_Number", "evt_Event_Date" DESC, "evt_Time" DESC);
CREATE INDEX "idx_evt_Sch" ON "Fil_Events"("evt_Event_Date", "evt_Court", "evt_Attorney");


/* ==========================================
 * TABLE: Fil_Finances
 * ========================================== */
CREATE TABLE "Fil_Finances"(
 "fin_NameID" CHAR(8),
 "fin_File_Number" CHAR(10),
 "fin_Date_Created" DATE,
 "fin_Employer_Name" CHAR(31),
 "fin_Job_Description" CHAR(31),
 "fin_Business_Phone" CHAR(10),
 "fin_Years_Employed" SMALLINT,
 "fin_Months_Employed" SMALLINT,
 "fin_Spouse_Employer" CHAR(31),
 "fin_Supp_Rcvd" CHAR(200),
 "fin_Bills_Paid_By" CHAR(80),
 "fin_Shelter_Prov" CHAR(80),
 "fin_SocSvcs_Rcvd" CHAR(3),
 "fin_Unemp_Rcvd" CHAR(3),
 "fin_Fam_Income" DOUBLE,
 "fin_Freq_Of_Pymt" CHAR(2),
 "fin_Use_IE_Table" BIT,
 "fin_Home_OwnRent" CHAR(8),
 "fin_RentMtg_Paid_By" CHAR(80),
 "fin_How_Much_Owed" DOUBLE,
 "fin_Vehicle" CHAR(3),
 "fin_Vehicle_Year" SMALLINT,
 "fin_Vehicle_Make" CHAR(10),
 "fin_Vehicle_Model" CHAR(20),
 "fin_Vehicle_Value" DOUBLE,
 "fin_Check_Bal" DOUBLE,
 "fin_Savings_Bal" DOUBLE,
 "fin_Cash" DOUBLE,
 "fin_Other_Assets" CHAR(50),
 "fin_Credit_Cards" CHAR(45),
 "fin_Bankruptcy" CHAR(3),
 "fin_Yr_Bankruptcy" SMALLINT,
 "fin_Other_Lblts" CHAR(50),
 "fin_Meet_Guidelines" CHAR(1),
 "fin_x_Numeric1" DOUBLE,
 "fin_x_Numeric2" DOUBLE,
 "fin_x_Date1" DATE,
 "fin_x_Date2" DATE,
 "fin_x_Logical1" BIT,
 "fin_x_Logical2" BIT,
 "fin_Special_Info" LONGVARCHAR
);
CREATE UNIQUE INDEX "NameID" ON "Fil_Finances"("fin_NameID", "fin_Date_Created", "fin_File_Number");


/* ==========================================
 * TABLE: Fil_IncomeExpenses
 * ========================================== */
CREATE TABLE "Fil_IncomeExpenses"(
 "ie_Client_Number" CHAR(8),
 "ie_RowID" DECIMAL(13,0),
 "ie_Source" CHAR(45),
 "ie_Pay_Stub" BIT,
 "ie_Amount" DOUBLE,
 "ie_Freq_Of_Pymt" CHAR(2),
 "ie_x_Date1" DATE,
 "ie_x_Date2" DATE,
 "ie_x_Alpha1" CHAR(30),
 "ie_x_Alpha2" CHAR(30),
 "ie_x_Numeric1" DOUBLE,
 "ie_x_Numeric2" DOUBLE,
 "ie_x_Logical1" BIT,
 "ie_x_Logical2" BIT
);
CREATE INDEX "ie_Client_No" ON "Fil_IncomeExpenses"("ie_Client_Number", "ie_RowID");


/* ==========================================
 * TABLE: Fil_LOI
 * ========================================== */
CREATE TABLE "Fil_LOI"(
 "loi_Name_Link" CHAR(8),
 "loi_Name_Link_Alias" CHAR(8),
 "loi_File_Number" CHAR(10),
 "loi_System_Date" DATE,
 "loi_NameID" CHAR(8),
 "loi_NameID_Alias" CHAR(8),
 "loi_Type" CHAR(20),
 "loi_DOB" DATE,
 "loi_SSN" CHAR(9),
 "loi_NYSID" CHAR(15),
 "loi_MARKER" CHAR(1),
 "loi_Notes" LONGVARCHAR
);
CREATE UNIQUE INDEX "idx_Loi_Unique" ON "Fil_LOI"("loi_Name_Link", "loi_File_Number", "loi_NameID", "loi_Type");
CREATE INDEX "idx_loi_DOB" ON "Fil_LOI"("loi_DOB");
CREATE INDEX "idx_loi_File_Number" ON "Fil_LOI"("loi_File_Number");
CREATE INDEX "idx_loi_Lnk_Alias" ON "Fil_LOI"("loi_Name_Link_Alias", "loi_System_Date" DESC);
CREATE INDEX "idx_loi_NYSID" ON "Fil_LOI"("loi_NYSID");
CREATE INDEX "idx_loi_NameID" ON "Fil_LOI"("loi_NameID");
CREATE INDEX "idx_loi_SSN" ON "Fil_LOI"("loi_SSN");
CREATE INDEX "idx_loi_Type" ON "Fil_LOI"("loi_Type");
CREATE INDEX "idx_loi_nam_Alias" ON "Fil_LOI"("loi_NameID_Alias", "loi_System_Date" DESC);
CREATE INDEX "idx_loi_nam_DOB" ON "Fil_LOI"("loi_NameID", "loi_DOB");
CREATE INDEX "idx_loi_name_link" ON "Fil_LOI"("loi_Name_Link");
CREATE INDEX "idx_loi_sys_Date" ON "Fil_LOI"("loi_System_Date" DESC);


/* ==========================================
 * TABLE: Fil_MemoMain
 * ========================================== */
CREATE TABLE "Fil_MemoMain"(
 "mem_File_Number" CHAR(10),
 "mem_Number" USMALLINT,
 "mem_AttorneyID" CHAR(8),
 "mem_Date" DATE,
 "mem_Event_Date" CHAR(8),
 "mem_Reference" LONGVARCHAR
);
CREATE INDEX "idx_mem_Event_date" ON "Fil_MemoMain"("mem_File_Number", "mem_Event_Date" DESC, "mem_Number" DESC);
CREATE INDEX "mem_Attorney" ON "Fil_MemoMain"("mem_AttorneyID");
CREATE INDEX "mem_Date_1" ON "Fil_MemoMain"("mem_Date");
CREATE UNIQUE INDEX "mem_File_Grp_desc" ON "Fil_MemoMain"("mem_File_Number", "mem_Number" DESC, "mem_AttorneyID", "mem_Date");
CREATE INDEX "mem_File_date_Desc" ON "Fil_MemoMain"("mem_File_Number", "mem_Date" DESC, "mem_Number" DESC);


/* ==========================================
 * TABLE: Fil_MemoPages2
 * ========================================== */
CREATE TABLE "Fil_MemoPages2"(
 "mpgs_File_Number" CHAR(10),
 "mpgs_Date" INTEGER,
 "mpgs_AttorneyID" CHAR(8),
 "mpgs_MemoID" SMALLINT,
 "mpgs_Page_Number" SMALLINT,
 "mpgs_Notes" LONGVARCHAR
);
CREATE INDEX "mpgs_Attorney" ON "Fil_MemoPages2"("mpgs_AttorneyID");
CREATE INDEX "mpgs_Date_1" ON "Fil_MemoPages2"("mpgs_Date");
CREATE UNIQUE INDEX "mpgs_File_No_Asc" ON "Fil_MemoPages2"("mpgs_File_Number", "mpgs_Date", "mpgs_MemoID", "mpgs_Page_Number");
CREATE UNIQUE INDEX "mpgs_File_No_Desc" ON "Fil_MemoPages2"("mpgs_File_Number", "mpgs_Date" DESC, "mpgs_MemoID" DESC, "mpgs_Page_Number" DESC);


/* ==========================================
 * TABLE: Fil_Names
 * ========================================== */
CREATE TABLE "Fil_Names"(
 "nam_NameID" CHAR(8),
 "nam_Alias_Link" CHAR(8),
 "nam_Moris_Number" CHAR(6),
 "nam_NYSID" CHAR(15),
 "nam_SSN" CHAR(9),
 "nam_Alien_Number" CHAR(20),
 "nam_FBI_Number" CHAR(10),
 "nam_Last_Name" CHAR(25),
 "nam_SoundX" CHAR(10),
 "nam_First_Name" CHAR(20),
 "nam_Middle_Name" CHAR(10),
 "nam_DOB" DATE,
 "nam_Interpreter" CHAR(10),
 "nam_Country_born" CHAR(30),
 "nam_Race" CHAR(1),
 "nam_Gender" CHAR(1),
 "nam_Ethnicity" CHAR(1),
 "nam_Marital_Status" CHAR(15),
 "nam_Household_Size" SMALLINT,
 "nam_School" CHAR(1),
 "nam_Last_Grade" CHAR(3),
 "nam_Citizenship" CHAR(1),
 "nam_Green_Card" CHAR(1),
 "nam_Imm_Stat" CHAR(50),
 "nam_imm_Date_GC" CHAR(25),
 "nam_imm_Eff_Dt_Stat" CHAR(50),
 "nam_imm_Entry_Date" CHAR(50),
 "nam_imm_Entry_Stat" CHAR(35),
 "nam_imm_ICE_Detainer" CHAR(1),
 "nam_imm_Pre_Deported" CHAR(1),
 "nam_Status_Source" CHAR(35),
 "nam_When_Status" SMALLINT,
 "nam_Military_Service" CHAR(3),
 "nam_mil_Rank" CHAR(25),
 "nam_mil_Branch" CHAR(20),
 "nam_mil_Svc_Dates" CHAR(20),
 "nam_mil_Dischg_Type" CHAR(25),
 "nam_mil_Decor_Combat" CHAR(200),
 "nam_In_area_since" CHAR(50),
 "nam_pre_24" CHAR(1),
 "nam_Type_of_Name" CHAR(1),
 "nam_Outst_Warr" CHAR(10),
 "nam_x_Date1" DATE,
 "nam_x_Date2" DATE,
 "nam_x_Date3" DATE,
 "name_x_Number1" DOUBLE,
 "name_x_Number2" DOUBLE,
 "name_x_Number3" DOUBLE,
 "name_x_Alpha1" CHAR(50),
 "name_x_Alpha2" CHAR(50),
 "name_x_Alpha3" CHAR(50)
);
CREATE INDEX "idx_nam_Alias_Link" ON "Fil_Names"("nam_Alias_Link");
CREATE INDEX "idx_nam_DOB" ON "Fil_Names"("nam_DOB", "nam_Type_of_Name");
CREATE INDEX "idx_nam_Interpreter" ON "Fil_Names"("nam_Interpreter");
CREATE INDEX "idx_nam_LastName" ON "Fil_Names"("nam_Last_Name", "nam_First_Name", "nam_Middle_Name", "nam_NameID");
CREATE INDEX "idx_nam_Moris" ON "Fil_Names"("nam_Moris_Number");
CREATE INDEX "idx_nam_NYSID" ON "Fil_Names"("nam_NYSID", "nam_Type_of_Name");
CREATE UNIQUE INDEX "idx_nam_Name_ID" ON "Fil_Names"("nam_NameID");
CREATE INDEX "idx_nam_Race" ON "Fil_Names"("nam_Race");
CREATE INDEX "idx_nam_SOUNDX" ON "Fil_Names"("nam_SoundX", "nam_First_Name", "nam_Middle_Name");
CREATE INDEX "idx_nam_SSN" ON "Fil_Names"("nam_SSN", "nam_Type_of_Name");
CREATE INDEX "idx_nam_Sex" ON "Fil_Names"("nam_Gender");
CREATE INDEX "idx_nam_Type_of_Name" ON "Fil_Names"("nam_Last_Name", "nam_First_Name", "nam_Type_of_Name");


/* ==========================================
 * TABLE: Fil_Results
 * ========================================== */
CREATE TABLE "Fil_Results"(
 "res_File_Number" CHAR(10),
 "res_USerID" CHAR(8),
 "res_Code" CHAR(25),
 "res_Date" DATE,
 "res_Court" CHAR(4),
 "res_Purpose" CHAR(4),
 "res_End_Date" DATE,
 "res_Detail" CHAR(50),
 "res_x_alpha1" CHAR(8),
 "res_x_alpha2" CHAR(8),
 "res_x_date1" DATE,
 "res_x_date2" DATE,
 "res_Unassigned" BIT,
 "res_x_logical2" BIT
);
CREATE INDEX "File_Number_Team" ON "Fil_Results"("res_File_Number", "res_USerID" DESC);
CREATE INDEX "idx_FileNo_Detail" ON "Fil_Results"("res_File_Number", "res_Detail");
CREATE INDEX "idx_FileNo_Purpose" ON "Fil_Results"("res_File_Number", "res_Purpose");
CREATE INDEX "idx_res_Code" ON "Fil_Results"("res_Code", "res_Date");
CREATE INDEX "idx_res_Date" ON "Fil_Results"("res_Date", "res_Court", "res_Purpose");
CREATE UNIQUE INDEX "idx_res_File_Number" ON "Fil_Results"("res_File_Number", "res_Date" DESC, "res_USerID", "res_Code", "res_Court", "res_Purpose", "res_Detail");
CREATE INDEX "idx_res_UserID" ON "Fil_Results"("res_USerID");


/* ==========================================
 * TABLE: Fil_Sent2
 * ========================================== */
CREATE TABLE "Fil_Sent2"(
 "snt_File_Number" CHAR(10),
 "snt_Order" SMALLINT,
 "snt_TopChg" BIT,
 "snt_Chg_Number" CHAR(10),
 "snt_Chg_Descr" CHAR(22),
 "snt_Chg_Type" CHAR(4),
 "snt_UCR" CHAR(3),
 "snt_Date" DATE,
 "snt_Type" CHAR(10),
 "snt_Length" CHAR(15),
 "snt_Condition" CHAR(10),
 "snt_Notes" CHAR(200)
);
CREATE INDEX "idx_UCR" ON "Fil_Sent2"("snt_Date", "snt_UCR", "snt_Type", "snt_TopChg");
CREATE INDEX "idx_snt_ChgDate" ON "Fil_Sent2"("snt_Date", "snt_Chg_Descr", "snt_TopChg" DESC);
CREATE INDEX "idx_snt_Chg_Dscr" ON "Fil_Sent2"("snt_Chg_Descr", "snt_TopChg" DESC);
CREATE INDEX "idx_snt_Chg_Num" ON "Fil_Sent2"("snt_Chg_Number", "snt_TopChg" DESC);
CREATE INDEX "idx_snt_Chg_Type" ON "Fil_Sent2"("snt_Chg_Type", "snt_TopChg" DESC);
CREATE INDEX "idx_snt_ClassDate" ON "Fil_Sent2"("snt_Date", "snt_Chg_Type", "snt_TopChg" DESC);
CREATE INDEX "idx_snt_Date" ON "Fil_Sent2"("snt_Date" DESC, "snt_TopChg" DESC);
CREATE UNIQUE INDEX "idx_snt_File" ON "Fil_Sent2"("snt_File_Number", "snt_TopChg" DESC, "snt_Order", "snt_Date", "snt_Chg_Number");
CREATE UNIQUE INDEX "idx_snt_Latest" ON "Fil_Sent2"("snt_File_Number", "snt_Order" DESC);
CREATE INDEX "idx_snt_NumDate" ON "Fil_Sent2"("snt_Date", "snt_Chg_Number", "snt_TopChg" DESC);
CREATE INDEX "idx_snt_TC" ON "Fil_Sent2"("snt_TopChg");
CREATE INDEX "idx_snt_Type" ON "Fil_Sent2"("snt_Type", "snt_TopChg" DESC);
CREATE INDEX "idx_snt_TypeDate" ON "Fil_Sent2"("snt_Date", "snt_Type", "snt_TopChg" DESC);
CREATE INDEX "idx_snt_Type_F" ON "Fil_Sent2"("snt_File_Number", "snt_TopChg" DESC, "snt_Type");


/* ==========================================
 * TABLE: Fil_SuppCharge
 * ========================================== */
CREATE TABLE "Fil_SuppCharge"(
 "sch_File_Number" CHAR(10),
 "sch_OpenDate" DATE,
 "sch_ChgNo" CHAR(10),
 "sch_Description" CHAR(25),
 "sch_class_level" CHAR(4),
 "sch_Atty" CHAR(8),
 "sch_CT" CHAR(4),
 "sch_Judge" CHAR(20),
 "sch_ClosedDate" DATE,
 "sch_ChargeResult" CHAR(25),
 "sch_Notes" LONGVARCHAR
);
CREATE INDEX "ClosedDateFileNo" ON "Fil_SuppCharge"("sch_ClosedDate", "sch_OpenDate", "sch_File_Number", "sch_Description");
CREATE INDEX "FileNo_ClosedDate" ON "Fil_SuppCharge"("sch_File_Number", "sch_ClosedDate", "sch_Description");
CREATE UNIQUE INDEX "FileNo_OpenDate" ON "Fil_SuppCharge"("sch_File_Number", "sch_OpenDate", "sch_Description");
CREATE INDEX "OpenChrgType" ON "Fil_SuppCharge"("sch_OpenDate", "sch_class_level");
CREATE INDEX "OpenDate_FileNo" ON "Fil_SuppCharge"("sch_OpenDate", "sch_ClosedDate", "sch_File_Number", "sch_Description");


/* ==========================================
 * TABLE: Lst_Courts_New
 * ========================================== */
CREATE TABLE "Lst_Courts_New"(
 "ct_Code" CHAR(4),
 "ct_Description" CHAR(45),
 "ct_Street" CHAR(45),
 "ct_City" CHAR(20),
 "ct_State" CHAR(15),
 "ct_Zipcode" CHAR(5),
 "ct_Phone_Num" CHAR(10),
 "ct_Time" TIME,
 "ct_Group" CHAR(1),
 "ct_SubGroup" CHAR(1),
 "ct_Logical" BIT,
 "ct_Alpha1" CHAR(20),
 "ct_Num1" DOUBLE
);
CREATE UNIQUE INDEX "idx_ct_Code" ON "Lst_Courts_New"("ct_Code");
CREATE INDEX "idx_ct_Group" ON "Lst_Courts_New"("ct_Group", "ct_SubGroup", "ct_Code");
CREATE INDEX "idx_ct_SubGroup" ON "Lst_Courts_New"("ct_SubGroup", "ct_Group", "ct_Code");


/* ==========================================
 * TABLE: Lst_Regions_New
 * ========================================== */
CREATE TABLE "Lst_Regions_New"(
 "rg_Code" CHAR(1),
 "rg_Name" CHAR(30),
 "rg_Logical" BIT,
 "rg_Spare" CHAR(10)
);
CREATE UNIQUE INDEX "reg_Code" ON "Lst_Regions_New"("rg_Code");
CREATE INDEX "reg_Logical" ON "Lst_Regions_New"("rg_Logical");


