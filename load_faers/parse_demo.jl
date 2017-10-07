# Parse required fields from DEMO files
# 22 Feb, 2017

# Fields to capture:
# isr, primaryid, caseid, year, qtr, case, i_f_cod, foll_seq,
# event_dt, mfr_dt, fda_dt, rept_cod, mfr_num, mfr_sndr, age, age_cod, sex,
# e_sub, wt, wt_cod, rept_dt, occp_cod, reporter_country, occr_country


# process drug files from 2004Q1 to 2005Q2
function first_change(infile, ofile, yr, qtr)
  demoFile = open("$infile")
  for ln in eachline(demoFile)
    ln = chomp(ln)
    if !(ismatch(r"ISR", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 19
        isr               = strip(split(ln, "\$")[1])
        primaryid         = ""
        caseid            = ""
        year              = "20$yr"
        qtr               = qtr
        case              = strip(split(ln, "\$")[2])
        i_f_cod           = strip(split(ln, "\$")[3])
        foll_seq          = strip(split(ln, "\$")[4])
        event_dt          = strip(split(ln, "\$")[6])
        mfr_dt            = strip(split(ln, "\$")[7])
        fda_dt            = strip(split(ln, "\$")[8])
        rept_cod          = strip(split(ln, "\$")[9])
        mfr_num           = strip(split(ln, "\$")[10])
        mfr_sndr          = strip(split(ln, "\$")[11])
        age               = strip(split(ln, "\$")[12])
        age_cod           = strip(split(ln, "\$")[13])
        sex               = strip(split(ln, "\$")[14])
        e_sub             = strip(split(ln, "\$")[15])
        wt                = strip(split(ln, "\$")[16])
        wt_cod            = strip(split(ln, "\$")[17])
        rept_dt           = strip(split(ln, "\$")[18])
        occp_cod          = strip(split(ln, "\$")[19])
        reporter_country  = ""
        occr_country      = ""
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$case\$$i_f_cod\$$foll_seq\$$event_dt\$$mfr_dt\$$fda_dt\$$rept_cod\$$mfr_num\$$mfr_sndr\$$age\$$age_cod\$$sex\$$e_sub\$$wt\$$wt_cod\$$rept_dt\$$occp_cod\$$reporter_country\$$occr_country\n")
      end
    end
  end
end

# process drug files from 2005Q3 to 2012Q3
function second_change(infile, ofile, yr, qtr)
  demoFile = open("$infile")
  for ln in eachline(demoFile)
    ln = chomp(ln)
    if !(ismatch(r"ISR", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 23
        isr               = strip(split(ln, "\$")[1])
        primaryid         = ""
        caseid            = ""
        year              = "20$yr"
        qtr               = qtr
        case              = strip(split(ln, "\$")[2])
        i_f_cod           = strip(split(ln, "\$")[3])
        foll_seq          = strip(split(ln, "\$")[4])
        event_dt          = strip(split(ln, "\$")[6])
        mfr_dt            = strip(split(ln, "\$")[7])
        fda_dt            = strip(split(ln, "\$")[8])
        rept_cod          = strip(split(ln, "\$")[9])
        mfr_num           = strip(split(ln, "\$")[10])
        mfr_sndr          = strip(split(ln, "\$")[11])
        age               = strip(split(ln, "\$")[12])
        age_cod           = strip(split(ln, "\$")[13])
        sex               = strip(split(ln, "\$")[14])
        e_sub             = strip(split(ln, "\$")[15])
        wt                = strip(split(ln, "\$")[16])
        wt_cod            = strip(split(ln, "\$")[17])
        rept_dt           = strip(split(ln, "\$")[18])
        occp_cod          = strip(split(ln, "\$")[19])
        reporter_country  = strip(split(ln, "\$")[23])
        occr_country      = ""
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$case\$$i_f_cod\$$foll_seq\$$event_dt\$$mfr_dt\$$fda_dt\$$rept_cod\$$mfr_num\$$mfr_sndr\$$age\$$age_cod\$$sex\$$e_sub\$$wt\$$wt_cod\$$rept_dt\$$occp_cod\$$reporter_country\$$occr_country\n")
      end
    end
  end
end

# process drug files from 2012Q4 to 2014Q2
function third_change(infile, ofile, yr, qtr)
  demoFile = open("$infile")
  for ln in eachline(demoFile)
    ln = chomp(ln)
    if !(ismatch(r"primary[a-z]+", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 22
        isr               = ""
        primaryid         = strip(split(ln, "\$")[1])
        caseid            = strip(split(ln, "\$")[2])
        year              = "20$yr"
        qtr               = qtr
        case              = strip(split(ln, "\$")[3])
        i_f_cod           = strip(split(ln, "\$")[4])
        foll_seq          = ""
        event_dt          = strip(split(ln, "\$")[5])
        mfr_dt            = strip(split(ln, "\$")[6])
        fda_dt            = strip(split(ln, "\$")[8])
        rept_cod          = strip(split(ln, "\$")[9])
        mfr_num           = strip(split(ln, "\$")[10])
        mfr_sndr          = strip(split(ln, "\$")[11])
        age               = strip(split(ln, "\$")[12])
        age_cod           = strip(split(ln, "\$")[13])
        sex               = strip(split(ln, "\$")[14])
        e_sub             = strip(split(ln, "\$")[15])
        wt                = strip(split(ln, "\$")[16])
        wt_cod            = strip(split(ln, "\$")[17])
        rept_dt           = strip(split(ln, "\$")[18])
        occp_cod          = strip(split(ln, "\$")[20])
        reporter_country  = strip(split(ln, "\$")[21])
        occr_country      = strip(split(ln, "\$")[22])
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$case\$$i_f_cod\$$foll_seq\$$event_dt\$$mfr_dt\$$fda_dt\$$rept_cod\$$mfr_num\$$mfr_sndr\$$age\$$age_cod\$$sex\$$e_sub\$$wt\$$wt_cod\$$rept_dt\$$occp_cod\$$reporter_country\$$occr_country\n")
      end
    end
  end
end

# process drug files from 2014Q3 onwards
function fourth_change(infile, ofile, yr, qtr)
  demoFile = open("$infile")
  for ln in eachline(demoFile)
    ln = chomp(ln)
    if !(ismatch(r"primary[a-z]+", split(ln, "\$")[1]))
      if length(split(ln, "\$")) >= 25
        isr               = ""
        primaryid         = strip(split(ln, "\$")[1])
        caseid            = strip(split(ln, "\$")[2])
        year              = "20$yr"
        qtr               = qtr
        case              = strip(split(ln, "\$")[3])
        i_f_cod           = strip(split(ln, "\$")[4])
        foll_seq          = ""
        event_dt          = strip(split(ln, "\$")[5])
        mfr_dt            = strip(split(ln, "\$")[6])
        fda_dt            = strip(split(ln, "\$")[8])
        rept_cod          = strip(split(ln, "\$")[9])
        mfr_num           = strip(split(ln, "\$")[11])
        mfr_sndr          = strip(split(ln, "\$")[12])
        age               = strip(split(ln, "\$")[14])
        age_cod           = strip(split(ln, "\$")[15])
        sex               = strip(split(ln, "\$")[17])
        e_sub             = strip(split(ln, "\$")[18])
        wt                = strip(split(ln, "\$")[19])
        wt_cod            = strip(split(ln, "\$")[20])
        rept_dt           = strip(split(ln, "\$")[21])
        occp_cod          = strip(split(ln, "\$")[23])
        reporter_country  = strip(split(ln, "\$")[24])
        occr_country      = strip(split(ln, "\$")[25])
        write(ofile, "$isr\$$primaryid\$$caseid\$$year\$$qtr\$$case\$$i_f_cod\$$foll_seq\$$event_dt\$$mfr_dt\$$fda_dt\$$rept_cod\$$mfr_num\$$mfr_sndr\$$age\$$age_cod\$$sex\$$e_sub\$$wt\$$wt_cod\$$rept_dt\$$occp_cod\$$reporter_country\$$occr_country\n")
      end
    end
  end
end




dir = ARGS[1]

oFile = open("./final_data/DEMO_FILE.txt","w")
write(oFile, "isr\$primaryid\$caseid\$year\$qtr\$case\$i_f_cod\$foll_seq\$event_dt\$mfr_dt\$fda_dt\$rept_cod\$mfr_num\$mfr_sndr\$age\$age_cod\$sex\$e_sub\$wt\$wt_cod\$rept_dt\$occp_cod\$reporter_country\$occr_country\n")

for file in readdir(dir)
  if ismatch(r"(?i)DEMO[0-9]{2}Q[0-9]\.TXT", file)
    m = match(r"(?i)DEMO([0-9]{2})Q([0-9])\.TXT", file)
    year = m.captures[1]
    qtr  = m.captures[2]
    #println(year)
    if parse(Int, year) < 5
      println("Processing: $file")
      infile = "$dir$file"
      first_change(infile, oFile, year, qtr)
      #println("\^\^\^\^")
    elseif parse(Int, year) == 5
      if parse(Int, qtr) <= 2
        println("Processing: $file")
        infile = "$dir$file"
        first_change(infile, oFile, year, qtr)
        #println("\^\^\^\^")
      else
        println("Processing: $file")
        infile = "$dir$file"
        second_change(infile, oFile, year, qtr)
        #println("\*\*\*\*")
      end
    elseif parse(Int, year) > 5 && parse(Int, year) < 12
      println("Processing: $file")
      infile = "$dir$file"
      second_change(infile, oFile, year, qtr)
      #println("\*\*\*\*")
    elseif parse(Int, year) == 12
      if parse(Int, qtr) <= 3
        println("Processing: $file")
        infile = "$dir$file"
        second_change(infile, oFile, year, qtr)
        #println("\*\*\*\*")
      else
        println("Processing: $file")
        infile = "$dir$file"
        third_change(infile, oFile, year, qtr)
        #println("\#\#\#\#")
      end
    elseif parse(Int, year) > 12 && parse(Int, year) < 14
      println("Processing: $file")
      infile = "$dir$file"
      third_change(infile, oFile, year, qtr)
      #println("\#\#\#\#")
    elseif parse(Int, year) == 14
      if parse(Int, qtr) <= 2
        println("Processing: $file")
        infile = "$dir$file"
        third_change(infile, oFile, year, qtr)
        #println("\#\#\#\#")
      else
        println("Processing: $file")
        infile = "$dir$file"
        fourth_change(infile, oFile, year, qtr)
        #println("\$\$\$\$")
      end
    else
      println("Processing: $file")
      infile = "$dir$file"
      fourth_change(infile, oFile, year, qtr)
      #println("\$\$\$\$")
    end
  end
end

close(oFile)
