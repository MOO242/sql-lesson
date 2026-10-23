-- Sample data for SQL Lesson 3. Fictional. Works in Snowflake and PostgreSQL.
CREATE TABLE reservations (
  confirmation_no VARCHAR(10),
  hotel_name      VARCHAR(60),
  arrival_date    DATE,
  country         VARCHAR(20),
  market_segment  VARCHAR(20),
  booking_status  VARCHAR(20),
  room_revenue    NUMERIC(10,2)
);

INSERT INTO reservations VALUES
('CN-1001','Palm Crest Hotel Dubai',          '2026-11-01','UAE',  'Transient','Confirmed',18400),
('CN-1002','Skyline Grand DIFC',              '2026-11-02','UAE',  'Group',    'Confirmed',52600),
('CN-1003','Corniche Breeze Abu Dhabi',       '2026-11-03','UAE',  'Corporate','Confirmed', 7900),
('CN-1004','Skyline Grand DIFC',              '2026-11-04','UAE',  'Transient','Cancelled',12300),
('CN-1005','Desert Rose Riyadh',              '2026-11-05','KSA',  'Group',    'Confirmed',41800),
('CN-1006','Pearl Bay Doha',                  '2026-11-06','Qatar','Group',    'Confirmed',36500),
('CN-1007','Nile Terrace Cairo',              '2026-11-07','Egypt','Transient','Confirmed', 6200),
('CN-1008','Oasis Haven Al Ain',              '2026-11-08','UAE',  'Group',    'Confirmed',22100),
('CN-1009','Saadiyat Lumen Abu Dhabi',        '2026-11-09','UAE',  'Transient','Confirmed',15800),
('CN-1010','Red Sea Pavilion Jeddah',         '2026-11-10','KSA',  'Group',    'Cancelled',29900),
('CN-1011','Emirates Gate Hotel',             '2026-11-11','UAE',  'Wholesale','Confirmed', 9400),
('CN-1012','Gulf of Oman Retreat Muscat',     '2026-11-12','Oman', 'Group',    'Confirmed',27300),
('CN-1013','Marina Tide Dubai',               '2026-11-13','UAE',  'Group',    'Cancelled',31200),
('CN-1014','Pyramid View Cairo',              '2026-11-14','Egypt','Corporate','Confirmed', 5100),
('CN-1015','West Bay Regency Doha',           '2026-11-15','Qatar','Transient','Confirmed',24800),
('CN-1016','Green Oasis Dubai',               '2026-11-16','UAE',  'Transient','Confirmed', 8700);
