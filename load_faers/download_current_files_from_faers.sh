#!/bin/sh
# this script downloads all the current ASCII format FAERS files from the FDA website
# as of Oct 5th 2017

# FAERS ASCII 2016 Q4
sleep 2
fileyearquarter=16q4
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM546946.zip
unzip UCM546946.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM546946.zip

# FAERS ASCII 2016 Q3
sleep 2
fileyearquarter=16q3
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/AdverseDrugEffects/UCM534900.zip
unzip UCM534900.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM534900.zip

# FAERS ASCII 2016 Q2
sleep 2
fileyearquarter=16q2
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM521951.zip
unzip UCM521951.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM521951.zip

# FAERS ASCII 2016 Q1
sleep 2
fileyearquarter=16q1
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM509489.zip
unzip UCM509489.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM509489.zip

# FAERS ASCII 2015 Q4
sleep 2
fileyearquarter=15q4
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/AdverseDrugEffects/UCM492340.zip
unzip UCM492340.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM492340.zip

# FAERS ASCII 2015 Q3
sleep 2
fileyearquarter=15q3
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM477190.zip
unzip UCM477190.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM477190.zip

# FAERS ASCII 2015 Q2
sleep 2
fileyearquarter=15q2
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM463272.zip
unzip UCM463272.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM463272.zip

# FAERS ASCII 2015 Q1
sleep 2
fileyearquarter=15q1
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM458083.zip
unzip UCM458083.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM458083.zip

# FAERS ASCII 2014 Q4
sleep 2
fileyearquarter=14q4
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM451489.zip
unzip UCM451489.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM451489.zip

# FAERS ASCII 2014 Q3
sleep 2
fileyearquarter=14q3
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM443579.zip
unzip UCM443579.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM443579.zip

# FAERS ASCII 2014 Q2
sleep 2
fileyearquarter=14q2
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM429323.zip
unzip UCM429323.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM429323.zip

# FAERS ASCII 2014 Q1
sleep 2
fileyearquarter=14q1
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM419914.zip
unzip UCM419914.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM419914.zip

# FAERS ASCII 2013 Q4
sleep 2
fileyearquarter=13q4
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM409890.zip
unzip UCM409890.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM409890.zip

# FAERS ASCII 2013 Q3
sleep 2
fileyearquarter=13q3
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM399592.zip
unzip UCM399592.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM399592.zip

# FAERS ASCII 2013 Q2
sleep 2
fileyearquarter=13q2
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/AdverseDrugEffects/UCM395994.zip
unzip UCM395994.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM395994.zip

# FAERS ASCII 2013 Q1
sleep 2
fileyearquarter=13q1
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/UCM387233.zip
unzip UCM387233.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv Readme.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM387233.zip

# FAERS ASCII 2012 Q4
sleep 2
fileyearquarter=12q4
wget https://www.fda.gov/downloads/Drugs/GuidanceComplianceRegulatoryInformation/Surveillance/AdverseDrugEffects/UCM364757.zip
unzip UCM364757.zip
mv FAQs.pdf "ascii/FAQs${fileyearquarter}.pdf"
mv FAQs.doc "ascii/FAQs${fileyearquarter}.doc"
mv Readme.pdf "ascii/Readme${fileyearquarter}.pdf"
mv README.doc "ascii/Readme${fileyearquarter}.doc"
mv ascii/ASC_NTS.pdf "ascii/ASC_NTS${fileyearquarter}.pdf"
mv ascii/ASC_NTS.doc "ascii/ASC_NTS${fileyearquarter}.doc"
rm UCM364757.zip

# cleanup from miscellaneous sub-directory names
mv ASCII/* ascii
mv asci/* ascii
mv asii/* ascii
rmdir ASCII
rmdir asci
rmdir asii
