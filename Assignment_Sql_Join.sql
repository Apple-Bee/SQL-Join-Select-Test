# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first

SELECT * FROM City WHERE Name LIKE 'ping%' ORDER BY Population ASC;

# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first

SELECT * FROM City WHERE Name LIKE 'ran%' ORDER BY Population DESC;
# 3: Count all cities

SELECT COUNT(*) FROM City;

# 4: Get the average population of all cities

SELECT AVG(Population) FROM City;

# 5: Get the biggest population found in any of the cities

SELECT MAX(Population) FROM City;

# 6: Get the smallest population found in any of the cities

SELECT MIN(Population) FROM City;

# 7: Sum the population of all cities with a population below 10000

SELECT SUM(Population) FROM City WHERE Population < 10000;

# 8: Count the cities with the countrycodes MOZ and VNM

SELECT COUNT(*) FROM City WHERE CountryCode IN ('MOZ', 'VNM');

# 9: Get individual count of cities for the countrycodes MOZ and VNM

SELECT CountryCode, COUNT(*) AS CityCount FROM City WHERE CountryCode IN ('MOZ', 'VNM') GROUP BY CountryCode;

# 10: Get average population of cities in MOZ and VNM

SELECT CountryCode, AVG(Population) AS AvgPopulation FROM City WHERE CountryCode IN ('MOZ', 'VNM') GROUP BY CountryCode;

# 11: Get the countrycodes with more than 200 cities

SELECT CountryCode FROM City GROUP BY CountryCode HAVING COUNT(*) > 200;

# 12: Get the countrycodes with more than 200 cities ordered by city count

SELECT CountryCode, COUNT(*) AS CityCount FROM City GROUP BY CountryCode HAVING COUNT(*) > 200 ORDER BY CityCount DESC;

# 13: What language(s) is spoken in the city with a population between 400 and 500 ?

SELECT DISTINCT cl.Language
FROM City c
JOIN CountryLanguage cl ON c.CountryCode = cl.CountryCode
WHERE c.Population BETWEEN 400 AND 500;

# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them

SELECT c.Name, cl.Language
FROM City c
JOIN CountryLanguage cl ON c.CountryCode = cl.CountryCode
WHERE c.Population BETWEEN 500 AND 600;

# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)

SELECT c1.Name
FROM City c1
JOIN City c2 ON c1.CountryCode = c2.CountryCode
WHERE c2.Population = 122199;

# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)

SELECT c1.Name
FROM City c1
JOIN City c2 ON c1.CountryCode = c2.CountryCode
WHERE c2.Population = 122199 AND c1.Id != c2.Id;


# 17: What are the city names in the country where Luanda is capital?

SELECT c.Name
FROM City c
JOIN Country co ON c.CountryCode = co.Code
WHERE co.Capital = (SELECT Id FROM City WHERE Name = 'Luanda');


# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT c.Name
FROM City c
JOIN Country co ON c.Id = co.Capital
WHERE co.Region = (SELECT Region FROM Country WHERE Capital = (SELECT Id FROM City WHERE Name = 'Yaren'));


# 19: What unique languages are spoken in the countries in the same region as the city named Riga

SELECT DISTINCT cl.Language
FROM CountryLanguage cl
JOIN Country co ON cl.CountryCode = co.Code
WHERE co.Region = (SELECT Region FROM Country WHERE Capital = (SELECT Id FROM City WHERE Name = 'Riga'));

# 20: Get the name of the most populous city

SELECT Name
FROM City
ORDER BY Population DESC
LIMIT 1;


















