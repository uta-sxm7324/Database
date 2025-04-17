CREATE VIEW `ItemSalesSummary` AS
SELECT
i.iId,
i.Iname,
SUM(o.Amount) AS TotalRevenue,
SUM(oi.Icount) AS TotalQuantitySold
FROM `ArlingtonOrganicMarket`.`order_item` oi
JOIN `ArlingtonOrganicMarket`.`item` i ON oi.iId = i.iId
JOIN `ArlingtonOrganicMarket`.`order` o ON oi.oId = o.oId
GROUP BY i.iId, i.Iname;

CREATE VIEW TopLoyalCustomers AS
SELECT cId AS "cId",
Cname AS "Cname",
LoyaltyScore AS "LoyaltyScore"
FROM ArlingtonOrganicMarket.customer
ORDER BY LoyaltyScore DESC
LIMIT 10;