CREATE TABLE "city" (
  "name" varchar PRIMARY KEY,
  "region" varchar
);

CREATE TABLE "station" (
  "name" varchar PRIMARY KEY,
  "city" varchar,
  "tracks" int
);

CREATE TABLE "train" (
  "train_nr" int PRIMARY KEY,
  "length" int
);

CREATE TABLE "schedule" (
  "train" int,
  "from" varchar,
  "to" varchar,
  "departure_time" timestamp,
  "arrival_time" timestamp
);

ALTER TABLE "station" ADD FOREIGN KEY ("city") REFERENCES "city" ("name");

ALTER TABLE "schedule" ADD FOREIGN KEY ("train") REFERENCES "train" ("train_nr");

ALTER TABLE "schedule" ADD FOREIGN KEY ("from") REFERENCES "station" ("name");

ALTER TABLE "schedule" ADD FOREIGN KEY ("to") REFERENCES "station" ("name");
