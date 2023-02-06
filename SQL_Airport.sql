--TABLE1 Employees: Employee_id int, F_name varchar (50), L_name varchar (50), Seniority int, Salary int, Nationality varchar (50)
--TABLE2 Aircrafts: Code int , Manufacture varchar (50), Model int, Type varchar (50), Seatsint varchar (50), Cargo int
--TABLE3 Flights: Flight_No int, Destination varchar (50), Employee_id int, AC_Code int, Connection varchar (50), Price int


1 .מצא את מס' הקוד של המטוסים בחברה שיכולים להוביל מעל 420 נוסעים )כיסאות( וכנה את העמודה בשם AIRCRAFTS BIG

   SELECT Code as "BIG AIRCRAFT"
   FROM Aircraft
   WHERE seat > 420;

2 .מצא את סכום המשכורות שמשולמים לטייסים הקרואטים, לא כולל טייסים שהשכר שלהם נמוך או שווה ל-20000( דולר(

   SELECTsum(salary)
   FROM Employees 
   WHERE Nationality='Croatia'
   AND Salary > 20000;

3 .מצא את שמות המשפחה והשמות הפרטיים של הטייסים שעובדים על הקווים הבאים: לונדון, רומא, איסטנבול
  
   SELECT E.L_name,E.F_name
   FROM Employees AS E INNER JOIN Flights AS F
   ON E.Employee_id=F.Employee_id
   WHERE F.Destination in('London','Rome','Istanbul');

4 .מחק לכל המטוסים מסוג AIRBUS את המטען המותר לטובת ערך ריק בטבלה )ללא מודל: A380)
   
   UPDATE Aircraft
   SET Cargo=null
   WHERE Model<>'A380';

5 .מצא את ממוצע המשכורות של כלל הטייסים שטסים על מטוסים שמספרם נע בין 345-320( לא כולל(
   
    SELECT AVG(E.Salary)
    FROM Employees AS E INNER JOIN Flights AS F
    ON E.Employee_id=F.Employee_id
    WHERE F.AC_Code BETWEEN 321 AND 344;

6 .מצא מהי המשכורת הגבוהה ביותר של כל הטייסים שמספרם האישי )id_Employee )הוא 145 או 16 או 11 או 57
    
    SELECT MAX(salary)
    FROM Employees
    WHERE Employee_id IN(145,16,11,57);

7 .מצא לאילו יעדים טסים הטייסים הוותיקים ביותר בחברה )10 > seniority)
   
   SELECT DISTINCT(F.Destination)
   FROM Employees AS E INNER JOIN  Flights AS F
   ON E.Employee_id=F.Employee_id
   WHERE E.Seniority>10;

8 .מצא את מס' הכיסאות שקיימים במטוס בואינג ממודול 767

    SELECT Seats
    FROM Aircraft
    WHERE Manufactory='Boeing' AND Model=767;

9 .סדר את טבלת הטיסות לפי יעד בסדר אלפביתי עולה וסידור משני לפי מס' הטיסה יורד )ללא טיסות היוצאות ליעדים: סופיה או קייב(

   SELECT * FROM Flights
   WHERE Destination NOT IN('Sofia','kiev')
   ORDER BY Destination,Flight_No DESC; 

10 .מצא את שמותיהם הפרטיים של הטייסים שלא הוגדר להם וותק )SENIORITY)

     SELECT F_name
     FROM Employees
     WHERE Seniority IS NULL;

11 .עדכן ברשימת הטיסות מחדש את העיר ת"א לטובת ת"א-יפו

     UPDATE Flights
     SET Destination='TLV_J'
     WHERE Destination='TLV';

12 .שלוף את כלל המידע של הטייסים ואם הם גם פעילים בטיסות בהווה, ציין את מס' הטיסה שהם אחראים עליה

     SELECT E.*,F.Flight_No
     FROM Employees AS E LEFT JOIN Flights AS F
     ON Employee_id=F.Employee_id;
