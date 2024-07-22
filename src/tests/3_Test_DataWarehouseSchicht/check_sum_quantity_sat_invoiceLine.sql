SELECT SUM(CONVERT(int, Quantity)) AS Total_Quantity
FROM [dbo].[dv_Sat_InvoiceLine] AS SIL
INNER JOIN dv_Link_InvoiceLine AS LIL ON SIL.TRACK_INVOICE_HK = LIL.TRACK_INVOICE_HK
INNER JOIN dv_Hub_Invoice AS HI ON LIL.INVOICE_HK = HI.INVOICE_HK
WHERE InvoiceId = 5
HAVING SUM(CONVERT(int, Quantity)) != 14