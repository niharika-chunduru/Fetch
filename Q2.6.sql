-- Which brand has the most transactions among users who were created within the past 6 months?

select brandCode as Brand, count(brandCode) as Num_Transactions
from (
	select ri.brandCode, u.createdDate from 
    receipts r join receipt_items ri join users u
    where r.receiptId = ri.receiptId
    and r.userId = u.userId
) as j
where month(createdDate) >= (select month(max(createdDate)) from users)-6
group by brandCode
order by Num_Transactions desc
limit 1;

--  The brand "HY-VEE" had the most transactions at 153 among users who were created within the past 6 months.