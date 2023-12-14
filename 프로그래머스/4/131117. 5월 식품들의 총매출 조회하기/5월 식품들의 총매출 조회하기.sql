-- FOOD_PRODUCT: 식품 정보
-- FOOD_ORDER: 식품 주문 정보
-- 생산일자 22년 5월의 식품 아이디, 이름, 총매출 조회

SELECT 
    P.PRODUCT_ID,
    P.PRODUCT_NAME,
    P.PRICE * SUM(O.AMOUNT) AS TOTAL_SALES
FROM 
    FOOD_PRODUCT P
JOIN 
    FOOD_ORDER O ON P.PRODUCT_ID = O.PRODUCT_ID
WHERE 
    TO_CHAR(O.PRODUCE_DATE, 'YYYYMM') = '202205' -- 'YYYYMM' 형식으로 연월을 비교
GROUP BY 
    P.PRODUCT_ID, P.PRODUCT_NAME, P.PRICE
ORDER BY 
    TOTAL_SALES DESC, P.PRODUCT_ID ASC;
