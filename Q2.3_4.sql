-- When considering total number of items purchased from receipts with 'rewardsReceiptStatus’ 
-- of ‘Accepted’ or ‘Rejected’, which is greater?

select rewardsReceiptStatus, round( avg(totalSpent), 2 ) as Average_Spend, sum(purchasedItemCount) as Total_items_purchased
from receipts 
where rewardsReceiptStatus in ('FINISHED','REJECTED')
group by rewardsReceiptStatus;

-- When considering the average spend of finished and rejected receipts, there was approximately $60 higher spend by the finished receipts, at $80.85, and $20.33 by the rejected receipts.
-- When considering the number of iteems purchased of finished and rejected receipts, there were 8184 items purchased by finished receipts, while the rejected receipts only had an aggregate of 173 items in their scanned receipts