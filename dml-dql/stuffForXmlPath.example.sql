-- https://stackoverflow.com/questions/31211506/how-stuff-and-for-xml-path-work-in-sql-server
SELECT abc = STUFF((
            SELECT ',' + NAME
    FROM temp1
    FOR XML PATH('')
            ), 1, 1, '')
FROM temp1;