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
ml_rpsr_cod  = 0

inFile = open("RPSR_FILE.txt")

for ln in eachline(inFile)
  ln = chomp(ln)
  if !(ismatch(r"(?i)^ISR", split(ln, "\$")[1]))
    isr, primaryid, caseid, year, qtr, rpsr_cod = split(ln, "\$")

    l_isr       = length(isr      )
    l_primaryid = length(primaryid)
    l_caseid    = length(caseid   )
    l_year      = length(year     )
    l_qtr       = length(qtr      )
    l_rpsr_cod  = length(rpsr_cod )

    ml_isr       = test(ml_isr      , l_isr      )
    ml_primaryid = test(ml_primaryid, l_primaryid)
    ml_caseid    = test(ml_caseid   , l_caseid   )
    ml_year      = test(ml_year     , l_year     )
    ml_qtr       = test(ml_qtr      , l_qtr      )
    ml_rpsr_cod  = test(ml_rpsr_cod , l_rpsr_cod )

  end
end

println("*******************************")
println("* RPSR FILE MAX FIELD LENGTHS *")
println("*******************************")

println("isr       = $ml_isr      ")
println("primaryid = $ml_primaryid")
println("caseid    = $ml_caseid   ")
println("year      = $ml_year     ")
println("qtr       = $ml_qtr      ")
println("rpsr_cod  = $ml_rpsr_cod ")

close(inFile)
