# Parse required fields from DRUG files
# 22 Feb, 2017

#year_array = ["04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16"]
#qtr_array  = ["1", "2", "3", "4"]

# Fields to capture:
# isr, primaryid, caseid, year, qtr, drug_seq, role_cod, drugname, prod_ai, val_vbm, route, dose_vbm, dechal,
# rechal, lot_num, exp_dt, nda_num

# process drug files from 2004Q1 to 2012Q3
function first_change(infile, ofile, yr, qtr)
  drugFile = open("$infile")
  for ln in eachline(drugFile)
    ln = chomp(ln)
    if !(ismatch(r"ISR", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 12
        isr       = strip(split(ln, "\$")[1])
        primaryid = ""
        caseid    = ""
        year      = "20$yr"
        qtr       = qtr
        drug_seq  = strip(split(ln, "\$")[2])
        role_cod  = strip(split(ln, "\$")[3])
        drugname  = strip(split(ln, "\$")[4])
        prod_ai   = ""
        val_vbm   = strip(split(ln, "\$")[5])
        route     = strip(split(ln, "\$")[6])
        dose_vbm  = strip(split(ln, "\$")[7])
        dechal    = strip(split(ln, "\$")[8])
        rechal    = strip(split(ln, "\$")[9])
        lot_num   = strip(split(ln, "\$")[10])
        exp_dt    = strip(split(ln, "\$")[11])
        nda_num   = strip(split(ln, "\$")[12])
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$drug_seq\$$role_cod\$$drugname\$$prod_ai\$$val_vbm\$$route\$$dose_vbm\$$dechal\$$rechal\$$lot_num\$$exp_dt\$$nda_num\n")
      end
    end
  end
end

# process drug files from 2012Q4 to 2014Q2
function second_change(infile, ofile, yr, qtr)
  drugFile = open("$infile")
  for ln in eachline(drugFile)
    ln = chomp(ln)
    if !(ismatch(r"primary[a-z]+", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 15
        isr       = ""
        primaryid = strip(split(ln, "\$")[1])
        caseid    = strip(split(ln, "\$")[2])
        year      = "20$yr"
        qtr       = qtr
        drug_seq  = strip(split(ln, "\$")[3])
        role_cod  = strip(split(ln, "\$")[4])
        drugname  = strip(split(ln, "\$")[5])
        prod_ai   = ""
        val_vbm   = strip(split(ln, "\$")[6])
        route     = strip(split(ln, "\$")[7])
        dose_vbm  = strip(split(ln, "\$")[8])
        dechal    = strip(split(ln, "\$")[11])
        rechal    = strip(split(ln, "\$")[12])
        lot_num   = strip(split(ln, "\$")[13])
        exp_dt    = strip(split(ln, "\$")[14])
        nda_num   = strip(split(ln, "\$")[15])
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$drug_seq\$$role_cod\$$drugname\$$prod_ai\$$val_vbm\$$route\$$dose_vbm\$$dechal\$$rechal\$$lot_num\$$exp_dt\$$nda_num\n")
      end
    end
  end
end

# process drug files from 2014Q3 onwards
function third_change(infile, ofile, yr, qtr)
  drugFile = open("$infile")
  for ln in eachline(drugFile)
    ln = chomp(ln)
    if !(ismatch(r"primary[a-z]+", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 16
        isr       = ""
        primaryid = strip(split(ln, "\$")[1])
        caseid    = strip(split(ln, "\$")[2])
        year      = "20$yr"
        qtr       = qtr
        drug_seq  = strip(split(ln, "\$")[3])
        role_cod  = strip(split(ln, "\$")[4])
        drugname  = strip(split(ln, "\$")[5])
        prod_ai   = strip(split(ln, "\$")[6])
        val_vbm   = strip(split(ln, "\$")[7])
        route     = strip(split(ln, "\$")[8])
        dose_vbm  = strip(split(ln, "\$")[9])
        dechal    = strip(split(ln, "\$")[12])
        rechal    = strip(split(ln, "\$")[13])
        lot_num   = strip(split(ln, "\$")[14])
        exp_dt    = strip(split(ln, "\$")[15])
        nda_num   = strip(split(ln, "\$")[16])
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$drug_seq\$$role_cod\$$drugname\$$prod_ai\$$val_vbm\$$route\$$dose_vbm\$$dechal\$$rechal\$$lot_num\$$exp_dt\$$nda_num\n")
      end
    end
  end
end


dir = ARGS[1]

oFile = open("./final_data/DRUG_FILE.txt","w")
# For year 2016 qtr 4
#oFile = open("DRUG_FILE_16q4.txt","w")
write(oFile, "isr\$primaryid\$caseid\$year\$qtr\$drug_seq\$role_cod\$drugname\$prod_ai\$val_vbm\$route\$dose_vbm\$dechal\$rechal\$lot_num\$exp_dt\$nda_num\n")

for file in readdir(dir)
  if ismatch(r"(?i)DRUG[0-9]{2}Q[0-9]\.TXT", file)
    m = match(r"(?i)DRUG([0-9]{2})Q([0-9])\.TXT", file)
    year = m.captures[1]
    qtr  = m.captures[2]
    #println(year)
    if parse(Int, year) < 12
      println("Processing: $file")
      infile = "$dir$file"
      first_change(infile, oFile, year, qtr)
      #println("\#\#\#\#")
    elseif parse(Int, year) == 12
      if parse(Int, qtr) <= 3
        println("Processing: $file")
        infile = "$dir$file"
        first_change(infile, oFile, year, qtr)
        #println("\#\#\#\#")
      else
        println("Processing: $file")
        infile = "$dir$file"
        second_change(infile, oFile, year, qtr)
        #println("\*\*\*\*")
      end
    elseif parse(Int, year) > 12 && parse(Int, year) < 14
      println("Processing: $file")
      infile = "$dir$file"
      second_change(infile, oFile, year, qtr)
      #println("\*\*\*\*")
    elseif parse(Int, year) == 14
      if parse(Int, qtr) <= 2
        println("Processing: $file")
        infile = "$dir$file"
        second_change(infile, oFile, year, qtr)
        #println("\*\*\*\*")
      else
        println("Processing: $file")
        infile = "$dir$file"
        third_change(infile, oFile, year, qtr)
        #println("\$\$\$\$")
      end
    else
      println("Processing: $file")
      infile = "$dir$file"
      third_change(infile, oFile, year, qtr)
      #println("\$\$\$\$")
    end
  end
end

close(oFile)
