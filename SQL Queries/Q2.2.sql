-- How does the ranking of the top 5 brands by receipts scanned for the 
-- recent month compare to the ranking for the previous month?

select brandCode as Brand, count(brandCode) as Receipts_Scanned from 
(
	select ri.brandCode, r.dateScanned 
    from receipts as r 
    inner join receipt_items as ri 
    on r.receiptId = ri.receiptId
) as j 
where month(dateScanned) = (
	select	case
				when month(max(dateScanned)) = 1 then 12
				else month(max(dateScanned)) - 1
			end
	from receipts
)
group by brandCode
order by Receipts_Scanned desc
limit 5;

-- Only two distinct brands, "BRAND" and "VIVA" ranked the top on the month before the most recent month scanned. 
-- There were 3 and 1 receipts scanned respectively for each of these brands. 