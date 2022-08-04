#Practice/Review 
#Write a query to show the country and surface area of all countries with a surface area 
#of more than 5 million. 
#Sort the list by surface area with the largest first.
SELECT Name, SurfaceArea
FROM Country
WHERE SurfaceArea > 5000000
ORDER BY SurfaceArea DESC;

#Write a query to show the country and life expectancy of all countries with a life expectancy 
#of more than 75 years old.
#Sort by life expectancy with larger age first
SELECT Name, LifeExpectancy
FROM country
WHERE LifeExpectancy > 75
ORDER BY LifeExpectancy;

#Write a query to show the unique forms of government in the country table. 
#Sort the list in alphabetical order. 
SELECT DISTINCT GovernmentForm
FROM country
ORDER BY GovernmentForm;

#Write a query to list the population in each continent. 
#Specify the Population Total with the label Population_Total.
#Sort by the largest population first. 
SELECT Continent, SUM(Population) AS Population_Total
FROM country
GROUP BY Continent
ORDER BY Population_Total DESC; 

#Write a query to list the continents and the number of governments in each continent 
#How many different forms of government are in each continent?
SELECT Continent, COUNT(DISTINCT GovernmentForm)
FROM country
GROUP BY Continent;

#Write a query that shows the offical language that is spoken in each country
SELECT Name, Language 
FROM countrylanguage JOIN country
ON country.Code = countrylanguage.CountryCode
WHERE IsOfficial = 'T';

#Write a query that shows 2 columns (with specified labels):
#Country - the name of the country
#Num_of_Languages - the number of languages spoken in that country
SELECT Name AS Country, COUNT(Language) AS Num_of_Languages
FROM country JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode
GROUP BY Country;

#more practice
SELECT continent, AVG(city.population)
FROM country JOIN city
ON country.Code = city.CountryCode
GROUP BY continent;

SELECT * FROM countrylanguage
ORDER BY Percentage DESC;

SELECT max(percentage), continent
FROM countryLanguage RIGHT JOIN country
ON countryLanguage.CountryCode = country.code
GROUP BY country.continent;

SELECT country.name, COUNT(District)
FROM country JOIN city
ON country.Code = city.CountryCode
GROUP BY country.name;