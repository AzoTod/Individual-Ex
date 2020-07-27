SELECT c.Name as CompanyName, p.Name as ProductName, pl.Price, pg.Name FROM Companies c
JOIN PriceLists pl on pl.Id = c.PriceListId
JOIN Products p on p.Id = pl.ProductId
JOIN ProductGroups pg on pg.Id = p.ProductGroupId
WHERE c.Id = 1
GROUP BY pg.Name;

SELECT p.Name as ProductName, c.Name as CompanyName, c.Address FROM Companies c
JOIN PriceLists pl on pl.Id = c.PriceListId
JOIN Products p on p.Id = pl.ProductId
WHERE p.Id = 1
AND p.Id IN (SELECT pl1.ProductId FROM PriceLists pl1 where pl1.Id = c.PriceListId);

SELECT Name, PhoneNumber, ContactPersonFullName FROM Companies;