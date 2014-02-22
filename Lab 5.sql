-- Q1
select distinct agents.city
from agents,
     orders,
     customers
where agents.aid = orders.aid
  and customers.cid = orders.cid
  and customers.name = 'Basics'
order by agents.city

--Q2 
select distinct o2.pid
from customers
inner join orders as o1
on customers.cid = o1.cid
right join orders as o2
on o1.aid = o2.aid
where customers.city = 'Kyoto'
order by o2.pid asc;


--Q3
select name
from customers
where cid not in (select cid
		  from orders)

--Q4 
select customers.name
from customers
full outer join orders
on customers.cid = orders.cid
where customers.cid not in (select cid
			    from orders)

--Q5
select distinct customers.name, agents.name
from customers,
     orders,
     agents
where customers.city = agents.city
  and orders.cid = customers.cid
  and orders.aid = agents.aid
order by customers.name

--Q6
select distinct customers.name, agents.name, agents.city
from customers,
     orders,
     agents
where customers.city = agents.city

--Q7
select customers.name, customers.city
from customers
left outer join products
on customers.cid = products.pid
where customers.city in (select city
			 from products
			 group by city
			 order by sum(quantity) asc
			 limit 1)