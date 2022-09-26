CREATE TABLE "animals"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "date_of_birth" DATE NOT NULL,
    "escape_attempts" INTEGER NOT NULL,
    "neutered" BOOLEAN NOT NULL,
    "weight_kg" DECIMAL(8, 2) NOT NULL,
    "species_id" INTEGER NOT NULL,
    "owners_id" INTEGER NOT NULL
);
ALTER TABLE
    "animals" ADD PRIMARY KEY("id");
CREATE TABLE "owners"(
    "id" INTEGER NOT NULL,
    "full_name" CHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "email" VARCHAR(255) NOT NULL
);
CREATE INDEX "owners_email_index" ON
    "owners"("email");
ALTER TABLE
    "owners" ADD PRIMARY KEY("id");
CREATE TABLE "species"(
    "id" INTEGER NOT NULL,
    "name" CHAR(255) NOT NULL
);
ALTER TABLE
    "species" ADD PRIMARY KEY("id");
CREATE TABLE "vets"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "age" INTEGER NOT NULL,
    "date_of_graduation" DATE NOT NULL
);
ALTER TABLE
    "vets" ADD PRIMARY KEY("id");
CREATE TABLE "specilizations"(
    "id" INTEGER NOT NULL,
    "vet_id" INTEGER NOT NULL,
    "specie_id" INTEGER NOT NULL
);
ALTER TABLE
    "specilizations" ADD PRIMARY KEY("id");
CREATE TABLE "visits"(
    "id" INTEGER NOT NULL,
    "animals_id" INTEGER NOT NULL,
    "vet_id" INTEGER NOT NULL,
    "date_of_visits" DATE NOT NULL
);
CREATE INDEX "visits_animals_id_vet_id_index" ON
    "visits"("animals_id", "vet_id");
ALTER TABLE
    "visits" ADD PRIMARY KEY("id");