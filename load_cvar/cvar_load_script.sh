#!/bin/sh
# Extract relevant information from raw CVAR files
# CVAR data (1965 to 2017-03031)
# Oct 5th, 2017 Author: Vivekanand Sharma

sleep 2
# Download required files
wget https://www.canada.ca/content/dam/hc-sc/migration/hc-sc/dhp-mps/alt_formats/zip/medeff/databasdon/extract_extrait.zip
unzip extract_extrait.zip
mkdir ./load_files

# Extract relevant fields
cut -f1,2,3,4,5,6,7,8,10,11,13,14,15,17,18,20,21,23,24,26,27,29,30,31,32,33,34,35,37,38 -d\$ ./cvponline_extract_20170331/reports.txt > ./load_files/reports_sub.txt
cut -f1,2 -d\$ ./cvponline_extract_20170331/drug_products.txt > ./load_files/drug_products_sub.txt
cut -f1,2,3,4,5 -d\$ ./cvponline_extract_20170331/drug_product_ingredients.txt > ./load_files/drug_product_ingredients_sub.txt
cut -f1,2,3,4,6,8,10 -d\$ ./cvponline_extract_20170331/reactions.txt > ./load_files/reactions_sub.txt
cut -f1,2,3 -d\$ ./cvponline_extract_20170331/outcome_lx.txt > ./load_files/outcome_lx_sub.txt
cut -f1,2,3 -d\$ ./cvponline_extract_20170331/gender_lx.txt > ./load_files/gender_lx_sub.txt
cut -f1,2,3 -d\$ ./cvponline_extract_20170331/report_type_lx.txt > ./load_files/report_type_lx_sub.txt
cut -f1,2,3 -d\$ ./cvponline_extract_20170331/seriousness_lx.txt > ./load_files/seriousness_lx_sub.txt
cut -f1,2,3 -d\$ ./cvponline_extract_20170331/source_lx.txt > ./load_files/source_lx_sub.txt
cut -f1,2,3,5 -d\$ ./cvponline_extract_20170331/report_links.txt > ./load_files/report_links_sub.txt
cut -f1,2,3,4,5,7,9,10,12,13,14,16,18,19,21 -d\$ ./cvponline_extract_20170331/report_drug.txt > ./load_files/report_drug_sub.txt
cut -f1,2,3,4,5 -d\$ ./cvponline_extract_20170331/report_drug_indication.txt > ./load_files/report_drug_indication_sub.txt

rm extract_extrait.zip

sleep 2
# Create mysql tables
mysql --local-infile=1 -u root cvar < data_tables.sql

sleep 2
# Load data files to mysql
mysql --local-infile=1 -u root cvar < load_script.sql
