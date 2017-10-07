# Parse required fields from REAC files
# 22 Feb, 2017

# Fields to capture:
# isr, primaryid, caseid, year, qtr, pt, drug_rec_act

# process drug files from 2004Q1 to 2012Q3
function first_change(infile, ofile, yr, qtr)
  reacFile = open("$infile")
  for ln in eachline(reacFile)
    ln = chomp(ln)
    if !(ismatch(r"ISR", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 2
        isr       = strip(split(ln, "\$")[1])
        primaryid = ""
        caseid    = ""
        year      = "20$yr"
        qtr       = qtr
        pt        = strip(split(ln, "\$")[2])
        drug_rec_act = ""
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$pt\$$drug_rec_act\n")
      end
    end
  end
end


# process drug files from 2012Q4 to 2014Q2
function second_change(infile, ofile, yr, qtr)
  reacFile = open("$infile")
  for ln in eachline(reacFile)
    ln = chomp(ln)
    if !(ismatch(r"primary[a-z]+", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 3
        isr       = ""
        primaryid = strip(split(ln, "\$")[1])
        caseid    = strip(split(ln, "\$")[2])
        year      = "20$yr"
        qtr       = qtr
        pt        = strip(split(ln, "\$")[3])
        drug_rec_act = ""
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$pt\$$drug_rec_act\n")
      end
    end
  end
end

# process drug files from 2014Q3 onwards
function third_change(infile, ofile, yr, qtr)
  reacFile = open("$infile")
  for ln in eachline(reacFile)
    ln = chomp(ln)
    if !(ismatch(r"primary[a-z]+", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 4
        isr       = ""
        primaryid = strip(split(ln, "\$")[1])
        caseid    = strip(split(ln, "\$")[2])
        year      = "20$yr"
        qtr       = qtr
        pt        = strip(split(ln, "\$")[3])
        drug_rec_act = strip(split(ln, "\$")[4])
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$pt\$$drug_rec_act\n")
      end
    end
  end
end



dir = ARGS[1]

oFile = open("./final_data/REAC_FILE.txt","w")
write(oFile, "isr\$primaryid\$caseid\$year\$qtr\$pt\$drug_rec_act\n")

for file in readdir(dir)
  if ismatch(r"(?i)REAC[0-9]{2}Q[0-9]\.TXT", file)
    m = match(r"(?i)REAC([0-9]{2})Q([0-9])\.TXT", file)
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
