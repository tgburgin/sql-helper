-- https://stackoverflow.com/questions/21425546/how-to-generate-a-range-of-numbers-between-two-numbers
WITH
    x
    AS
    (
        SELECT n
        FROM (VALUES
                (0),
                (1),
                (2),
                (3),
                (4),
                (5),
                (6),
                (7),
                (8),
                (9)) v(n)
    )
SELECT ones.n + 10*tens.n + 100*hundreds.n + 1000*thousands.n
FROM x ones, x tens, x hundreds, x thousands
ORDER BY 1