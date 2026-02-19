-- Your task is to calculate the total gain for each category of items in a shop, considering the data available between January 1, 2015, and March 18, 2015. However, there is an issue with the price values in the data, as they are incorrect.
-- To fix this, first, you need to calculate the overall average price of all items within the specified date range (January 1, 2015, to March 18, 2015). Add this average price to the original price of each item to fix the incorrect price values.
-- After correcting the price values, calculate the total gain for each category by summing the product of the quantity and the corrected price for each item in that category. The result should be presented as a list of tuples, where the first element is the category and the second element is the total gain. Finally, sort the results by the total gain in descending order

-- solution

SELECT 
    category,
    SUM(quantity * new_price) AS total_gain
FROM (
    SELECT 
        category,
        quantity,
        price + (
            SELECT AVG(price)
            FROM shop
            WHERE list_date BETWEEN '2015-01-01' AND '2015-03-18'
        ) AS new_price
    FROM shop
    WHERE list_date BETWEEN '2015-01-01' AND '2015-03-18'
) AS corrected_data
GROUP BY category
ORDER BY total_gain DESC;