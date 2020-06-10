SELECT STUFF((
            SELECT ',' + NAME
    FROM <table>
    FOR XML PATH('')
            ), 1, 1, '')
FROM <table>;