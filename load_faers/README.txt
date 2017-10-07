##################################
#       FAERS DATA FILES         #
##################################

Step 1: create MySQL database- faers
Step 2: ./faers_db_script.sh


-FAERS and LAERS data was downloaded on 05 Oct, 2017.

-Covers data from 2002 quarter 1 to 2016 quarter 4.

-Download scripts:
	- download_current_files_from_faers.sh
	- download_legacy_files_from_faers.sh

- DATA files:

1. DEMOyyQq.TXT contains patient demographic and administrative information, a single record for each event report.

2. DRUGyyQq.TXT contains drug/biologic information for as many medications as were reported for the event (1 or more per event).

3. REACyyQq.TXT contains all "Medical Dictionary for Regulatory Activities" (MedDRA) terms coded for the adverse event (1 or more).

4. OUTCyyQq.TXT contains patient outcomes for the event (0 or more).

5. RPSRyyQq.TXT contains report sources for event (0 or more).

6. THERyyQq.TXT contains drug therapy start dates and end dates for the reported drugs (0 or more per drug per event).

7. INDIyyQq.TXT contains all "Medical Dictionary for Regulatory Activities" (MedDRA) terms coded for the indications for use (diagnoses) for the reported drugs (0 or more per drug per event).

- The data files for all years and quarters were parsed and merged into single files:
	- DEMO_FILE.txt (Script: parse_demo.jl)
	- DRUG_FILE.txt (Script: parse_drug.jl)
	- INDI_FILE.txt (Script: parse_indi.jl)
	- OUTC_FILE.txt (Script: parse_outc.jl)
	- REAC_FILE.txt (Script: parse_reac.jl)
	- RPSR_FILE.txt (Script: parse_rpsr.jl)
	- THER_FILE.txt (Script: parse_ther.jl)

- There were changes in the different data fields over the years and quarters.
	(e.g. ISR was the unique identifier upto 2012Q3, 2012Q4 onwards this was changed to PRIMARYID and CASEID)

- The different fields retained from the data files are described below:

###########
#  DEMO   #
###########

isr               = Number that uniquely identifies an AERS report
primaryid         = Number that uniquely identifies a FAERS report
caseid            = Number for identifying a FAERS case
year              = Year of the file record from which data was extracted
qtr               = Quarter of the file record from which data was extracted
casever           = Safety Report Version Number. The Initial Case will be version 1; follow-ups to the case will have sequentially incremented version   numbers (for example, 2, 3, 4, etc.)
i_f_cod           = Code for initial or follow-up status of report, as reported by manufacturer (I = Initial; F = Follow-up).
foll_seq          = The sequence number of a followup report
event_dt          = Date the adverse event occurred or began. (YYYYMMDD format)
mfr_dt            = Date manufacturer first received initial information
fda_dt            = Date FDA received Case
rept_cod          = Code for the type of report submitted (EXP = Expedited (15-Day); PER = Periodic (Non-Expedited); DIR = Direct)
mfr_num           = Manufacturer's unique report identifier
mfr_sndr          = Coded name of manufacturer sending report
age               = Numeric value of patient's age at event
age_cod           = Unit abbreviation for patient's age (DEC = DECADE; YR = YEAR; MON = MONTH; WK = WEEK; DY = DAY; HR = HOUR)
sex               = Code for patient's sex (UNK = Unknown; M = Male; F = Female; NS = Not Specified)
e_sub             = Whether (Y/N) this report was submitted under the electronic submissions procedure for manufacturers
wt                = Numeric value of patient's weight
wt_cod            = Unit abbreviation for patient's weight (KG = Kilograms; LBS = Pounds; GMS = Grams)
rept_dt           = Date report was sent (YYYYMMDD format)
occp_cod          = Abbreviation for the reporter's type of occupation in the latest version of a case (MD = Physician; PH = Pharmacist; OT = Other health-professional; LW = Lawyer; CN = Consumer).
reporter_country  = The country of the reporter in the latest version of a case
occr_country      = The country where the event occurred


###########
#  DRUG   #
###########

