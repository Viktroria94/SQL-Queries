1 .מצא את מס' הקוד של המטוסים בחברה שיכולים להוביל מעל 420 נוסעים )כיסאות( וכנה את העמודה בשם AIRCRAFTS BIG
select Code as "BIG AIRCRAFT"
   from Aircraft
   where seat>420;

2 .מצא את סכום המשכורות שמשולמים לטייסים הקרואטים, לא כולל טייסים שהשכר שלהם נמוך או שווה ל-20000( דולר(
select sum(salary)
   from Employees 
   where Nationality='Croatia'
   and Salary>20000;

3 .מצא את שמות המשפחה והשמות הפרטיים של הטייסים שעובדים על הקווים הבאים: לונדון, רומא, איסטנבול
select E.L_name,E.F_name
   from Employees as E inner join Flights as F
   on E.Employee_id=F.Employee_id
   where F.Destination in('London','Rome','Istanbul');

4 .מחק לכל המטוסים מסוג AIRBUS את המטען המותר לטובת ערך ריק בטבלה )ללא מודל: A380)
update Aircraft
   set Cargo=null
   where Model<>'A380';

5 .מצא את ממוצע המשכורות של כלל הטייסים שטסים על מטוסים שמספרם נע בין 345-320( לא כולל(
select avg(E.Salary)
    from Employees as E inner join Flights as F
    on E.Employee_id=F.Employee_id
    where F.AC_Code between 321 and 344;

6 .מצא מהי המשכורת הגבוהה ביותר של כל הטייסים שמספרם האישי )id_Employee )הוא 145 או 16 או 11 או 57
select max(salary)
    from Employees
    where Employee_id in(145,16,11,57);

7 .מצא לאילו יעדים טסים הטייסים הוותיקים ביותר בחברה )10 > seniority)
select distinct(F.Destination)
   from Employees as E inner join  Flights as F
   on E.Employee_id=F.Employee_id
   where E.Seniority>10;

8 .מצא את מס' הכיסאות שקיימים במטוס בואינג ממודול 767
select Seats
    from Aircraft
    where Manufactory='Boeing' and Model=767;

9 .סדר את טבלת הטיסות לפי יעד בסדר אלפביתי עולה וסידור משני לפי מס' הטיסה יורד )ללא טיסות היוצאות ליעדים: סופיה או קייב(
select *
   from Flights
   where Destination not in('Sofia','kiev')
   order by Destination,Flight_No desc; 

10 .מצא את שמותיהם הפרטיים של הטייסים שלא הוגדר להם וותק )SENIORITY)
select F_name
     from Employees
     where Seniority is null;

11 .עדכן ברשימת הטיסות מחדש את העיר ת"א לטובת ת"א-יפו
update Flights
     set Destination='TLV_J'
     where Destination='TLV';

12 .שלוף את כלל המידע של הטייסים ואם הם גם פעילים בטיסות בהווה, ציין את מס' הטיסה שהם אחראים עליה
select E.*,F.Flight_No
     from Employees as E left join Flights as F
     on  Employee_id=F.Employee_id;
