--TABLE Party (Name char(10), City char(10), Department char(10), Age tinyint, Gender char(1), Transport char(10), Food char(10), Drink1 char(10), Drink2 char(10));


1 .שלוף את שמותיהם בלבד של מי שאישר הגעה למסיבה – כלומר כל מי שצוין בטבלה

SELECT Name
FROM party;

2 .שלוף את שמותיהם וגילם של כל מי שעדכן באיזה אמצעי תחבורה יגיע

SELECT Name, Age
FROM party
WHERE Transport is not null;

3 .אתר את כל פרטי האנשים שמגיעים מנתניה

SELECT * FROM party
WHERE City = 'Netanya';

4 .אתר את פרטי כל מי שמגיע במונית או ברכבת

SELECT * FROM party
WHERE Transport IN ('taxi', 'train');

5 .אתר את פרטי כל הגברים במסיבה

SELECT * FROM party
WHERE Gender = 'M'; ;

6 .אתר את כל פרטי שלושת המבוגרים ביותר במסיבה

SELECT * FROM party
ORDER BY Age DESC
LIMIT  3;
--=============
SELECT TOP 3 *
FROM party
ORDER BY Age DESC;

7 .אתר את כל פרטי מי שמגיע למסיבה ואינו ממחלקת מכירות

SELECT * FROM party
WHERE Department != 'sales';

8 .אתר את גילו ושמו של מי שלא מסר אם הוא בעניין של ארוחה בשרית או חלבית

SELECT Age, Name
FROM party
WHERE Food NOT IN ( 'meat' , 'dairy');

9 .אתר שם, גיל ומין של מי שלא ידוע איך הוא מתכונן להגיע למסיבה

SELECT Name, Age, Gender
FROM party
WHERE Transport IS NULL;

10 .אתר את מחלקתו ושמו של מי שמעוניין לשתות יין או וודקה או שלא מילא אחת מהעמודות של
שתיה בטבלה.

SELECT Department, Name
FROM party
WHERE Drink1 IS NULL
	OR Drink2 IS NULL
	OR Drink1 IN ('Wine', 'Vodka')
	OR Drink2 IN ('Wine', 'Vodka');

====
** אתר את מחלקתו ושמו של מי שמעוניין לשתות יין או וודקה או שלא מילא אף אחת מהעמודות
של שתיה בטבלה (כלומר לא בחר שום שתיה

SELECT Department, Name
FROM party
WHERE Drink1 IS NULL 
	AND Drink2 IS NULL
	OR Drink1 IN('Wine', 'Vodka')
	OR Drink2 IN('Wine', 'Vodka');

11 .אתר את שמו, ארוחתו, מחלקתו וגילו של מי ששותה בירה

SELECT Name, Food, Department, Age
FROM party
WHERE Drink1 = 'Beer' 
	OR Drink2 = 'Beer';

12 .אתר את שמו וגילו של כל מי ששותה וודקה או מים או פפסי

SELECT Name, Age
FROM party
WHERE Drink1 IN('Vodka','Water','Pepsi')
 OR Drink2 in('Vodka', 'Water', 'Pepsi');

13 .אתר את מינו של מי ששותה בירה ופפסי יחד

SELECT Department, Name , *
FROM party
WHERE Drink1 = 'Pepsi' 
	AND drink2 = 'Beer'
	OR Drink1 = 'Beer' 
	AND drink2 = 'Pepsi';

14 .אתר את שמו ועיר מגוריו של כל מי שדיווח מה הוא רוצה לשתות בשתי העמודות

SELECT Name, City
FROM party
WHERE Drink1 IS NOT NULL 
	AND Drink2 IS NOT NULL;

15 .מיין את הטבלה בסדר עולה לפי גיל המשתתפים

SELECT * FROM party
ORDER BY Age ASC;

16 .מנה את שם המשתתפים והמשקאות שהזמינו עבור כל אלו שמוצאם בעיר שבה האות A

SELECT Name, Drink1, Drink2
FROM party
WHERE City like('%a%');

17. שלוף את כל מי ששמו מסתיים באות I באנגלית כמו האות הפותחת במילה (INDIA)

SELECT * FROM party
WHERE Name like('%i');

18 .מנה את גילו של כל מי שמגיע ממחלקת מכירות והזמין לאכול בשרי

SELECT Age
FROM party
WHERE Department = 'sales' AND Food = 'meat';

19 .שלוף את המשקאות עבור כל מי שאינו ממחלקת הנהלה

SELECT Drink1, Drink2
FROM party
WHERE Department != 'management';

20. שלוף את שם המשתתף ומחלקתו של כל מי שהוא מעל גיל 30

SELECT Name, Department
FROM party
WHERE Age > 30;

21 .שלוף את שמו של כל מי שהוא מתחת לגיל 60 ומגיע ברכב או ברכבת

SELECT Name
FROM party
WHERE Age < 60 and Transport IN ('Car', 'train');

22 .ערוך את הטבלה בסדר חדש לפי שם העיר ממנה מגיעים המשתתפים בסדר עולה

SELECT * FROM party
ORDER BY City ASC;

23 .מנה את המשקה שהזמין מי שלא דיווח איך יגיע ולא דיווח גם מה ירצה לאכול

SELECT Drink1, Drink2
FROM party
WHERE Transport IS NULL AND Food IS NULL;

24 .שלוף את אמצעי התחבורה והגיל של כל מי שלא נתן דיווח לגבי הארוחה הרצויה

SELECT Transport, Age
FROM party
WHERE Food IS NULL;

25 .שלוף את המזון , המשקה השם והגיל של כל מי שאינו ממחלקת הנהלה או מכירות

SELECT Food, Drink1, Drink2 , Name , Age
FROM party
WHERE Department NOT IN('management', 'sales');

26 .שלוף את סוג המשקה והארוחה של כל מי ששמו או דודי או מירב

SELECT Food, Drink1, Drink2
FROM party
WHERE Name IN ('Dudi', 'Merav');

27 .שלוף את שם מי שהיא ממין נקבה וגם בין הגילאים 20-40

SELECT Name
FROM party
WHERE Gender = 'F' 
	AND Age BETWEEN 20 AND 40 ;

28 .שלוף את שם מי שהוא מעל גיל 18 ושייך למחלקת מכירות ומעוניין לשתות מים במסיבה
SELECT Name
FROM party
WHERE Age > 18 
	AND Department = 'sales' 
	AND (Drink1 = 'water' or Drink2 = 'water');

29 .שלוף את שמות כל הנשים שמגיעות בכל אמצעי למעט אופנוע

SELECT Name
FROM party
WHERE Gender = 'F' AND Transport != 'bike';

30.שלוף את משקאותיו , ארוחתו ושמו של כל מי שאינו מגיע מרמלה או גדרה או חולון

SELECT Drink1 ,Drink2 ,Food ,Name
FROM party
WHERE City NOT IN ('Ramla', 'Gedera', 'Holon');

31 .שלוף את שם עירו של מי שהוא מעל גיל 40 ,שאינו ממחלקת ההנהלה, ששמו מתחיל באות D
SELECT City
FROM party
WHERE Age > 40 and Department != 'management' AND Name LIKE'D%';
