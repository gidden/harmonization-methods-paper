SELECT   info.region, domain.model, domain.scenario,  info.what,   data.tsyear, data.tsvalue                                                                                            
  from iamc_tsdata data                                                      
  inner join iamc_tsinfo info on data.tsid = info.tsid                       
  inner join iamc_tsinfo_domain domain on info.domain_id = domain.domid      
  inner join iamc_variable_info var on info.what = var.name                  
  inner join iamc_region reg on reg.region = info.region                     
  and (
    (domain.scenario like 'SSP2-Ref-SPA0-V25' and domain.model like 'MESSAGE-GLOBIOM')
    or 
    (domain.scenario like 'SSP2-45-SPA2-V25' and domain.model like 'MESSAGE-GLOBIOM')
    or
    (domain.scenario like 'SSP2-Ref-SPA0-V25-no' and domain.model like 'MESSAGE-GLOBIOM')
    or 
    (domain.scenario like 'SSP2-45-SPA2-V25-no' and domain.model like 'MESSAGE-GLOBIOM')
    or
    domain.scenario in ('CEDS')
  )
  and (
    var.name like 'CEDS%9+%'
  )
  where LOWER(info.region) != info.region
  order by region, model, scenario, what, tsyear
