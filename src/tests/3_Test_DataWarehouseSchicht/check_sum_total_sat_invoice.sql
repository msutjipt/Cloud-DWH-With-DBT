SELECT SUM(CONVERT(float, Total)) AS Total
FROM [dbo].[dv_Sat_Invoice]
WHERE BillingCountry = 'USA'
HAVING ROUND(SUM(ROUND(CONVERT(float, Total), 2)), 2) != 523.06