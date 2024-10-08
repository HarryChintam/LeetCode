# Write your MySQL query statement below
select seat_id from 
(select seat_id, free, LAG(free,1) over(order by seat_id) as free_lag,
lead(free, 1) over(order by seat_id) as free_lead
from cinema) as pre_final
where (free_lag =1  and free =1) OR (free_lead =1 and free =1)
order by seat_id