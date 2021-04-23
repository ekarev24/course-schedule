select  distinct [Case Number]=matter_number,
	   Docket=docket_indict_number 


	   --,[Apeearance Status]=case appearance_status_key when 1 then 'Closed'
				--						when 2 then 'Active'
				--						when 3 then 'Inactive' end,
	   --[Case status]=case m.matter_status_key when 1 then 'Active'
	   --                            when 2 then'Closed' end 
	   --,m.matter_status_key
from
Matter m
join CaseAppearance ca on m.matter_key=ca.matter_key
and start_date=(select max(ca2.start_date) 
							from caseappearance ca2
							where ca2.matter_key=ca.matter_key)
and appearance_status_key=1
and m.matter_status_key=1
and matter_type_key=14