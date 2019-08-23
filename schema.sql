CREATE DATABASE recycle_tree;

CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "username" VARCHAR(300),
  "email" VARCHAR(300),
  "password_digest" VARCHAR(400),
  "mobile_number" int
);

CREATE TABLE "listings" (
  "id" SERIAL PRIMARY KEY,
  "title" VARCHAR(100),
  "category_id" VARCHAR(300),
  "description" VARCHAR(300),
  "user_id" int,
  "date_created" timestamp,
  "last_updated" timestamp,
  "street_address" VARCHAR(300),
  "postcode" VARCHAR(300),
  "image_url" VARCHAR(300),
  "listing_status" VARCHAR(50)
);

CREATE TABLE "categories" (
  "id" SERIAL PRIMARY KEY,
  "title" VARCHAR(100)
);

CREATE TABLE "messages" (
  "id" SERIAL PRIMARY KEY,
  "listing_id" int,
  "sender_id" int,
  "receiver_id" int,
  "message_read" boolean,
  "body" text
);

CREATE TABLE "businesses" (
  "id" SERIAL PRIMARY KEY,
  "business_name" VARCHAR(300),
  "street_address" VARCHAR(300),
  "postcode" VARCHAR(300),
  "category_id" int
);

CREATE TABLE "comments" (
  "id" SERIAL PRIMARY KEY,
  "listing_id" int,
  "user_id" int,
  "body" text,
  "date_created" timestamp,
  "question_read" boolean,
  "comment_type" VARCHAR(50)
);
