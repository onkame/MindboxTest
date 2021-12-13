SELECT ProductName,CategoryName FROM Products right join Compliance ON Compliance.IDProduct = Products.IDProduct
left join Categories ON Compliance.IDCategory = Categories.IDCategory
ORDER BY ProductName