-- 1. Create a table BTech_2nd with attribute E_no, Year, Sec, C_Roll, Name, DOB having E_no as Primary key using constraint.

CREATE TABLE BTech_2nd (
    E_no int(20) NOT NULL PRIMARY KEY,
    Year varchar(20),
    Sec char(20),
    C_Roll int (20),
    Name char(20),
    DOB varchar(20)
);

-- 2. Add the columns Mob_No, DOA(date of admission) to the 1st table.

ALTER TABLE BTech_2nd 
ADD (
    Mob_No int(11),
    DOA varchar(20)
);

-- 3. Create an empty table BTech_3rd from the above existing table.

CREATE TABLE BTech_3rd AS
SELECT *FROM BTech_2nd;

-- 4. Drop the columns Mob_No, DOA(date of admission) to the 2nd table.

ALTER TABLE BTech_3rd
DROP COLUMN Mob_No,
DROP COLUMN DOA;

-- 5. Make C_roll and DOA as not null in the 1st table.

ALTER TABLE BTech_2nd
MODIFY C_Roll int(20) NOT NULL, 
MODIFY DOA varchar(20) NOT NULL;

-- 6. Change the length of the Year and Name attribute in the 2nd table.

ALTER TABLE BTech_3rd
MODIFY Year varchar(30),
MODIFY Name char(30);