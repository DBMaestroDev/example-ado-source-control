-- Sample upgrade script for template-psql/VNumber/DbPrefix_rs
CREATE TABLE sample_table_V1 (
    id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    date_of_birth DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active INT DEFAULT 1,
    login_count INT DEFAULT 0,
    salary DECIMAL(10,2),
    metadata TEXT,
    
    CONSTRAINT chk_active_binary CHECK (is_active IN (0, 1))
);