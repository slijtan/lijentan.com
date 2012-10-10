CREATE TABLE "images" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "url" varchar(255), "post_id" integer, "position" integer DEFAULT 1);
CREATE TABLE "posts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "body" text, "background_color" varchar(255), "background_url" varchar(255), "foreground_url" varchar(255), "background_quote" varchar(255), "background_quote_author" varchar(255), "shifting_background" boolean, "space" varchar(255) DEFAULT 'auto', "published" boolean DEFAULT 'f', "date_published" datetime, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "type" varchar(255) DEFAULT 'text' NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20120928080545');

INSERT INTO schema_migrations (version) VALUES ('20121004234215');

INSERT INTO schema_migrations (version) VALUES ('20121005003433');