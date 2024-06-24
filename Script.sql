CREATE TABLE Gender (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Master (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    login VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    gender_id INTEGER,
    FOREIGN KEY (gender_id) REFERENCES Gender(id)
);

CREATE TABLE Client (
    id SERIAL PRIMARY KEY,
    bio TEXT NOT NULL,
    phone VARCHAR(255) NOT NULL
);

CREATE TABLE Status (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Repair (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE Application (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price NUMERIC(19, 2) NOT NULL,
    date TIMESTAMP NOT NULL,
    master_id INTEGER,
    client_id INTEGER,
    status_id INTEGER,
    type_id INTEGER,
    possible_repair_id INTEGER,
    FOREIGN KEY (master_id) REFERENCES Master(id),
    FOREIGN KEY (client_id) REFERENCES Client(id),
    FOREIGN KEY (status_id) REFERENCES Status(id),
    FOREIGN KEY (type_id) REFERENCES Type(id),
    FOREIGN KEY (possible_repair_id) REFERENCES Repair(id)
);