isr       = Number that uniquely identifies an AERS report
primaryid = Number that uniquely identifies a FAERS report
caseid    = Number for identifying a FAERS case
year      = Year of the file record from which data was extracted
qtr       = Quarter of the file record from which data was extracted
drug_seq  = Unique number for identifying a drug for a Case
role_cod  = Code for drug's reported role in event (PS = Primary Suspect Drug; SS = Secondary Suspect Drug; C  = Concomitant; I  = Interacting)
drugname  = Name of medicinal product. If a "Valid Trade Name" is populated for   this Case, then DRUGNAME = Valid Trade Name; if not, then DRUGNAME = "Verbatim" name, exactly as entered on the report.
prod_ai   = Product Active Ingredient, when available (New tag added in 2014Q3 extract)
val_vbm   = Code for source of DRUGNAME (1 = Validated trade name used; 2 = Verbatim name used)
route     = The route of drug administration
dose_vbm  = Verbatim text for dose, frequency, and route, exactly as entered on report
dechal    = Dechallenge code, indicating if reaction abated when drug therapy was stopped (Y = Positive dechallenge; N = Negative dechallenge; U = Unknown; D = Does not apply)
rechal    = Rechallenge code, indicating if reaction recurred when drug therapy was restarted (Y = Positive rechallenge; N = Negative rechallenge; U = Unknown; D = Does not apply)
lot_num   = Lot number of the drug (as reported)
exp_dt    = Expiration date of the drug. (YYYYMMDD format)
nda_num   = NDA number (numeric only)


###########
#  INDI   #
###########

isr       = Number that uniquely identifies an AERS report
primaryid = Number that uniquely identifies a FAERS report
caseid    = Number for identifying a FAERS case
year      = Year of the file record from which data was extracted
qtr       = Year of the file record from which data was extracted
drug_seq  = Unique number for identifying a drug for a Case
indi_pt   = "Preferred Term"-level medical terminology describing the Indication for use, using the Medical Dictionary for Regulatory Activities MedDRA)


###########
#  OUTC   #
###########

isr       = Number that uniquely identifies an AERS report
primaryid = Number that uniquely identifies a FAERS report
caseid    = Number for identifying a FAERS case
year      = Year of the file record from which data was extracted
qtr       = Year of the file record from which data was extracted
outc_cod  = Code for a patient outcome (DE = Death; LT = Life-Threatening; HO = Hospitalization - Initial or Prolonged; DS = Disability; CA = Congenital Anomaly; RI = Required Intervention to Prevent Permanent Impairment/Damage; OT = Other Serious (Important Medical Event))

###########
#  REAC   #
###########

isr          = Number that uniquely identifies an AERS report
primaryid    = Number that uniquely identifies a FAERS report
caseid       = Number for identifying a FAERS case
year         = Year of the file record from which data was extracted
qtr          = Year of the file record from which data was extracted
pt           = "Preferred Term"-level medical terminology describing the event, using the Medical Dictionary for Regulatory Activities (MedDRA)
drug_rec_act = Drug Recur Action data - populated with reaction/event information (PT) if/when the event reappears upon readministration of the drug (New tag added in 2014Q3 extract).

###########
#  RPSR   #
###########

isr       = Number that uniquely identifies an AERS report     
primaryid = Number that uniquely identifies a FAERS report
caseid    = Number for identifying a FAERS case  
year      = Year of the file record from which data was extracted    
qtr       = Year of the file record from which data was extracted     
rpsr_cod  = Code for the source of the report (FGN = Foreign; SDY = Study; LIT = Literature; CSM = Consumer; HP  = Health Professional; UF  = User Facility; CR  = Company Representative; DT  = Distributor; OTH = Other)


###########
#  THER   #
###########
isr       = Number that uniquely identifies an AERS report     
primaryid = Number that uniquely identifies a FAERS report
caseid    = Number for identifying a FAERS case  
year      = Year of the file record from which data was extracted    
qtr       = Year of the file record from which data was extracted     
drug_seq  = Unique number for identifying a drug for a Case 
start_dt  = Date the therapy was started (or re-started) for this drug (YYYYMMDD)
end_dt    = A date therapy was stopped for this drug. (YYYYMMDD)  
dur       = Numeric value of the duration (length) of therapy     
dur_cod   = Unit abbreviation for duration of therapy (YR  = Years; MON = Months; WK  = Weeks; DAY = Days; HR  = Hours; MIN = Minutes; SEC = Seconds) 
