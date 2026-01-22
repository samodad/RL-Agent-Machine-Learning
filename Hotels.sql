USE Hotels
GO

-- Identify Null Values
SELECT
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS NullCities,
    SUM(CASE WHEN Hotel_Name IS NULL THEN 1 ELSE 0 END) AS NullHotelNames,
    SUM(CASE WHEN Type IS NULL THEN 1 ELSE 0 END) AS NullTypes,
    SUM(CASE WHEN Price_Range IS NULL THEN 1 ELSE 0 END) AS NullPriceRanges,
    SUM(CASE WHEN Stars IS NULL THEN 1 ELSE 0 END) AS NullStars,
    SUM(CASE WHEN Amenities IS NULL THEN 1 ELSE 0 END) AS NullAmenities
FROM [dbo].[Hotel recommendations];


-- Remove rows with Nulls
DELETE FROM[dbo].[Hotel recommendations]
WHERE City IS NULL
   OR Hotel_Name IS NULL
   OR Type IS NULL
   OR Price_Range IS NULL
   OR Stars IS NULL
   OR Amenities IS NULL;

-- Create Cleaned Tables
SELECT*
FROM [dbo].[Hotel recommendations]
WHERE City IS NOT NULL
  AND Hotel_Name IS NOT NULL
  AND Type IS NOT NULL
  AND Price_Range IS NOT NULL
  AND Stars IS NOT NULL
  AND Amenities IS NOT NULL;

--Replace Nulls
UPDATE [dbo].[Hotel recommendations]
SET City = COALESCE(City, 'Unknown'),
    Hotel_Name = COALESCE(Hotel_Name, 'Unnamed Hotel'),
    Type = COALESCE(Type, 'Other'),
    Price_Range = COALESCE(Price_Range, 'Not Specified'),
    Stars = COALESCE(Stars, 0),
    Amenities = COALESCE(Amenities, 'None');