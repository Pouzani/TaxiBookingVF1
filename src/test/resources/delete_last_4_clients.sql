-- Delete the last 4 rows from the client table
DELETE FROM client
WHERE client_id IN (
    SELECT client_id
    FROM client
    ORDER BY client_id DESC
    LIMIT 4
    );