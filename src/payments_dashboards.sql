SELECT
    second.time,
    second.mode,
    COALESCE(
        CAST(first.mode_month_count_conf AS float) / CAST(second.mode_month_count AS float) * 100,
        0
    ) AS percents
FROM
    (
        SELECT
            TO_DATE(TO_CHAR(date, 'MM/YY'), 'MM/YY') AS time,
            mode,
            COUNT(id) AS mode_month_count_conf
        FROM
            new_payments
        WHERE
            status = 'Confirmed'
        GROUP BY
            time,
            mode
    ) as first
    RIGHT JOIN (
        SELECT
            TO_DATE(TO_CHAR(date, 'MM/YY'), 'MM/YY') AS time,
            mode,
            COUNT(id) AS mode_month_count
        FROM
            new_payments
        GROUP BY
            time,
            mode
    ) as second ON first.time = second.time
    AND first.mode = second.mode
WHERE
    second.mode != 'Не определено'
GROUP BY
    second.time,
    first.mode_month_count_conf,
    second.mode_month_count,
    second.mode
ORDER BY
    time,
    second.mode;