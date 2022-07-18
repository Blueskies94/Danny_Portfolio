select firstname + ' ' + LastName Salesperson,
isnull([776],0) [776],
isnull([777],0) [777],
isnull([778],0) [778],
isnull([771],0) [771],
isnull([714],0) [772],
isnull([716],0) [773],
isnull([709],0) [774],
isnull([712],0) [775]
from
(select person.FirstName, person.LastName, productid, linetotal
from sales.SalesOrderHeader
inner join sales.SalesOrderDetail
on SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
inner join person.Person
on person.BusinessEntityID = SalesOrderHeader.SalesPersonID
) as pvt

pivot(
	sum(LineTotal)
	for productID in (
	[776],
[777],
[778],
[771],
[714],
[716],
[709],
[712]
)
	)p