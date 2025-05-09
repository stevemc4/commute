-- Migration number: 0001 	 2025-04-21T16:03:45.027Z

CREATE TABLE IF NOT EXISTS stations (
  id VARCHAR(32) PRIMARY KEY NOT NULL UNIQUE,
  name VARCHAR(128) NOT NULL,
  code VARCHAR(32) NOT NULL,
  formattedName VARCHAR(128),
  region VARCHAR(32) NOT NULL,
  regionCode VARCHAR(4) NOT NULL,
  operator VARCHAR(8) NOT NULL,
  timetableSynced BOOLEAN NOT NULL DEFAULT FALSE,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS schedules (
  id VARCHAR(32) PRIMARY KEY NOT NULL UNIQUE,
  stationId VARCHAR(32) NOT NULL REFERENCES stations(id) ON DELETE CASCADE ON UPDATE CASCADE,
  tripNumber VARCHAR(12) NOT NULL,
  estimatedDeparture TIME NOT NULL,
  estimatedArrival TIME NOT NULL,
  boundFor VARCHAR(64) NOT NULL,
  lineCode VARCHAR(8) NOT NULL,
  createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updatedAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
