CREATE TABLE "public"."expired" (
    "id" text NOT NULL,
    "task" int NOT NULL,
    "ts" bigint NOT NULL,
    "stimulus" bigint NOT NULL
) WITH (oids = false);

CREATE TABLE "public"."source" (
    "id" bigint NOT NULL,
    "ts" bigint NOT NULL,
    "data" bytea NOT NULL,
    "stimulus" bigint NOT NULL,
    "sent" boolean DEFAULT false NOT NULL,
    "expired" boolean DEFAULT false NOT NULL,
    CONSTRAINT "SourceTuple_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "public"."sink" (
    "id" bigint NOT NULL,
    "ts" bigint NOT NULL,
    "data" bytea NOT NULL,
    "stimulus" bigint NOT NULL,
    "sent" boolean DEFAULT false NOT NULL,
    CONSTRAINT "SinkTuple_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

CREATE TABLE "public"."edge" (
    "source" bigint NOT NULL,
    "sink" bigint NOT NULL,
    "stimulus" bigint NOT NULL,
    "sent" boolean DEFAULT false NOT NULL,
    CONSTRAINT "Edge_sinkId_fkey" FOREIGN KEY (sink) REFERENCES sink(id) NOT DEFERRABLE,
    CONSTRAINT "Edge_sourceId_fkey" FOREIGN KEY (source) REFERENCES source(id) NOT DEFERRABLE
) WITH (oids = false);

CREATE INDEX "SourceTuple_ts" ON "public"."source" USING btree ("ts");

CREATE VIEW min_expired AS
SELECT ts AS min_ts, stimulus AS min_stimulus FROM expired
ORDER BY ts ASC, stimulus ASC LIMIT 1;
