#CREATE DATA TABLE FOR CVAR DATA

#Purpose: This table provides the information about reports and patients.

CREATE TABLE Reports (
	REPORT_ID 						INT			NOT NULL,
	REPORT_NO						VARCHAR(9)		NOT NULL,
	VERSION_NO 						INT(3)		NOT NULL,
	DATRECEIVED 					DATE 			NULL,
	DATINTRECEIVED					DATE 			NULL,
	MAH_NO 							VARCHAR(20)	NULL,
	REPORT_TYPE_CODE 				VARCHAR(9)		NULL,
	REPORT_TYPE_ENG 				VARCHAR(60)	NULL,
	GENDER_CODE 					VARCHAR(9)		NULL,
	GENDER_ENG 						VARCHAR(60)	NULL,
	AGE 							FLOAT(6,3)		NULL,
	AGE_Y							FLOAT(6,3)		NULL,
	AGE_UNIT_ENG 					VARCHAR(60)	NULL,
	OUTCOME_CODE					VARCHAR(9)		NULL,
	OUTCOME_ENG 					VARCHAR(60)	NULL,
	WEIGHT 							FLOAT(7,3)		NULL,
	WEIGHT_UNIT_ENG					VARCHAR(60)	NULL,
	HEIGHT 							FLOAT(7,3)		NULL,
	HEIGHT_UNIT_ENG					VARCHAR(60)	NULL,
	SERIOUSNESS_CODE				VARCHAR(9)		NULL,
	SERIOUSNESS_ENG					VARCHAR(60)	NULL,
	DEATH							VARCHAR(9)		NULL,
	DISABILITY						VARCHAR(9)		NULL,
	CONGENITAL_ANOMAY				VARCHAR(9)		NULL,
	LIFE_THREATENING				VARCHAR(9)		NULL,
	HOSP_REQUIRED					VARCHAR(9)		NULL,
	OTHER_MEDICALLY_IMP_COND		VARCHAR(9)		NULL,
	REPORTER_TYPE_ENG				VARCHAR(9)		NULL,
	SOURCE_CODE						VARCHAR(60)	NULL,
	SOURCE_ENG						VARCHAR(60)	NULL
);


#Purpose: This table provides the information about all drug names and their codes.

CREATE TABLE Drug_Product (
	DRUG_PRODUCT_ID		INT(8)		NOT NULL,
	DRUGNAME			VARCHAR(100)	NULL
);

#Purpose: This table provides the information about the active ingredients associated with all drugs.

CREATE TABLE Drug_Product_Ingredients (
	DRUG_PRODUCT_INGREDIENT_ID	INT(15)		NOT NULL,
	DRUG_PRODUCT_ID 			INT(8)		NULL,
	DRUGNAME					VARCHAR(100)	NULL,
	ACTIVE_INGREDIENT_ID		INT(8)		NULL,
	ACTIVE_INGREDIENT_NAME		VARCHAR(120)	NULL
);

#Purpose: This table provides the information about the reaction terms associated with report.

CREATE TABLE Reactions (
	REACTION_ID			INT			NOT NULL,
	REPORT_ID			INT			NULL,
	DURATION 			FLOAT(9,3)		NULL,
	DURATION_UNIT_ENG	VARCHAR(60)	NULL,
	PT_NAME_ENG			VARCHAR(250)	NULL,
	SOC_NAME_ENG		VARCHAR(250)	NULL,
	MEDDRA_VERSION		VARCHAR(9)		NULL
);


#Purpose: This table provides the information about the outcome presentation text associated with the outcome code.

CREATE TABLE Outcome_LX (
	OUTCOME_LX_ID	INT(4)		NOT NULL,
	OUTCOME_CODE	VARCHAR(3)		NULL,
	OUTCOME_EN 		VARCHAR(60)	NULL
);

#Purpose: This table provides the information about the gender presentation text associated with the gender code.

CREATE TABLE Gender_LX (
	GENDER_LX_ID	INT(7)		NOT NULL,
	GENDER_CODE		VARCHAR(9)		NULL,
	GENDER_EN		VARCHAR(60)	NULL
);

#Purpose: This table provides the information about the report type presentation text associated with the report type code.

CREATE TABLE Report_Type_LX (
	REPORT_TYPE_LX_ID	INT(7)		NOT NULL,
	REPORT_TYPE_CODE	VARCHAR(9)		NULL,
	REPORT_TYPE_EN		VARCHAR(60)	NULL
);

#Purpose: This table provides the information about the report seriousness presentation text associated with the report seriousness code.

CREATE TABLE Seriousness_LX (
	SERIOUSNESS_LX_ID	INT(7)		NOT NULL,
	SERIOUSNESS_CODE	VARCHAR(9)		NULL,
	SERIOUSNESS_EN		VARCHAR(60)	NULL
);

#Purpose: This table provides the information about the report source presentation text associated with the report source code.

CREATE TABLE Source_LX (
	SOURCE_LX_ID	INT(7)		NOT NULL,
	SOURCE_CODE		VARCHAR(9)	NULL,
	SOURCE_EN		VARCHAR(60)	NULL
);

#Purpose: This table provides the information about the linked/duplicate reports presentation text associated with the code.

CREATE TABLE Report_Links_LX (
	REPORT_LINK_ID		INT			NOT NULL,
	REPORT_ID			INT			NOT NULL,
	RECORD_TYPE_ENG		VARCHAR(9)		NULL,
	REPORT_LINK_NO		VARCHAR(18)	NULL
);

#Purpose: This table provides the information about drugs associated with specific reports.

CREATE TABLE Report_Drug (
	REPORT_DRUG_ID				INT(15) 		NOT NULL,
	REPORT_ID					INT(15)		NULL,
	DRUG_PRODUCT_ID				INT(8)		NULL,
	DRUGNAME					VARCHAR(100)	NULL,
	DRUGINVOLV_ENG				VARCHAR(60)	NULL,
	ROUTEADMIN_ENG				VARCHAR(60)	NULL,
	UNIT_DOSE_QTY				FLOAT(20,9)	NULL,
	DOSE_UNIT_ENG				VARCHAR(60)	NULL,
	FREQUENCY					INT(3)		NULL,
	FREQ_TIME					FLOAT(10,5)	NULL,
	FREQUENCY_TIME_ENG			VARCHAR(30)	NULL,
	FREQ_TIME_UNIT_ENG			VARCHAR(60)	NULL,
	THERAPY_DURATION			FLOAT(10,5)	NULL,
	THERAPY_DURATION_UNIT_ENG	VARCHAR(60)	NULL,
	DOSAGEFORM_ENG				VARCHAR(60)	NULL
);

#Purpose: This table provides the information about indications associated with specific reports.

CREATE TABLE Report_Drug_Indication (
	REPORT_DRUG_ID			INT(15)		NOT NULL,
	REPORT_ID				INT(15)		NULL,
	DRUG_PRODUCT_ID			INT(8)		NULL,
	DRUGNAME				VARCHAR(100)	NULL,
	INDICATION_NAME_ENG		VARCHAR(250)	NULL
);


