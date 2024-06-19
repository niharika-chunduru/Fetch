-- What are the top 5 brands by receipts scanned for most recent month?

select brandCode as Brand, count(brandCode) as Receipts_Scanned from 
(
	select ri.brandCode, r.dateScanned 
    from receipts as r 
    inner join receipt_items as ri 
    on r.receiptId = ri.receiptId
) as j 
where month(dateScanned) = (select month(max(dateScanned)) from receipts) 
group by brandCode
order by Receipts_Scanned desc
limit 5;

-- Due to the filtration of null entries during preprocessing, this query returned an empty result for the most recent month.