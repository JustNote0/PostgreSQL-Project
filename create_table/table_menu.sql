CREATE TABLE Menu (
    Menu_id INTEGER PRIMARY KEY,
    Restaurant_id INTEGER,
    Name TEXT,
    Price NUMERIC(15, 3),
    Description TEXT,
    FOREIGN KEY (Restaurant_id) REFERENCES Restaurant(Restaurant_id) ON DELETE CASCADE
);
