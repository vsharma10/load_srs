# Determine maximum length of the data fields from FAERS data tables (DRUG)

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
ml_role_cod  = 0
ml_drugname  = 0
ml_prod_ai   = 0
ml_val_vbm   = 0
ml_route     = 0
ml_dose_vbm  = 0
ml_dechal    = 0
ml_rechal    = 0
ml_lot_num   = 0
ml_exp_dt    = 0
ml_nda_num   = 0

inFile = open("DRUG_FILE.txt")

for ln in eachline(inFile)
  ln = chomp(ln)
  if !(ismatch(r"(?i)^ISR", split(ln, "\$")[1]))
    isr, primaryid, caseid, year, qtr, drug_seq, role_cod, drugname, prod_ai, val_vbm, route, dose_vbm, dechal, rechal, lot_num, exp_dt, nda_num = split(ln, "\$")

    l_isr       = length(isr)
    l_primaryid = length(primaryid)
    l_caseid    = length(caseid)
    l_year      = length(year)
    l_qtr       = length(qtr)
    l_drug_seq  = length(drug_seq)
    l_role_cod  = length(role_cod)
    l_drugname  = length(drugname)
    l_prod_ai   = length(prod_ai)
    l_val_vbm   = length(val_vbm)
    l_route     = length(route)
    l_dose_vbm  = length(dose_vbm)
    l_dechal    = length(dechal)
    l_rechal    = length(rechal)
    l_lot_num   = length(lot_num)
    l_exp_dt    = length(exp_dt)
    l_nda_num   = length(nda_num)

    ml_isr       = test(ml_isr      ,l_isr      )
    ml_primaryid = test(ml_primaryid,l_primaryid)
    ml_caseid    = test(ml_caseid   ,l_caseid   )
    ml_year      = test(ml_year     ,l_year     )
    ml_qtr       = test(ml_qtr      ,l_qtr      )
    ml_drug_seq  = test(ml_drug_seq ,l_drug_seq )
    ml_role_cod  = test(ml_role_cod ,l_role_cod )
    ml_drugname  = test(ml_drugname ,l_drugname )
    ml_prod_ai   = test(ml_prod_ai  ,l_prod_ai  )
    ml_val_vbm   = test(ml_val_vbm  ,l_val_vbm  )
    ml_route     = test(ml_route    ,l_route    )
    ml_dose_vbm  = test(ml_dose_vbm ,l_dose_vbm )
    ml_dechal    = test(ml_dechal   ,l_dechal   )
    ml_rechal    = test(ml_rechal   ,l_rechal   )
    ml_lot_num   = test(ml_lot_num  ,l_lot_num  )
    ml_exp_dt    = test(ml_exp_dt   ,l_exp_dt   )
    ml_nda_num   = test(ml_nda_num  ,l_nda_num  )
  end
end

println("*******************************")
println("* DRUG FILE MAX FIELD LENGTHS *")
println("*******************************")

println("isr       = $ml_isr      ")
println("primaryid = $ml_primaryid")
println("caseid    = $ml_caseid   ")
println("year      = $ml_year     ")
println("qtr       = $ml_qtr      ")
println("drug_seq  = $ml_drug_seq ")
println("role_cod  = $ml_role_cod ")
println("drugname  = $ml_drugname ")
println("prod_ai   = $ml_prod_ai  ")
println("val_vbm   = $ml_val_vbm  ")
println("route     = $ml_route    ")
println("dose_vbm  = $ml_dose_vbm ")
println("dechal    = $ml_dechal   ")
println("rechal    = $ml_rechal   ")
println("lot_num   = $ml_lot_num  ")
println("exp_dt    = $ml_exp_dt   ")
println("nda_num   = $ml_nda_num  ")

close(inFile)
