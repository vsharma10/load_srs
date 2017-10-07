# Parse required fields from THER files
# 22 Feb, 2017

# Fields to capture:
# isr, primaryid, caseid, year, qtr, drug_seq, start_dt, end_dt, dur, dur_cod

# process drug files from 2004Q1 to 2012Q3
function first_change(infile, ofile, yr, qtr)
  therFile = open("$infile")
  for ln in eachline(therFile)
    ln = chomp(ln)
    if !(ismatch(r"ISR", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 6
        isr       = strip(split(ln, "\$")[1])
        primaryid = ""
        caseid    = ""
        year      = "20$yr"
        qtr       = qtr
        drug_seq  = strip(split(ln, "\$")[2])
        start_dt  = strip(split(ln, "\$")[3])
        end_dt    = strip(split(ln, "\$")[4])
        dur       = strip(split(ln, "\$")[5])
        dur_cod   = strip(split(ln, "\$")[6])
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$drug_seq\$$start_dt\$$end_dt\$$dur\$$dur_cod\n")
      end
    end
  end
end


# process drug files from 2012Q4 onwards
function second_change(infile, ofile, yr, qtr)
  rpsrFile = open("$infile")
  for ln in eachline(rpsrFile)
    ln = chomp(ln)
    if !(ismatch(r"primary[a-z]+", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 7
        isr       = ""
        primaryid = strip(split(ln, "\$")[1])
        caseid    = strip(split(ln, "\$")[2])
        year      = "20$yr"
        qtr       = qtr
        drug_seq  = strip(split(ln, "\$")[3])
        start_dt  = strip(split(ln, "\$")[4])
        end_dt    = strip(split(ln, "\$")[5])
        dur       = strip(split(ln, "\$")[6])
        dur_cod   = strip(split(ln, "\$")[7])
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$drug_seq\$$start_dt\$$end_dt\$$dur\$$dur_cod\n")
      end
    end
  end
end


dir = ARGS[1]

oFile = open("./final_data/THER_FILE.txt","w")
write(oFile, "isr\$primaryid\$caseid\$year\$qtr\$drug_seq\$start_dt\$end_dt\$dur\$dur_cod\n")

for file in readdir(dir)
  if ismatch(r"(?i)THER[0-9]{2}Q[0-9]\.TXT", file)
    m = match(r"(?i)THER([0-9]{2})Q([0-9])\.TXT", file)
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
    else
      println("Processing: $file")
      infile = "$dir$file"
      second_change(infile, oFile, year, qtr)
      #println("\$\$\$\$")
    end
  end
end

close(oFile)
