-- Format the "Perfume" column: replace hyphens with spaces, capitalize the first letter, lowercase the rest
UPDATE "FragranticaData"
SET "Perfume" = CONCAT(
    UPPER(SUBSTRING(REPLACE("Perfume", '-', ' '), 1, 1)),
    LOWER(SUBSTRING(REPLACE("Perfume", '-', ' '), 2))
)
WHERE "Perfume" IS NOT NULL;

-- Format the "Brand" column similarly: remove hyphens and standardize capitalization
UPDATE "FragranticaData"
SET "Brand" = CONCAT(
    UPPER(SUBSTRING(REPLACE("Brand", '-', ' '), 1, 1)),
    LOWER(SUBSTRING(REPLACE("Brand", '-', ' '), 2))
);

-- Capitalize the first letter of the "Gender" values (e.g., 'male' → 'Male')
UPDATE "FragranticaData"
SET "Gender" = INITCAP("Gender");

-- Replace commas with dots in the "Rating Value" column for numeric conversion compatibility
UPDATE "FragranticaData"
SET "Rating Value" = REPLACE("Rating Value", ',', '.');

-- Cast "Rating Value" to DOUBLE for numerical analysis
UPDATE "FragranticaData"
SET "Rating Value" = CAST("Rating Value" AS DOUBLE);

-- Cast "Rating Count" to INTEGER for aggregation or filtering
UPDATE "FragranticaData"
SET "Rating Count" = CAST("Rating Count" AS INTEGER);

-- Convert "Year" to INTEGER where the value is not null or empty
UPDATE "FragranticaData"
SET "Year" = CAST("Year" AS INTEGER)
WHERE "Year" IS NOT NULL AND "Year" != '';

-- Standardize perfumer names: capitalize first letters; default missing second perfumer to 'Unknown'
UPDATE "FragranticaData"
SET "Perfumer1" = INITCAP("Perfumer1"),
    "Perfumer2" = INITCAP(COALESCE("Perfumer2", 'Unknown'));

-- Capitalize first letters in scent-related columns (Top, Middle, Base notes and main accords)
UPDATE "FragranticaData"
SET 
    "mainaccord1" = INITCAP("mainaccord1"),
    "mainaccord2" = INITCAP("mainaccord2"),
    "mainaccord3" = INITCAP("mainaccord3"),
    "mainaccord4" = INITCAP("mainaccord4"),
    "mainaccord5" = INITCAP("mainaccord5")
WHERE 
    "mainaccord1" IS NOT NULL OR
    "mainaccord2" IS NOT NULL OR
    "mainaccord3" IS NOT NULL OR
    "mainaccord4" IS NOT NULL OR
    "mainaccord5" IS NOT NULL;
