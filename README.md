# 🍽️ Food Delivery Database System — PostgreSQL Project

Welcome to the **Food Delivery PostgreSQL Database System**, a comprehensive relational data model designed to support the full lifecycle of an online food ordering platform. This project integrates customer management, restaurant menus, driver logistics, and multiple payment methods into a single unified database schema — complete with advanced reporting via views and stored functions.

---

## 🔍 Project Description

This database project simulates a real-world food delivery platform like GoFood or GrabFood, where customers can order meals from various restaurants, pay using different digital wallets or bank transfers, and get their food delivered by registered drivers.

The system is developed using **PostgreSQL**, and includes:
- Structured entity relationships
- Logical and conceptual data models
- SQL views for automated daily reports
- Functions for dynamic data queries
- Rich sample queries for transactional and invoice reporting

---

## 🗂️ Repository Structure

PosgreSQL-Project/
│
├── Insert_data/
│ ├── data_customer.sql
│ ├── data_driver.sql
│ ├── data_menu.sql
| ├── data_payment.sql
| ├── data_payment_method.sql
| ├── data_pesanan.sql
| └── data_restaurant.sql
│
├── create_table/
│ └── laporan_transaksi_harian.sql # Daily transaction report (View)
│
├── functions/
│ └── laporan_transaksi_harian.sql # Function to get daily report by date
│
├── queries/
│ ├── sql_invoice.sql # Query to extract detailed invoice
│ └── sql_transaction_report.sql # Transaction summary including payment method
│
└── README.md
