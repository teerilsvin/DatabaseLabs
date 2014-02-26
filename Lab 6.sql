--Q1
select customers.name, customers.city
from customers,
	(select city, sum(quantity)
	 from products
	 group by city
	 order by sum(quantity) desc
	 limit 1) sub1
where customers.city = sub1.city


--Q2
select customers.name, customers.city
from customers, 
	(select city, sum(quantity) as total
	from products
	where products.city in (select city
				from customers)
	group by city
	order by total desc
	limit 1) sub1
where customers.city = sub1.city
order by customers.name asc

--Q3
select name
from products
where priceUSD > (select avg(priceUSD)
		     from products)
		     
--Q4
select customers.name, orders.pid, orders.dollars
from customers
right outer join orders
on customers.cid = orders.cid
order by orders.dollars desc

--Q5
select customers.name, sum(dollars)
from customers
right outer join orders
on customers.cid = orders.cid
group by customers.cid

--Q6
select customers.name, products.name, agents.name
from customers,
     products,
     orders,
     agents
where customers.cid = orders.cid
  and products.pid = orders.pid
  and agents.aid = orders.aid
  and agents.city = 'New York'
  

--Q7
select orders.dollars as actual, (priceUSD * orders.qty) - ( 
		((customers.discount * .01) *  (priceUSD * orders.qty))) as check
from orders,
     products,
     customers
where products.pid = orders.pid
  and customers.cid = orders.cid

