CREATE TABLE Payment_Method (
    Py_Method_id INTEGER PRIMARY KEY,
    Payment_id INTEGER,
    Gopay VARCHAR(50),
    Shopeepay VARCHAR(50),
    Ovo VARCHAR(50),
    Tf_bri VARCHAR(50),
    Tf_bca VARCHAR(50),
    Tf_mandiri VARCHAR(50),
    FOREIGN KEY (Payment_id) REFERENCES Payment(Payment_id) ON DELETE CASCADE
);
