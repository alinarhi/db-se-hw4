CREATE TABLE "book" (
  "isbn" int PRIMARY KEY,
  "publisher" varchar,
  "year" int,
  "title" varchar,
  "author" varchar,
  "pages_number" int
);

CREATE TABLE "reader" (
  "id" int PRIMARY KEY,
  "surname" varchar,
  "name" varchar,
  "address" varchar,
  "birthday" date
);

CREATE TABLE "publisher" (
  "name" varchar PRIMARY KEY,
  "address" varchar
);

CREATE TABLE "copy" (
  "id" int PRIMARY KEY,
  "isbn" int,
  "location" varchar
);

CREATE TABLE "copy_borrow" (
  "copy_id" int,
  "reader_id" int,
  "return_date" date
);

CREATE TABLE "category" (
  "name" varchar PRIMARY KEY,
  "parent" varchar
);

ALTER TABLE "book" ADD FOREIGN KEY ("publisher") REFERENCES "publisher" ("name");

ALTER TABLE "copy" ADD FOREIGN KEY ("isbn") REFERENCES "book" ("isbn");

ALTER TABLE "copy_borrow" ADD FOREIGN KEY ("copy_id") REFERENCES "copy" ("id");

ALTER TABLE "copy_borrow" ADD FOREIGN KEY ("reader_id") REFERENCES "reader" ("id");

ALTER TABLE "category" ADD FOREIGN KEY ("parent") REFERENCES "category" ("name");


CREATE TABLE "category_book" (
  "category_name" varchar NOT NULL,
  "book_isbn" int NOT NULL,
  PRIMARY KEY ("category_name", "book_isbn")
);

ALTER TABLE "category_book" ADD FOREIGN KEY ("category_name") REFERENCES "category" ("name");

ALTER TABLE "category_book" ADD FOREIGN KEY ("book_isbn") REFERENCES "book" ("isbn");

