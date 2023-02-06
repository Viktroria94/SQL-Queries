1.שלוף את שמות התלמידים ועליות הקורסים שאליהם הם רשומים.

 SELECT S.Student, A.Activity
   FROM Students AS S inner join Activities AS A
   ON S.Id = A.ID;
---------------------------------------------------
2. שלוף את המחיר הכולל של קורסים אליהם נרשם מארק אנטוני.
SELECT SUM(A.Cost)
    FROM Students AS S INNER JOIN Activities AS A
   ON S.Id = A.ID
   WHERE S.Student = 'Mark Antony';
--------------------------------------------------
3.שלוף את ממוצע העלות ששילם משתמש 084 עבור הקורסים אליהם נרשם.

 SELECT AVG(Cost)
   FROM Activities
   WHERE ID = 084;
-------------------------------------------------
4.שלוף את כל שמות הפעילות ועבור אלו שרשומים עברם תלמידים הצג את שמות התלמידים בשליפה סדר את הרשימה לפי עלות הפעילות בסדר עולה.

 SELECT A.Activity,S.Student
   FROM Activities AS a LEFT JOIN Students AS S
   ON A.ID= S.Id
   ORDER BY A.Cost;
-------------------------------------------------
5.שלוף את הפעילות היקרה ביותר ואת שמות התלמידים הרשומים אליה.

 SELECT S.Student, A.Cost
   FROM Students AS S INNER JOIN Activities AS A
   ON S.Id = A.ID
   WHERE A.Cost = (select MAX(Cost)
                              FROM Activities);
-------------------------------------------------
6. עדכון עליית מחירים לכלל הקורסים בגובה 12$ (לא כולל טניס או גולף).
UPDATE Activities
   SET Cost = Cost + 12
   WHERE Activity NOT IN ('Tennis','Golf');
-------------------------------------------------
7.שלוף את המחיר המקסימלי שמשולם עבור שחייה וכנה את העמודה בשם "מחיר מיוחד".

 SELECT MAX (Cost) AS 'Special price'
   FROM Activities
   WHERE Activity = 'Swimming';
-------------------------------------------------
8. שלוף את כל הפריטים של הפעילות שמתחילים באות S ושהעלות שלהם נמוכה מ- 35$ סדר את הרשימה לפי עלות בסדר עולה.
SELECT * FROM Activities
   WHERE Activity LIKE 'S%'
   AND Cost < '$35'
   ORDER BY cost;
