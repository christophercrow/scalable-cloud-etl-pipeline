-- create_tables.sql: Creates the simulation_data table in your SQL data warehouse.

CREATE TABLE simulation_data (
    time FLOAT,
    x FLOAT,
    y FLOAT,
    z FLOAT,
    velocity FLOAT,
    mass FLOAT
);
