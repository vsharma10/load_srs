# Determine maximum length of the data fields from FAERS data tables (OUTC)

function test(ml::Int64, l::Int64)
  if ml > l
    return ml
  else
    return l
  end
end

ml_isr       = 0
ml_primaryid = 0
ml_caseid    = 0
ml_year      = 0
ml_qtr       = 0
ml_drug_seq  = 0
ml_start_dt  = 0
ml_end_dt    = 0
ml_dur       = 0
ml_dur_cod   = 0

inFile = open("THER_FILE.txt")

for ln in eachline(inFile)
  ln = chomp(ln)
  if !(ismatch(r"(?i)^ISR", split(ln, "\$")[1]))
    isr, primaryid, caseid, year, qtr, drug_seq, start_dt, end_dt, dur, dur_cod = split(ln, "\$")

    l_isr       = length(isr      )
    l_primaryid = length(primaryid)
    l_caseid    = length(caseid   )
    l_year      = length(year     )
    l_qtr       = length(qtr      )
    l_drug_seq  = length(drug_seq )
    l_start_dt  = length(start_dt )
    l_end_dt    = length(end_dt   )
    l_dur       = length(dur      )
    l_dur_cod   = length(dur_cod  )

    ml_isr       = test(ml_isr      , l_isr      )
    ml_primaryid = test(ml_primaryid, l_primaryid)
    ml_caseid    = test(ml_caseid   , l_caseid   )
    ml_year      = test(ml_year     , l_year     )
    ml_qtr       = test(ml_qtr      , l_qtr      )
    ml_drug_seq  = test(ml_drug_seq , l_drug_seq )
    ml_start_dt  = test(ml_start_dt , l_start_dt )
    ml_end_dt    = test(ml_end_dt   , l_end_dt   )
    ml_dur       = test(ml_dur      , l_dur      )
    ml_dur_cod   = test(ml_dur_cod  , l_dur_cod  )

  end
end

println("*******************************")
println("* THER FILE MAX FIELD LENGTHS *")
println("*******************************")

println("isr       = $ml_isr      ")
println("primaryid = $ml_primaryid")
println("caseid    = $ml_caseid   ")
println("year      = $ml_year     ")
println("qtr       = $ml_qtr      ")
println("drug_seq  = $ml_drug_seq ")
println("start_dt  = $ml_start_dt ")
println("end_dt    = $ml_end_dt   ")
println("dur       = $ml_dur      ")
println("dur_cod   = $ml_dur_cod  ")

close(inFile)
