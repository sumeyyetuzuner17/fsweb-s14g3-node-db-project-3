-- Multi-Table Sorgu Pratiği

-- Tüm ürünler(product) için veritabanındaki ProductName ve CategoryName'i listeleyin. (77 kayıt göstermeli)

select ProductName,CategoryName from Product p
join Category c on p.CategoryId = c.Id

-- 9 Ağustos 2012 öncesi verilmiş tüm siparişleri(order) için sipariş id'si (Id) ve gönderici şirket adını(CompanyName)'i listeleyin. (429 kayıt göstermeli)

select o.Id as 'SiparisId',c.CompanyName from [Order] o 
join Customer c on o.CustomerId = c.Id where OrderDate<'2012-08-09'

-- Id'si 10251 olan siparişte verilen tüm ürünlerin(product) sayısını ve adını listeleyin. ProdcutName'e göre sıralayın. (3 kayıt göstermeli)
select count(ProductName) as 'Ürün Sayısı',P.ProductName from OrderDetail od
join Product p on od.ProductId = p.Id

where OrderId=10251
group by ProductName
order by p.ProductName
-- Her sipariş için OrderId, Müşteri'nin adını(Company Name) ve çalışanın soyadını(employee's LastName). Her sütun başlığı doğru bir şekilde isimlendirilmeli. (16.789 kayıt göstermeli)
select o.Id,c.CompanyName,e.LastName from [Order] o 
join Employee e on o.EmployeeId = e.Id
join Customer c on o.CustomerId = c.Id

---Her gönderici tarafından gönderilen gönderi sayısını bulun.
select CustomerId,Count(CustomerId) as 'SiparisSayisi' from [Order] o 
group by CustomerId
---Sipariş sayısına göre ölçülen en iyi performans gösteren ilk 5 çalışanı bulun.
select EmployeeId,Count(EmployeeId)as 'Performans' from [Order] o
group by EmployeeId
order by Count(EmployeeId) desc
limit 5
---Gelir olarak ölçülen en iyi performans gösteren ilk 5 çalışanı bulun.

---En az gelir getiren kategoriyi bulun.

---En çok siparişi olan müşteri ülkesini bulun.
select c.Country,count(c.Country) as 'Siparis Sayısı' from [Order] o
join Customer c on c.Id=o.CustomerId

group by c.ContactName
order by count(c.Country) desc
limit 1