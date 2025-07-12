CREATE OR REPLACE VIEW laporan_transaksi_harian AS
SELECT 
    p.Pesanan_id,
    p.Order_date,
    p.Order_time,
    p.Quantity,
    (p.Quantity * m.Price) AS Total_Harga,
    c.Name AS Customer_Name,
    d.Name AS Driver_Name,
    r.Name AS Restaurant_Name,
    m.Name AS Menu_Name,  
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
LEFT JOIN Customer c ON p.Customer_id = c.Customer_id
LEFT JOIN Driver d ON p.Driver_id = d.Driver_id
LEFT JOIN Restaurant r ON p.Restaurant_id = r.Restaurant_id
LEFT JOIN Menu m ON r.Restaurant_id = m.Restaurant_id  
LEFT JOIN Payment pm ON p.Payment_id = pm.Payment_id
LEFT JOIN Payment_Method pmeth ON pm.Payment_id = pmeth.Payment_id;