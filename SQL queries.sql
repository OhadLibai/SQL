/* Q1
which supplier supplies biggest number of toys?
*/

select supplierName
from supply s1
group by suppliername
having count(*) >= all (select count(*)
				   from supply s2
                   where s1.suppliername <> s2.suppliername
                   group by supplierName)

/*
suppliername
SuppToy
*/

---

/* Q2
which supplier offers the lowest price for toy 5?
*/

select supplierName, supplierPrice
from supply
where toyID = 5 and supplierPrice = (select min(supplierPrice)
									 from supply
                                     where toyID = 5)

/*
suppliername, supplierprice
SuppToy, 12.5
*/

---

/* Q3 
which supplier gives on average the highest price over its supplied toys?
*/

select suppliername, avg(supplierPrice)
from supply s1
group by supplierName
having avg(supplierPrice) = (select max(avg)  from (select 
											avg(supplierPrice) as avg
											from supply s2
											group by supplierName
                                            ) as avgTable
										)
                                        
/*
suppliername, avg(supplierprice)
BringerToy, 15.25
*/

---

/* Q4
which toy is offered by the most by the suppliers
*/

select toyname
from toy natural join (select toyid 
	from supply
	group by toyid
	having count(*) = (select max(cnt) from ( select count(*) as cnt
										  from supply
                                          group by toyid )
                                          as cntTable
					)
                ) as selectedToys    
									
/*
toyname
toy1
toy2
toy3
toy4
toy5
toy6
toy7
toy8
toy9
toy10
toy11
toy12
*/

---

/* Q5
which toy has been selled the most?
*/

select distinct(toyname)
from toy
where toyid in ( select toyid
				 from revenues 
                 group by toyID
                 having sum(quantity) = ( select max(total) from ( select distinct(toyid),sum(quantity) as total
																	from revenues
                                                                    group by toyid) as totalTable
										)
				)

/*
toyname
toy2
*/

---

/* Q6
give the name and the price of the higest selled product on average
*/

select toyname,avgprice
from Toy natural join ( select distinct(toyid),avg(currprice) as avgprice
						from toystoreselling group by toyid
                        having avg(currPrice) = ( select max(avgprice) from ( select distinct(toyid), avg(currPrice) as avgprice
																			  from toystoreselling group by toyID) as avgprices
												)
						) as maxavg

/*
toyname, avgprice
toy6, 63.45000076293945
*/

---

/* Q7
of the products that are selled in at least 3 stores, what was the total
revenue from each product by ascending order
*/

select distinct(toyid), sum(total)
from ( select toyid, price*quantity as total
	   from revenues ) as toytotal
where toyid in ( select distinct(toyid)
				 from toystoreselling
                 group by toyid
                 having count(*) >= 3
                 )       
group by toyid
order by sum(total)

/*
toyid,totalRev
12	4207.000022888184
7	4288.800029754639
4	5322.999868392944
2	10429.599880218506
8	11819
3	12412.399744033813
9	17174.300080299377
*/

---

/* Q8
of the products that are selled in 2 stores at most, which product is 
of the highest selling price and which store sells it
*/

select toyname,storename
from store natural join toy natural join
(select storeID,toyid
from toystoreselling
where toyid in (select distinct(toyid) from toystoreselling
							 group by toyid having count(*) <= 2)
	  and
	  currprice >= all( select currprice from toystoreselling)
) as res

/*
toyname, storename
toy6, JoyToy
*/

---
/* Q9
give the address of the largest store in size
*/

select address
from store s1
where not exists (select * from store s2
				  where s1.storeID<>s2.storeID 
						and
                        s2.storeSize>s1.storeSize
				  )

/*
address
add5
*/

---

/* Q10
give the address of the store which sells the largest number of toys
*/

select address
from store
where storeID in ( select distinct(storeID)
				   from toystoreselling group by storeID
                   having count(*) = ( select max(cnt) from ( select count(*) as cnt
															  from toystoreselling
                                                              group by storeID
                                                              ) as res
									 )
					)

/*
address
add3
*/

---

/* Q11
of the toys ranges in their age from 5 to 19, where it available
*/

select storename,address
from store natural join
( select storeID
  from toystoreselling
  where toyid in ( select toyid from toy
				   where minAge>= 5 and maxAge<=19 )
		and inStock = 1
) as res

/*
storeName, address
FunToy	add1
GraceToy	add2
JoyToy	add3
GameToy	add4
*/

