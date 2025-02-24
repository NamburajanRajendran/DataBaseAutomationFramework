--SAMPLE INSERT QUERY FOR TESTCASE TABLE
INSERT
    INTO testcase_dataload (
        test_case_name,
        test_case_description,
        passed_description,
        failed_description,
        test_script,
        is_tc_enabled,
        test_group
    )
VALUES ('VERIFY_VIEW_CUSTOMER_MORE_ORDERS',
'TEST CASE TO VALIDATE VIEW DISPLAYS ONLY CUTOMERS WITH MORE THAN ONE ORDERS'
,'CUTOMERS WITH MORE THAN ONE ORDERS GETTING DISPLAYED IN THE VIEW',
'ONE OR MORE RECORDS IN THE VIEW HAS CUTOMERS WITH LESS THAN OR EQUAL TO ONE ORDERS',
TO_CLOB('SELECT FLAG,COUNT(*) FROM (SELECT CASE WHEN COUNT(*)=0 THEN ''TRUE'' ELSE ''FALSE'' END FLAG FROM (select cs.name CUST_NAME,ct.email,CT.PHONE,COUNT(ORD.ORDER_ID) TOTAL_ORDERS from customers cs,contacts ct ,ORDERS ORD where ct.customer_id=cs.customer_id AND CS.customer_id=ORD.customer_id GROUP BY cs.name,ct.email,CT.PHONE HAVING COUNT(ORD.ORDER_ID)>1 MINUS SELECT * FROM CUSTOMER_MORE_ORDERS)) group by FLAG'),
'Y',
'CUSTOMER_RELATED'
);