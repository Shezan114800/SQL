--Droping Primary Key

ALTER TABLE Students
DROP CONSTRAINT PK__Students__32C52B99875FA24A

--Adding Composite Key

ALTER TABLE Students
ADD CONSTRAINT PK__StudentsId__StudentsName PRIMARY KEY(StudentId,StudentName)

--Droping Composite Key

ALTER TABLE Students
DROP CONSTRAINT PK__StudentsId__StudentsName

--Adding Primary Key to StudentId

ALTER TABLE Students
ADD CONSTRAINT PK__StudentsId PRIMARY KEY(StudentId)

--Adding Foreign Key to ClassId in Students Table

ALTER TABLE Students
ADD ClassId INT CONSTRAINT FK__Class__Students__ClassId FOREIGN KEY REFERENCES Classes(ID)

--Define TeacherId as Foreign Key in Classes Table

ALTER TABLE Classes
ADD CONSTRAINT FK__Class__Teacher__TeacherId FOREIGN KEY (TeacherId) REFERENCES ClassTeacher(ID)

--Adding & Droping Column

ALTER TABLE Classes
ADD ClassLocation NVARCHAR(30)

ALTER TABLE Classes
ALTER COLUMN ClassLocation INT

ALTER TABLE Classes
DROP COLUMN ClassLocation
