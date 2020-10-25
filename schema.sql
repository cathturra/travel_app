CREATE DATABASE travel_app;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    password TEXT
);

CREATE TABLE travel_posts (
    id SERIAL PRIMARY KEY,
    name TEXT,
    user_id INTEGER,
    location TEXT,
    description TEXT,
    image_url TEXT
);

CREATE TABLE travel_suggestions (
    id SERIAL PRIMARY KEY,
    location TEXT,
    description TEXT,
    image_url TEXT
);

CREATE TABLE culture (
    id SERIAL PRIMARY KEY,
    location TEXT,
    description TEXT,
    image_url TEXT
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    location TEXT,
    description TEXT,
    image_url TEXT
);

CREATE TABLE accomodation (
    id SERIAL PRIMARY KEY,
    location TEXT, 
    description TEXT,
    image_url TEXT
);

INSERT INTO travel_posts (location, description) VALUES ('Venice', 'To describe my trip to Venice as turning out to be above and beyond expectations is an understatement. Exploring the coblestone streets after sunset, stumbling upon unexpected grandious and spectacular buildings, admiring the depth of the city''s long history. This charming city surrounded by water is like no other.'),  ('Bondi Beach', '6am on Bondi beach and it is already a hub of energy and excitement. There are surfers ready to catch some waves and well built athletic individuals are getting in their daily exercise from across the foreshore. This is all happening as the sun is still rising. It is this health and wellness culture that is so incredibly appealing about Bondi.'), ('The Louvre', 'The sheer quantity of precious artifacts found within this one location makes it difficult not to feel inspired when entering the museum. Filled with people travelling near and far, all with the intention to contemplate on unique works of art. From the ''Winged Victory of Samothrace'' to the ''Mona Lisa'', each piece has its own rich history.');

INSERT INTO travel_suggestions (location, description) VALUES ('Paris', 'Brimming with sophistication and class, Paris is a must see destination.'), ('London', 'Fast paced and lively, there is always an event to attend in this beautiful city.'), ('Berlin', 'With its trendy hip culture, Berlin is a city filled with seemingly endless possibilities.');

INSERT INTO culture (location, description) VALUES ('Paris', 'Cultural description'), ('London', 'Cultural description');

INSERT INTO events (location, description) VALUES ('Paris', 'Event description'), ('London', 'Event description');

INSERT INTO accomodation (location, description) VALUES ('Paris', 'Accomodation description'), ('London', 'Accomodation description');

