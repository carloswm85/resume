#1
#Write a query to show the country and population of all countries
#with population smaller than 5 million. 
#Sort the list by populations with the largest population first.
SELECT Name, Population
FROM country
WHERE Population < 5000000
ORDER BY Population DESC;

#2
#Write a query to show a list of the unique languages in the countrylanguage table. 
#Sort the list in alphabetical order.
SELECT DISTINCT Language
FROM countrylanguage
ORDER BY Language;

#3
#Write a query to list the continents and the number of countries in each continent.
SELECT Continent, COUNT(Name)
FROM Country
GROUP BY Continent;

#4
#Write a query that shows the columns (with specified labels):
#Country - name of country
#Avg_Population_of_Cities - the average population of the cities of that country 
#Sort the results by largest population average first
SELECT country.Name, AVG(city.Population) AS Avg_Population_of_Cities
FROM country JOIN city
ON country.Code = city.CountryCode
GROUP BY country.Name
ORDER BY Avg_Population_of_Cities DESC;