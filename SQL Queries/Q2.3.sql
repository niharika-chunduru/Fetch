-- When considering average spend from receipts with 'rewardsReceiptStatus’ 
-- of ‘Accepted’ or ‘Rejected’, which is greater?

select rewardsReceiptStatus, round( avg(totalSpent), 2 ) as Average_Spend 
from receipts 
where rewardsReceiptStatus in ('FINISHED','REJECTED')
group by rewardsReceiptStatus;