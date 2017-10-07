# Determine maximum length of the data fields from FAERS data tables (INDI)

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
ml_indi_pt   = 0

inFile = open("INDI_FILE.txt")

for ln in eachline(inFile)
  ln = chomp(ln)
  if !(ismatch(r"(?i)^ISR", split(ln, "\$")[1]))
    isr, primaryid, caseid, year, qtr, drug_seq, indi_pt = split(ln, "\$")

    l_isr       = length(isr      )
    l_primaryid = length(primaryid)
    l_caseid    = length(caseid   )
    l_year      = length(year     )
    l_qtr       = length(qtr      )
    l_drug_seq  = length(drug_seq )
    l_indi_pt   = length(indi_pt  )

    ml_isr       = test(ml_isr      , l_isr      )
    ml_primaryid = test(ml_primaryid, l_primaryid)
    ml_caseid    = test(ml_caseid   , l_caseid   )
    ml_year      = test(ml_year     , l_year     )
    ml_qtr       = test(ml_qtr      , l_qtr      )
    ml_drug_seq  = test(ml_drug_seq , l_drug_seq )
    ml_indi_pt   = test(ml_indi_pt  , l_indi_pt  )
  end
end

println("*******************************")
println("* INDI FILE MAX FIELD LENGTHS *")
println("*******************************")

println("isr       = $ml_isr      ")
println("primaryid = $ml_primaryid")
println("caseid    = $ml_caseid   ")
println("year      = $ml_year     ")
println("qtr       = $ml_qtr      ")
println("drug_seq  = $ml_drug_seq ")
println("indi_pt   = $ml_indi_pt  ")

close(inFile)
