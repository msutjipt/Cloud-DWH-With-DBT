SELECT COUNT(*) as count
FROM sys.tables
WHERE name IN ('Album', 'Artist', 'Track', 'Genre', 'MediaType', 'PlaylistTrack', 'Playlist', 'InvoiceLine', 'Invoice', 'Customer', 'Employee')
HAVING COUNT(*) != 11