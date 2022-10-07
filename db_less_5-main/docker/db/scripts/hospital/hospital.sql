CREATE TABLE "hospital_station" (
  "stat_nr" int PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "room" (
  "room_nr" int PRIMARY KEY,
  "stat_nt" int,
  "beds" int
);

CREATE TABLE "patient" (
  "patient_nr" int PRIMARY KEY,
  "name" varchar,
  "disease" varchar,
  "doctor" int
);

CREATE TABLE "admission" (
  "room_nr" int,
  "patient_nr" int,
  "from" timestamp,
  "to" timestamp
);

CREATE TABLE "station_personnel" (
  "pers_nr" int PRIMARY KEY,
  "name" varchar,
  "stat_nr" int
);

CREATE TABLE "caregiver" (
  "pers_nr" int PRIMARY KEY,
  "qualification" varchar
);

CREATE TABLE "doctor" (
  "pers_nr" int PRIMARY KEY,
  "area" varchar,
  "rank" varchar
);

ALTER TABLE "room" ADD FOREIGN KEY ("stat_nt") REFERENCES "hospital_station" ("stat_nr");

ALTER TABLE "patient" ADD FOREIGN KEY ("doctor") REFERENCES "doctor" ("pers_nr");

ALTER TABLE "admission" ADD FOREIGN KEY ("room_nr") REFERENCES "room" ("room_nr");

ALTER TABLE "admission" ADD FOREIGN KEY ("patient_nr") REFERENCES "patient" ("patient_nr");

ALTER TABLE "station_personnel" ADD FOREIGN KEY ("stat_nr") REFERENCES "hospital_station" ("stat_nr");

ALTER TABLE "doctor" ADD FOREIGN KEY ("pers_nr") REFERENCES "station_personnel" ("pers_nr");

ALTER TABLE "caregiver" ADD FOREIGN KEY ("pers_nr") REFERENCES "station_personnel" ("pers_nr");
