-- 코드를 입력하세요
SELECT I.FLAVOR
FROM FIRST_HALF H JOIN ICECREAM_INFO I
ON I.FLAVOR = H.FLAVOR
WHERE H.TOTAL_ORDER > '3000' AND I.INGREDIENT_TYPE = 'fruit_based';