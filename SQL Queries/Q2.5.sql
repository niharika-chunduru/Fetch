-- Which brand has the most spend among users who were created within the past 6 months?

select brandCode as Brand, round(sum(finalPrice), 2) as Brand_Spend
from (
	select ri.brandCode, ri.finalPrice, u.createdDate from 
    receipts r join receipt_items ri join users u
    where r.receiptId = ri.receiptId
    and r.userId = u.userId
) as j
where month(createdDate) >= (select month(max(createdDate)) from users)-6
group by brandCode
order by Brand_Spend desc
limit 1;

--  The brand "BEN AND JERRYS" had the highest spend at $1300.20 among users who were created within the past 6 months.