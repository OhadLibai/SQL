/* View 1:
create view of net income of the stores in the database
*/

CREATE  OR REPLACE VIEW netIncomeStores AS
select storeid, revenue - expense as net
from ( select storeID, rent+rates+employees as expense
	   from expenses
       ) as res2
join ( select distinct(storeid) as storeid, sum(total) as revenue
	   from (select storeid, price*quantity as total
			 from revenues
             ) as res0
	   group by storeid
       ) as res1
using (storeid)
order by revenue - expense;

---

/* View 2:
create view which present the hishgest store expenses and its info
regarding its expensses
*/

select *
from expenses 
where not ( rent+employees+rates < any ( select rent+rates+employees
									from expenses ) 
		  )

---

/* View 3:
create view which present the highest grossing store
*/

CREATE  OR REPLACE VIEW storehighestgrossing AS
select storeid
from revenues
group by storeID
having sum(price*quantity) = (select max(total) 
								  from ( select distinct(storeid), sum(price*quantity) as total
										 from revenues
                                         group by storeid
                                         ) as res0
								 );

---

/* View 4:
create view which present the ratio of the rates to size of the shop
*/

CREATE  OR REPLACE VIEW ratestosizeratio AS
select storeid, rates/storesize as r
from expenses join store using(storeid);


---

/* View 5:
create a view which will present the lowest toy in reserve
*/

CREATE  OR REPLACE VIEW lowesrReserve AS
select toyid
from toynetworkinfo info1
where not (info1.reserve >= any ( select reserve
							 from toynetworkinfo info2
                             where info2.reserve <> info1.reserve )
		   );

---

/* View 6:
create view that shows what items are deliverable and currently in stock
*/

CREATE  OR REPLACE VIEW stockDeliver AS
select toyid,toyname
from ( select distinct(toyid)
	   from toystoreselling
       where deliverable = 1 and instock = 1
       ) as res
natural join toy
order by toyid;


---

/* View 7:
write a view which present highest potentional precentage profit
by toy
*/

CREATE  OR REPLACE VIEW percentageprofit AS
select toyid, ((maxP - minprice) / minPrice)*100 as percentage
from toynetworkinfo natural join
(select distinct(toyid), max(currprice) as maxp
 from toystoreselling
 group by toyid
 ) as res;

---

/* View 8:
create view that present toys that can be found in largest number
of stores in the network 
*/

CREATE  OR REPLACE VIEW prevalenttoy AS
select distinct(toyid), count(*) from toystoreselling
group by toyid having count(*) = 
(select count(*)
from toystoreselling
group by toyid
order by count(*) desc
limit 1);

---

/* View 9:
create a view which present the higher selling quantities
*/

CREATE  OR REPLACE VIEW highseller AS
select toyid, sum(quantity)
from revenues
group by toyid
having sum(quantity) = ( select sum(quantity)
						 from revenues
                         group by toyid
                         order by sum(quantity) desc
                         limit 1
                         );

---