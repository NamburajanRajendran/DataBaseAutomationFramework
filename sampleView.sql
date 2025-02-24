CREATE VIEW CUSTOMER_MORE_ORDERS (CUST_NAME, EMAIL, PHONE, TOTAL_ORDERS)
AS select cs.name CUST_NAME,ct.email,CT.PHONE,COUNT(ORD.ORDER_ID) TOTAL_ORDERS from customers cs,contacts ct ,ORDERS ORD
where ct.customer_id=cs.customer_id AND CS.customer_id=ORD.customer_id
GROUP BY cs.name,ct.email,CT.PHONE
HAVING COUNT(ORD.ORDER_ID)>1;