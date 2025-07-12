CREATE TABLE Pesanan (
    Pesanan_id INTEGER PRIMARY KEY,
    Order_date DATE,
	Order_time TIME,
    Quantity INTEGER,
    Total_price NUMERIC(15, 3),
    Customer_id INTEGER,
    Driver_id INTEGER,
    Restaurant_id INTEGER,
    Payment_id INTEGER,
    FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_id) ON DELETE CASCADE,
    FOREIGN KEY (Driver_id) REFERENCES Driver(Driver_id) ON DELETE CASCADE,
    FOREIGN KEY (Restaurant_id) REFERENCES Restaurant(Restaurant_id) ON DELETE CASCADE,
    FOREIGN KEY (Payment_id) REFERENCES Payment(Payment_id) ON DELETE CASCADE
);
