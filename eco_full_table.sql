SELECT
	ee.idhod,
	ee.hodnota as amount,
	ee.rok as "year",
	ee.duvernost as confidentiality,
	ee.uzemi_txt as "location",
	dnn_cis.text as non_investment_expense_type,
	ozp_cis.text as "program",
	sector_cis.text as sector,
	stapro.text_en as type_of_expense
FROM eco_expenses ee
LEFT JOIN dnn_cis ON dnn_cis.chodnota = ee.dnn_kod
LEFT JOIN sector_cis ON sector_cis.chodnota = ee.sektor_kod
LEFT JOIN ozp_cis ON ozp_cis.chodnota = ee.ozp_kod
LEFT JOIN stapro ON stapro.kod = ee.stapro_kod











