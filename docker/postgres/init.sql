CREATE TABLE IF NOT EXISTS paste (
    key VARCHAR(16) PRIMARY KEY,
    title TEXT DEFAULT 'Untitled',
    author INTEGER DEFAULT NULL,
    timestamp_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    timestamp_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    date_expiry DATE DEFAULT CURRENT_DATE + INTERVAL '1 months' * 6,
    visibility INTEGER DEFAULT 0
);

-- CREATE OR REPLACE FUNCTION update_date_updated()
-- RETURN TRIGGER AS $$
-- BEGIN
--     NEW.date_updated = CURRENT_TIMESTAMP;
--     RETURN NEW;
-- END;
-- $$ LANGUAGE plpgsql;
--
-- CREATE TRIGGER paste_updated
-- BEFORE UPDATE ON paste
-- FOR EACH ROW
-- EXECUTE FUNCTION update_date_updated();


CREATE TABLE IF NOT EXISTS account (
    id SERIAL PRIMARY KEY,
    username VARCHAR(36),
    email VARCHAR(254) UNIQUE,
    password TEXT,
    timestamp_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    verified BOOLEAN DEFAULT false
);


