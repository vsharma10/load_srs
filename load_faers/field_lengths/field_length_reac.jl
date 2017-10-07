# Determine maximum length of the data fields from FAERS data tables (OUTC)

function test(ml::Int64, l::Int64)
  if ml > l
    return ml
  else
    return l
  end
end

ml_isr          = 0
ml_primaryid    = 0
ml_caseid       = 0
ml_year         = 0
ml_qtr          = 0
ml_pt           = 0
ml_drug_rec_act = 0


inFile = open("REAC_FILE.txt")

for ln in eachline(inFile)
  ln = chomp(ln)
  if !(ismatch(r"(?i)^ISR", split(ln, "\$")[1]))
    isr, primaryid, caseid, year, qtr, pt, drug_rec_act = split(ln, "\$")

    l_isr          = length(isr         )
    l_primaryid    = length(primaryid   )
    l_caseid       = length(caseid      )
    l_year         = length(year        )
    l_qtr          = length(qtr         )
    l_pt           = length(pt          )
    l_drug_rec_act = length(drug_rec_act)

    ml_isr          = test(ml_isr         , l_isr         )
    ml_primaryid    = test(ml_primaryid   , l_primaryid   )
    ml_caseid       = test(ml_caseid      , l_caseid      )
    ml_year         = test(ml_year        , l_year        )
    ml_qtr          = test(ml_qtr         , l_qtr         )
    ml_pt           = test(ml_pt          , l_pt          )
    ml_drug_rec_act = test(ml_drug_rec_act, l_drug_rec_act)

  end
end

println("*******************************")
println("* REAC FILE MAX FIELD LENGTHS *")
println("*******************************")

println("isr          = $ml_isr         ")
println("primaryid    = $ml_primaryid   ")
println("caseid       = $ml_caseid      ")
println("year         = $ml_year        ")
println("qtr          = $ml_qtr         ")
println("pt           = $ml_pt          ")
println("drug_rec_act = $ml_drug_rec_act")

close(inFile)
