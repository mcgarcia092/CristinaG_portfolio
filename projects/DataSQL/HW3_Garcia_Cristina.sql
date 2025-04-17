-- 1. Retrieve the name of the app that has the highest number of ratings (i.e., rating_count) and the number of ratings it received.  

SELECT name, rating_count
FROM apps, app.reviews
WHERE apps.id= app_reviews.id
ORDER BY rating_count desc
LIMIT 1;



-- 2. Retrieve the name and primary category for the apps that are game-center enabled and whose primary category is not "Games" (use apps table). 
SELECT name, category_primary
FROM apps
WHERE game_center = 1
AND category_primary != 'Games';



-- 3. In which primary category, the apps have the highest mean average_rating? 
SELECT name, category_primary
FROM apps
GROUP BY category_primary
ORDER BY AVG(content_rating) DESC
LIMIT 1;


-- 4. List the total number of ratings (rating_count) received for each primary category? Please list them in descending order of the total number of ratings. 

SELECT category_primary, SUM(content_rating) AS total_ratings
FROM apps
GROUP BY category_primary
ORDER BY total_ratings DESC;

-- 5. List the primary category, number of ratings and average ratings for the app “Google Earth”. 

SELECT category_primary, content_rating AS number_ratings, average_rating
FROM apps, app_reviews
WHERE apps.id=app_reviews.id
AND name= 'GOOGLE EARTH';


-- 6. (3 pts) Show the top list and list the total number of apps in each top list from the table top300 table. Anything you can say about the findings? 

SELECT list, COUNT(*) AS total_apps
FROM top300
GROUP BY list
ORDER BY list;



-- 7. (3 pts) In the "Top Free" list, which two primary categories appear most often?

SELECT category_primary, COUNT(*) AS count
FROM apps,top300
WHERE top300.id = apps.id
AND list = 'Top Free'
GROUP BY category_primary
ORDER BY count DESC
LIMIT 2;



-- 8. (4 pts) What is the shortest time in number of days between an app’s release date and the date an app makes to the top list? What do you think about this information? 

SELECT DATEDIFF(insert_time,release_date) as shortest_days_to_top
FROM apps a, top300 t
WHERE a.id=t.id
ORDER BY shortest_days_to_top asc
limit 1;


-- 9. (3 pts) On Aug 31, do we miss any data for any of the top lists? Please provide evidence to support your answer. 
SELECT COUNT(*) as missing_data
FROM top300
WHERE date(insert_time)= '2023-08-31';


-- 10. (3 pts) Is the apps table complete? That is, do we have data on all apps that appear in the top 300 list?  Please provide evidence supporting your answer.    

SELECT COUNT(*)
FROM top300
WHERE id NOT IN (SELECT id FROM apps);

-- 11. You have learned that data redundancy is generally bad in a database setting, and you notice that there is redundant information on developer information that exists in both the apps table and the app_categories table, and you decide to check if the information matches. If the information does not match, it indicates inconsistency and potential problem down the road. Please write a query to check if there is any inconsistency. If your answer points out inconsistency, please report the error rate in terms of the percentage of data not matched on this particular piece of information (developer).  

SELECT COUNT(*) AS inconsistent_count
FROM apps a
JOIN app_categories ac on a.id = ac.id
WHERE a.developer !=ac.developer;


SELECT (m.mismatched_count * 100.0/t.total_count) AS error_rate_p
FROM
	(SELECT COUNT(*) AS mismatched_count
    FROM apps a
    JOIN app_categories c ON a.id = c.id
    WHERE a.developer <> c.developer) m,
    (SELECT COUNT(*) AS total_count
    FROM apps a
    JOIN app_categories c ON a.id = c.id) t;

