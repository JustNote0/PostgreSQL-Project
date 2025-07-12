CREATE OR REPLACE FUNCTION laporan_transaksi_harian(p_order_date DATE)
RETURNS TABLE (
    pesanan_id INTEGER,
    order_date DATE,
    order_time TIME,
    quantity INTEGER,
    total_price NUMERIC,
    customer_name TEXT,
    driver_name TEXT,
    restaurant_name TEXT,
    menu_name TEXT,
    payment_status TEXT,
    payment_method TEXT 
) AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.Pesanan_id,
        p.Order_date,
        p.Order_time,
        p.Quantity,
        (CAST(p.Quantity AS NUMERIC) * m.Price) AS Total_Harga,
        c.Name AS customer_name,
        d.Name AS driver_name,
        r.Name AS restaurant_name,
        m.Name AS menu_name,  
        pm.Payment_status,
        CASE 
            WHEN pmeth.Gopay IS NOT NULL THEN 'Gopay' 
            WHEN pmeth.Shopeepay IS NOT NULL THEN 'Shopeepay' 
            WHEN pmeth.Ovo IS NOT NULL THEN 'Ovo' 
            WHEN pmeth.Tf_bri IS NOT NULL THEN 'TF BRI'
            WHEN pmeth.Tf_bca IS NOT NULL THEN 'TF BCA'
            WHEN pmeth.Tf_mandiri IS NOT NULL THEN 'TF Mandiri'
            ELSE 'Unknown' 
        END AS payment_method
    FROM Pesanan p
    LEFT JOIN Customer c ON p.Customer_id = c.Customer_id
    LEFT JOIN Driver d ON p.Driver_id = d.Driver_id
    LEFT JOIN Restaurant r ON p.Restaurant_id = r.Restaurant_id
    LEFT JOIN Menu m ON r.Restaurant_id = m.Restaurant_id  
    LEFT JOIN Payment pm ON p.Payment_id = pm.Payment_id
    LEFT JOIN Payment_Method pmeth ON pm.Payment_id = pmeth.Payment_id
    WHERE p.Order_date = p_order_date;
END;
$$ LANGUAGE plpgsql;