---

/* Q12
return all the toys whose range of prices is within 10-20
and deliverable
*/

select distinct(toyid)
from toystoreselling
where (currPrice >=10 and currPrice <=20) and deliverable = 1

/*
toyid
1
4
7
3
5
2
8
9
10
12
11
*/

---

/* Q13
from toys 1,7,9 which are available which toy has the lowest offering
price and where it selled and it what price
*/

select storename,toyname, currprice
from ( select storeid,toyid,currprice
		from toystoreselling
        where deliverable = 1 and (toyID=1 or toyid = 7 or toyid =9)
        and currprice= ( select min(currPrice)
							from toystoreselling
                            where deliverable = 1 and (toyID=1 or toyid = 7 or toyid =9)
						)
		) as res
natural join toy natural join store

/*
storename, toyname, currpeice
GingleToy, toy7, 11.3
*/

---
/* Q14
which store delivers the most items
*/

select storename,toyname, currprice
from ( select storeid,toyid,currprice
		from toystoreselling
        where deliverable = 1 and (toyID=1 or toyid = 7 or toyid =9)
        and currprice= ( select min(currPrice)
							from toystoreselling
                            where deliverable = 1 and (toyID=1 or toyid = 7 or toyid =9)
						)
		) as res
natural join toy natural join store

/*
storename
GraceToy
JoyToy
*/

---

/* Q15
for each store- what items are deliverable yet not in stock
*/

select storeid,toyid
from toystoreselling
where deliverable =1 and inStock = 0
order by storeid

/*
storeid, toyid
1	2
1	3
1	7
2	11
3	6
4	1
5	10
*/

/* Q16
average toy price in ages 5 to 30
*/

select avg(currprice)
from toystoreselling
where toyid in ( select toyid
				 from toy
                 where (minage>= 5 and maxage<=30)
				)

/*
avg(currprice)
37.55000019073486
*/

/* Q17
for each store present the toy with highest cost from the toys that
are available and its price.
*/

select storename, toyname,currprice 
from toystoreselling join
( select storeID, currPrice
  from ( select storeID,currPrice
		 from toystoreselling
         where (storeID, currPrice) in ( select distinct(storeID) as storeID,max(currPrice) as currPrice
						from toystoreselling
                        where inStock = 1
                        group by storeID
                        )
		) as res1
) as res2 using (storeid, currprice)
join toy using (toyid) join store using (storeid)

/*
storename, toyname, currprice
FunToy	toy12	26.4
GraceToy	toy8	45
JoyToy	toy12	47
GameToy	toy9	58
GingleToy	toy5	52
*/

---

/* Q18
which items violate the min condition of the network.
Give the stores, the items and the delta by descending order
*/

select storeid, toyid, minPrice - currPrice as delta
from toystoreselling join toynetworkinfo using (toyid)
where currprice<minprice
order by  minprice - currprice desc

/*
storeid, toyid, delta
2	12	6
3	8	5
3	2	3.6999998092651367
5	7	3.6999998092651367
3	9	2.6999998092651367
*/

---

/* Q19
from the toys who has reserve of bigger than 200 
what is the maximal difference between max pricing and min pricing
*/

select toyid, maxprice - minprice
from toynetworkinfo
where maxprice - minprice = ( select max(delta)
							  from ( select maxPrice - minPrice as delta
									 from toynetworkinfo 
                                     where reserve > 200
									) as res1
							)

/*
toyid , maxprice - minprice
9   43
*/

---

/* Q20
for each store give its average price of which it sells
*/

select distinct(storeid), avg(currprice)
from toystoreselling
group by storeID

/*
storeid, avg(currprice)
1	22.757142748151505
2	30.157142639160156
3	33.44999980926514
4	29.220000076293946
5	29.457143102373397
*/

---

/* Q21
which store grant highest profit. Use views
*/

select storeid, net
from netincomestores
where net = (select max(net) from netincomestores)

/*
storeid , net
3	29968.399725914
*/

---

/* Q22
display the store with highest rates to size ratio. Use views
*/

select storeid,r
from ratesToSizeRatio
where r >= all( select r from ratestosizeratio)

/*
storeID, r
2	2.4000
*/

---

/* Q23
which toy is selled with largest ratio profit. Use view
*/

select *
from percentageprofit
order by percentage desc
limit 1

/*
toyid, percentage
9	370.5882352941177
*/

---