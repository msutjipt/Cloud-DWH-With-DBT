SELECT SUM(CONVERT(bigint, Bytes)) AS Total_Bytes
FROM [dbo].[dv_Sat_Track]
HAVING SUM(CONVERT(bigint, Bytes)) != 117386255350