PRAGMA synchronous = OFF;
PRAGMA journal_mode = MEMORY;
BEGIN TRANSACTION;
CREATE TABLE "lessn_autoslug" (
  "id" int(11) NOT NULL ,
  "method" varchar(31) NOT NULL,
  "base10" varchar(100) NOT NULL,
  PRIMARY KEY ("id")
);
INSERT INTO "lessn_autoslug" VALUES (1,'base36','2');
INSERT INTO "lessn_autoslug" VALUES (2,'base62','1');
INSERT INTO "lessn_autoslug" VALUES (3,'mixed-smart','1');
INSERT INTO "lessn_autoslug" VALUES (4,'smart','1');
CREATE TABLE "lessn_schema_info" (
  "id" int(11) NOT NULL ,
  "version" int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY ("id")
);
INSERT INTO "lessn_schema_info" VALUES (1,5);
CREATE TABLE "lessn_url_stats" (
  "id" int(11) NOT NULL ,
  "url_id" int(11) NOT NULL,
  "ip_address" varchar(128) DEFAULT NULL,
  "referer" text,
  "created_on" datetime NOT NULL,
  PRIMARY KEY ("id")
);
CREATE TABLE "lessn_urls" (
  "id" int(11) NOT NULL ,
  "url" text NOT NULL,
  "checksum" bigint(20)  NOT NULL,
  "custom_url" varchar(255) DEFAULT NULL,
  "redir_type" varchar(6) NOT NULL DEFAULT 'auto',
  PRIMARY KEY ("id")
);
CREATE INDEX "lessn_urls_checksum_index" ON "lessn_urls" ("checksum");
CREATE INDEX "lessn_urls_redir_type_index" ON "lessn_urls" ("redir_type");
CREATE INDEX "lessn_autoslug_method_index" ON "lessn_autoslug" ("method");
END TRANSACTION;
