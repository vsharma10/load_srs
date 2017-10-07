###################################
# Create DEMO table and load data #
###################################

drop table demo;
create table demo
	(
		isr               varchar(7)    NULL,
		primaryid         varchar(10)   NULL,
		caseid            varchar(8)    NULL,
		year              int(4)        NULL,
		qtr               int(1)        NULL,
		casever           varchar(10)   NULL,
		i_f_cod           varchar(1)    NULL,
		foll_seq          varchar(2)    NULL,
		event_dt          date          NULL,
		mfr_dt            date          NULL,
		fda_dt            date          NULL,
		rept_cod          varchar(3)    NULL,
		mfr_num           varchar(90)   NULL,
		mfr_sndr          varchar(60)   NULL,
		age               decimal(10,5) NULL,
		age_cod           varchar(3)    NULL,
		sex               varchar(3)    NULL,
		e_sub             varchar(1)    NULL,
		wt                decimal(9,3)  NULL,
		wt_cod            varchar(5)    NULL,
		rept_dt           date          NULL,
		occp_cod          varchar(8)    NULL,
		reporter_country  varchar(48)   NULL,
		occr_country      varchar(2)    NULL
	);

load data local infile './final_data/DEMO_FILE.txt' into table demo fields terminated by "\$" lines terminated by "\n" ignore 1 lines;

create index idx_demo_isr              on demo(isr);
create index idx_demo_primaryid        on demo(primaryid);
create index idx_demo_caseid           on demo(caseid);
create index idx_demo_year             on demo(year);
create index idx_demo_qtr              on demo(qtr);
create index idx_demo_age              on demo(age);
create index idx_demo_age_cod          on demo(age_cod);
create index idx_demo_sex              on demo(sex);
create index idx_demo_wt               on demo(wt);
create index idx_demo_wt_cod           on demo(wt_cod);
create index idx_demo_reporter_country on demo(reporter_country);
create index idx_demo_occr_country     on demo(occr_country);

###################################
# Create DRUG table and load data #
###################################

drop table drug;
create table drug
	(
		isr       varchar(7)	NULL,
		primaryid varchar(10)	NULL,
		caseid    varchar(8)	NULL,
		year      int(4)		NULL,
		qtr       int(4)		NULL,
		drug_seq  varchar(10)	NULL,
		role_cod  varchar(2)	NULL,
		drugname  varchar(500)	NULL,
		prod_ai   varchar(300)	NULL,
		val_vbm   varchar(1)	NULL,
		route     varchar(37)	NULL,
		dose_vbm  varchar(288)	NULL,
		dechal    varchar(1)	NULL,
		rechal    varchar(2)	NULL,
		lot_num   varchar(363)	NULL,
		exp_dt    date			NULL,
		nda_num   varchar(27)	NULL
	);

load data local infile './final_data/DRUG_FILE.txt' into table drug fields terminated by "\$" lines terminated by "\n" ignore 1 lines;

create index idx_drug_isr       on drug(isr);
create index idx_drug_primaryid on drug(primaryid);
create index idx_drug_caseid    on drug(caseid);
create index idx_drug_year      on drug(year);
create index idx_drug_qtr       on drug(qtr);
create index idx_drug_drug_seq  on drug(drug_seq);
create index idx_drug_role_cod  on drug(role_cod);
create index idx_drug_drugname  on drug(drugname);
create index idx_drug_prod_ai   on drug(prod_ai);

###################################
# Create INDI table and load data #
###################################

drop table indi;
create table indi
	(
		isr       varchar(7)	NULL,
		primaryid varchar(10)	NULL,
		caseid    varchar(8)	NULL,
		year      int(4)		NULL,
		qtr       int(1)		NULL,
		drug_seq  varchar(10)	NULL,
		indi_pt   varchar(95)	NULL
	);

load data local infile './final_data/INDI_FILE.txt' into table indi fields terminated by "\$" lines terminated by "\n" ignore 1 lines;

