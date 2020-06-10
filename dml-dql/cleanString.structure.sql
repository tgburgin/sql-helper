-- https://sqlstudies.com/2015/03/25/clean-out-all-bad-characters-from-a-string/
DECLARE @Pattern varchar(50) = '%[^a-zA-Z0-9_''{}"() *&%$#@!?/\;:,.<>]%';

WITH
    FixBadChars
    AS
    (
                    SELECT StringToFix, StringToFix AS FixedString, 1 AS MyCounter, Id
            FROM BadStringList
        UNION ALL
            SELECT StringToFix, Stuff(FixedString, PatIndex(@Pattern, 
					FixedString COLLATE Latin1_General_BIN2), 1, '') AS FixedString,
                MyCounter + 1, Id
            FROM FixBadChars
            WHERE FixedString COLLATE Latin1_General_BIN2 LIKE @Pattern
    )
SELECT StringToFix, FixedString, MyCounter, Id
FROM FixBadChars
WHERE MyCounter = 
		(SELECT MAX(MyCounter)
FROM FixBadChars Fixed
WHERE Fixed.Id = FixBadChars.Id)
OPTION
(MAXRECURSION
1000);