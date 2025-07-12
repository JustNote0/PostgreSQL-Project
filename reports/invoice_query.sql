SELECT 
    p.Pesanan_id AS Nomor_Invoice,
    p.Order_date AS Invoice_Date,
    p.Order_time AS Invoice_Time,
    c.Name AS Nama_Customer,
    c.Phone AS No_HP_Customer,
    c.Address AS Address_Customer,
    m.Name AS Nama_Menu,
    m.Price AS Harga,
    p.Quantity,
    (p.Quantity * m.Price) AS Total_Harga,
    r.Name AS Nama_Restaurant,
    r.Location AS Restaurant_Location
FROM Pesanan p
LEFT JOIN Customer c ON p.Customer_id = c.Customer_id
LEFT JOIN Restaurant r ON p.Restaurant_id = r.Restaurant_id
LEFT JOIN Menu m ON p.Restaurant_id = m.Restaurant_id;
