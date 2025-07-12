SELECT 
    p.Pesanan_id AS Nomor_Trnsaksi,
    p.Order_date AS Date,
    p.Order_time AS Time,
    c.Name AS Customer_Name,
    d.Name AS Driver_Name,
    r.Name AS Restaurant_Name,
    m.Name AS Menu_Name,
    p.Quantity,
    (p.Quantity * m.Price) AS Total_Harga,
    pm.Payment_status,
    CASE 
        WHEN pmeth.Gopay IS NOT NULL THEN 'Gopay' 
        WHEN pmeth.Shopeepay IS NOT NULL THEN 'Shopeepay' 
        WHEN pmeth.Ovo IS NOT NULL THEN 'Ovo' 
        WHEN pmeth.Tf_bri IS NOT NULL THEN 'TF BRI'
        WHEN pmeth.Tf_bca IS NOT NULL THEN 'TF BCA'
        WHEN pmeth.Tf_mandiri IS NOT NULL THEN 'TF Mandiri'
        ELSE 'Unknown'
    END AS Payment_Method
FROM Pesanan p
JOIN Customer c ON p.Customer_id = c.Customer_id
JOIN Driver d ON p.Driver_id = d.Driver_id
JOIN Restaurant r ON p.Restaurant_id = r.Restaurant_id
JOIN Menu m ON r.Restaurant_id = m.Restaurant_id
JOIN Payment pm ON p.Payment_id = pm.Payment_id
JOIN Payment_Method pmeth ON pm.Payment_id = pmeth.Payment_id;