create index idx_indi_isr       on indi(isr);
create index idx_indi_primaryid on indi(primaryid);
create index idx_indi_caseid    on indi(caseid);
create index idx_indi_year      on indi(year);
create index idx_indi_qtr       on indi(qtr);
create index idx_indi_drug_seq  on indi(drug_seq);
create index idx_indi_indi_pt   on indi(indi_pt);

###################################
# Create OUTC table and load data #
###################################

drop table outc;
create table outc
	(
		isr       varchar(7)	NULL,
		primaryid varchar(10)	NULL,
		caseid    varchar(8)	NULL,
		year      int(4)		NULL,
		qtr       int(1)		NULL,
		outc_cod  varchar(2)	NULL
	);

load data local infile './final_data/OUTC_FILE.txt' into table outc fields terminated by "\$" lines terminated by "\n" ignore 1 lines;

create index idx_outc_isr       on outc(isr);
create index idx_outc_primaryid on outc(primaryid);
create index idx_outc_caseid    on outc(caseid);
create index idx_outc_year      on outc(year);
create index idx_outc_qtr       on outc(qtr);
create index idx_outc_outc_cod  on outc(outc_cod);

###################################
# Create REAC table and load data #
###################################

drop table reac;
create table reac
	(
		isr          varchar(7)		NULL,
		primaryid    varchar(10)	NULL,
		caseid       varchar(8)		NULL,
		year         int(4)			NULL,
		qtr          int(1)			NULL,
		pt           varchar(90)	NULL,
		drug_rec_act varchar(65)	NULL
	);

load data local infile './final_data/REAC_FILE.txt' into table reac fields terminated by "\$" lines terminated by "\n" ignore 1 lines;

create index idx_reac_isr          on reac(isr);
create index idx_reac_primaryid    on reac(primaryid);
create index idx_reac_caseid       on reac(caseid);
create index idx_reac_year         on reac(year);
create index idx_reac_qtr          on reac(qtr);
create index idx_reac_pt           on reac(pt);
create index idx_reac_drug_rec_act on reac(drug_rec_act);

###################################
# Create RPSR table and load data #
###################################

drop table rpsr;
create table rpsr
	(
		isr       varchar(7)	NULL,
		primaryid varchar(10)	NULL,
		caseid    varchar(8)	NULL,
		year      int(4)		NULL,
		qtr       int(1)		NULL,
		rpsr_cod  varchar(3)	NULL
	);

load data local infile './final_data/RPSR_FILE.txt' into table rpsr fields terminated by "\$" lines terminated by "\n" ignore 1 lines;

create index idx_rpsr_isr      	on rpsr(isr);
create index idx_rpsr_primaryid	on rpsr(primaryid);
create index idx_rpsr_caseid   	on rpsr(caseid);
create index idx_rpsr_year     	on rpsr(year);
create index idx_rpsr_qtr      	on rpsr(qtr);
create index idx_rpsr_rpsr_cod 	on rpsr(rpsr_cod);

###################################
# Create THER table and load data #
###################################

drop table ther;
create table ther
	(
		isr       varchar(7)	NULL,
		primaryid varchar(10)	NULL,
		caseid    varchar(8)	NULL,
		year      int(4)		NULL,
		qtr       int(1)		NULL,
		drug_seq  varchar(10)	NULL,
		start_dt  date			NULL,
		end_dt    date			NULL,
		dur       varchar(10)	NULL,
		dur_cod   varchar(6)	NULL
	);

load data local infile './final_data/THER_FILE.txt' into table ther fields terminated by "\$" lines terminated by "\n" ignore 1 lines;

create index idx_ther_isr       on ther(isr);
create index idx_ther_primaryid on ther(primaryid);
create index idx_ther_caseid    on ther(caseid);
create index idx_ther_year      on ther(year);
create index idx_ther_qtr       on ther(qtr);
create index idx_ther_drug_seq  on ther(drug_seq);
