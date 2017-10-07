# Determine maximum length of the data fields from FAERS data tables (DEMO)

function test(ml::Int64, l::Int64)
  if ml > l
    return ml
  else
    return l
  end
end

ml_isr               = 0
ml_primaryid         = 0
ml_caseid            = 0
ml_year              = 0
ml_qtr               = 0
ml_case              = 0
ml_i_f_cod           = 0
ml_foll_seq          = 0
ml_event_dt          = 0
ml_mfr_dt            = 0
ml_fda_dt            = 0
ml_rept_cod          = 0
ml_mfr_num           = 0
ml_mfr_sndr          = 0
ml_age               = 0
ml_age_cod           = 0
ml_sex               = 0
ml_e_sub             = 0
ml_wt                = 0
ml_wt_cod            = 0
ml_rept_dt           = 0
ml_occp_cod          = 0
ml_reporter_country  = 0
ml_occr_country      = 0

inFile = open("DEMO_FILE.txt")

for ln in eachline(inFile)
  ln = chomp(ln)
  if !(ismatch(r"(?i)^ISR", split(ln, "\$")[1]))
    isr, primaryid, caseid, year, qtr, case, i_f_cod, foll_seq, event_dt, mfr_dt, fda_dt, rept_cod, mfr_num, mfr_sndr, age, age_cod, sex, e_sub, wt, wt_cod, rept_dt, occp_cod, reporter_country, occr_country = split(ln, "\$")

    l_isr               = length(isr)
    l_primaryid         = length(primaryid)
    l_caseid            = length(caseid)
    l_year              = length(year)
    l_qtr               = length(qtr)
    l_case              = length(case)
    l_i_f_cod           = length(i_f_cod)
    l_foll_seq          = length(foll_seq)
    l_event_dt          = length(event_dt)
    l_mfr_dt            = length(mfr_dt)
    l_fda_dt            = length(fda_dt)
    l_rept_cod          = length(rept_cod)
    l_mfr_num           = length(mfr_num)
    l_mfr_sndr          = length(mfr_sndr)
    l_age               = length(age)
    l_age_cod           = length(age_cod)
    l_sex               = length(sex)
    l_e_sub             = length(e_sub)
    l_wt                = length(wt)
    l_wt_cod            = length(wt_cod)
    l_rept_dt           = length(rept_dt)
    l_occp_cod          = length(occp_cod)
    l_reporter_country  = length(reporter_country)
    l_occr_country      = length(occr_country)

    ml_isr               = test(ml_isr, l_isr)
    ml_primaryid         = test(ml_primaryid, l_primaryid)
    ml_caseid            = test(ml_caseid, l_caseid)
    ml_year              = test(ml_year, l_year)
    ml_qtr               = test(ml_qtr, l_qtr)
    ml_case              = test(ml_case, l_case)
    ml_i_f_cod           = test(ml_i_f_cod, l_i_f_cod)
    ml_foll_seq          = test(ml_foll_seq, l_foll_seq)
    ml_event_dt          = test(ml_event_dt, l_event_dt)
    ml_mfr_dt            = test(ml_mfr_dt, l_mfr_dt)
    ml_fda_dt            = test(ml_fda_dt, l_fda_dt)
    ml_rept_cod          = test(ml_rept_cod, l_rept_cod)
    ml_mfr_num           = test(ml_mfr_num, l_mfr_num)
    ml_mfr_sndr          = test(ml_mfr_sndr, l_mfr_sndr)
    ml_age               = test(ml_age, l_age)
    ml_age_cod           = test(ml_age_cod, l_age_cod)
    ml_sex               = test(ml_sex, l_sex)
    ml_e_sub             = test(ml_e_sub, l_e_sub)
    ml_wt                = test(ml_wt, l_wt)
    ml_wt_cod            = test(ml_wt_cod, l_wt_cod)
    ml_rept_dt           = test(ml_rept_dt, l_rept_dt)
    ml_occp_cod          = test(ml_occp_cod, l_occp_cod)
    ml_reporter_country  = test(ml_reporter_country, l_reporter_country)
    ml_occr_country      = test(ml_occr_country, l_occr_country)
  end
end

println("*******************************")
println("* DEMO FILE MAX FIELD LENGTHS *")
println("*******************************")


println("isr               = $ml_isr")
println("primaryid         = $ml_primaryid")
println("caseid            = $ml_caseid")
println("year              = $ml_year")
println("qtr               = $ml_qtr")
println("case              = $ml_case")
println("i_f_cod           = $ml_i_f_cod")
println("foll_seq          = $ml_foll_seq")
println("event_dt          = $ml_event_dt")
println("mfr_dt            = $ml_mfr_dt")
println("fda_dt            = $ml_fda_dt")
println("rept_cod          = $ml_rept_cod")
println("mfr_num           = $ml_mfr_num")
println("mfr_sndr          = $ml_mfr_sndr")
println("age               = $ml_age")
println("age_cod           = $ml_age_cod")
println("sex               = $ml_sex")
println("e_sub             = $ml_e_sub")
println("wt                = $ml_wt")
println("wt_cod            = $ml_wt_cod")
println("rept_dt           = $ml_rept_dt")
println("occp_cod          = $ml_occp_cod")
println("reporter_country  = $ml_reporter_country")
println("occr_country      = $ml_occr_country")

close(inFile)
