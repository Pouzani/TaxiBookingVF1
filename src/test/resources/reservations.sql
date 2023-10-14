INSERT INTO taxi (marque, version, matricule, couleur)
VALUES
    ('Toyota', 'Corolla', 'XYZ123', 'Red'),
    ('Honda', 'Civic', 'ABC456', 'Blue'),
    ('Ford', 'Fusion', 'LMN789', 'Silver'),
    ('Nissan', 'Altima', 'PQR987', 'Black');

-- Populate the reservation table
INSERT INTO reservation (taxi_id, client_id, date_reservation, heureDebut_reservation, minDebut_reservation, heureFin_reservation, minFin_reservation, isValidate)
VALUES
    (1, 1, '2023-10-15', 10, 0, 12, 0, 1),
    (2, 2, '2023-10-16', 9, 30, 11, 30, 1),
    (1, 2, '2023-10-17', 14, 0, 16, 0, 0);
