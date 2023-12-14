-- MEMBER_PROFILE: 고객 정보
-- REST_REVIEW: 식당 리뷰 정보

-- 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회
-- 회원 이름(MEMBER_NAME), 리뷰텍스트(REVIEW_TEXT), 리뷰 작성일(REVIEW_DATE)로 컬럼을 설정
-- 리뷰 작성일 기준 ASC, 리뷰 텍스트 기준 ASC

-- 가장 리뷰를 많이 작성한 고객을 추출하고 리뷰를 가장 많이 작성한 고객의 REVIEW_DATE와 REVIEW_TEXT를 조회
WITH MOST_REVIEW AS (
    SELECT 
        MEMBER_ID,
        COUNT(*) AS REVIEW_CNT
    FROM REST_REVIEW
    GROUP BY MEMBER_ID
)
SELECT 
    MEM.MEMBER_NAME,
    REST.REVIEW_TEXT,
    TO_CHAR(REST.REVIEW_DATE, 'YYYY-MM-DD') AS REVIEW_DATE
FROM MEMBER_PROFILE MEM
JOIN REST_REVIEW REST ON MEM.MEMBER_ID = REST.MEMBER_ID
JOIN MOST_REVIEW MOST ON MEM.MEMBER_ID = MOST.MEMBER_ID
WHERE REVIEW_CNT = (SELECT MAX(REVIEW_CNT) FROM MOST_REVIEW)
ORDER BY REST.REVIEW_DATE ASC, REST.REVIEW_TEXT ASC;