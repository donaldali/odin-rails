-- NSS Tutorial

-- 1. The example shows the number who responded for: - question 1 
   -- - at 'Edinburgh Napier University' - studying '(8) Computer Science'
   -- Show the the percentage who STRONGLY AGREE
SELECT A_STRONGLY_AGREE
  FROM nss
 WHERE question='Q01'
   AND institution='Edinburgh Napier University'
   AND subject='(8) Computer Science';

-- 2. Show the institution and subject where the score is at least 100
   -- for question 15.
SELECT institution, subject
  FROM nss
  WHERE score >= 100
    AND question = 'Q15';

-- 3. Show the institution and score where the score for 
   -- '(8) Computer Science' is less than 50 for question 'Q15'
SELECT institution, score
  FROM nss
  WHERE subject = '(8) Computer Science'
    AND score < 50
    AND question = 'Q15';

-- 4. Show the subject and total number of students who responded to
   -- question 22 for each of the subjects '(8) Computer Science' and
   -- '(H) Creative Arts and Design'.
SELECT subject, SUM(response)
  FROM nss
  WHERE question='Q22'
    AND subject IN ('(8) Computer Science',
                    '(H) Creative Arts and Design')
  GROUP BY subject;

-- 5. Show the subject and total number of students who A_STRONGLY_AGREE
   -- to question 22 for each of the subjects '(8) Computer Science' and
   -- '(H) Creative Arts and Design'.
SELECT subject, SUM((A_STRONGLY_AGREE / 100) * response)
  FROM nss
  WHERE question='Q22'
    AND subject IN ('(8) Computer Science',
                    '(H) Creative Arts and Design')
  GROUP BY subject;

-- 6. Show the percentage of students who A_STRONGLY_AGREE to question 22
   -- for the subject '(8) Computer Science' show the same figure for the
   -- subject '(H) Creative Arts and Design'.
   -- Use the ROUND function to show the percentage without decimal places.
SELECT subject, ROUND(SUM(A_STRONGLY_AGREE * response) / SUM(response))
  FROM nss
  WHERE question='Q22'
    AND subject IN ('(8) Computer Science',
                    '(H) Creative Arts and Design')
  GROUP BY subject;

-- 7. Show the average scores for question 'Q22' for each institution that
   -- include 'Manchester' in the name. Give your answer rounded to the
   -- nearest whole number.
SELECT institution, ROUND(SUM(score * response) / SUM(response))
  FROM nss
  WHERE question='Q22'
    AND institution LIKE '%Manchester%'
  GROUP BY institution;

-- 8. Show the institution, the total sample size and the number of
   -- computing students for institutions in Manchester for 'Q01'.
SELECT institution, SUM(sample) AS sample_size, 
    SUM(CASE WHEN subject = '(8) Computer Science' THEN sample ELSE 0 END) AS CS_students
  FROM nss
  WHERE institution LIKE '%Manchester%'
    AND question='Q01'
  GROUP BY institution;
