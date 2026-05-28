-- =========================================================
-- CREATE DIRTY CUSTOMER TABLE
-- =========================================================

CREATE TABLE customers_dirty (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    phone TEXT,
    city TEXT,
    country TEXT,
    signup_date TEXT,
    amount TEXT
);

-- =========================================================
-- INSERT MESSY CUSTOMER DATA
-- =========================================================

INSERT INTO customers_dirty (
    name,
    email,
    phone,
    city,
    country,
    signup_date,
    amount
)

SELECT

    -- =========================
    -- MESSY NAMES
    -- =========================
    CASE 
        WHEN i % 10 = 0 THEN '  Ali Khan  '
        WHEN i % 7 = 0 THEN 'Sara Ahmed'
        ELSE 'User ' || i
    END,

    -- =========================
    -- INVALID EMAILS
    -- =========================
    CASE 
        WHEN i % 15 = 0 THEN 'invalidemail.com'
        WHEN i % 9 = 0 THEN 'test@test.com'
        ELSE 'user' || i || '@gmail.com'
    END,

    -- =========================
    -- MESSY PHONE NUMBERS
    -- =========================
    CASE 
        WHEN i % 12 = 0 THEN NULL
        WHEN i % 5 = 0 THEN '123-456-789'
        ELSE '03' || (100000000 + i)::TEXT
    END,

    -- =========================
    -- INCONSISTENT CITY NAMES
    -- =========================
    CASE 
        WHEN i % 6 = 0 THEN 'karachi'
        WHEN i % 8 = 0 THEN 'LAHORE'
        WHEN i % 11 = 0 THEN ''
        ELSE 'Islamabad'
    END,

    -- =========================
    -- WRONG COUNTRY VALUES
    -- =========================
    CASE 
        WHEN i % 10 = 0 THEN 'IND'
        ELSE 'Pakistan'
    END,

    -- =========================
    -- MESSY DATE FORMATS
    -- =========================
    CASE 
        WHEN i % 13 = 0 THEN '12-05-2023'
        ELSE '2023-01-' || ((i % 28)+1)
    END,

    -- =========================
    -- OUTLIERS + TEXT VALUES
    -- =========================
    CASE 
        WHEN i % 20 = 0 THEN '999999'
        WHEN i % 17 = 0 THEN 'abc'
        ELSE (100 + i)::TEXT
    END

FROM generate_series(1,500) i;

select * from customers_dirty;