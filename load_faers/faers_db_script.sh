#!/bin/sh
# this script downloads all the ASCII format FAERS files from the FDA website
# as of Oct 5th 2017 and processes it to extract relevant fields to create a
# final file that could be loaded to mysql

# Download Legacy Files 2004Q1 to 2012Q3
./download_legacy_files_from_faers.sh

# Download Current Files 2012Q4 to 2016Q4
./download_current_files_from_faers.sh

sleep 2
# Create directory for saving final output files
mkdir ./final_data

# Process DRUGyyQq.TXT Files
echo "PROCESSING DRUG TABLE"
julia parse_drug.jl ./ascii/

sleep 2
# Process DEMOyyQq.TXT File
echo "PROCESSING DEMO TABLE"
julia parse_demo.jl ./ascii/

sleep 2
# Process INDIyyQq.TXT File
echo "PROCESSING INDI TABLE"
julia parse_indi.jl ./ascii/

sleep 2
# Process OUTCyyQq.TXT File
echo "PROCESSING OUTC TABLE"
julia parse_outc.jl ./ascii/

sleep 2
# Process REACyyQq.TXT File
echo "PROCESSING REAC TABLE"
julia parse_reac.jl ./ascii/

#sleep 2
# Process RSPRyyQq.TXT File
echo "PROCESSING RPSR TABLE"
julia parse_rpsr.jl ./ascii/

sleep 2
# Process THERyyQq.TXT File
echo "PROCESSING THER TABLE"
julia parse_ther.jl ./ascii/

# Change to data file directory
#cd final_data

sleep 2
# Load data to mysql
echo "LOADING DATA TO MySQL"
mysql --local-infile=1 -u root faers < create_load_faers_data.sql
