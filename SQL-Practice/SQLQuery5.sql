USE StudentManagementSystem

---Student ID Display

SELECT * FROM Students WHERE StudentId = 3

---Update Student Age based on Student ID

UPDATE Students
SET Age = 40
WHERE StudentId = 2

UPDATE Students
SET StudentName = 'Bashar Naim'
WHERE StudentId = 2

---Update name of the student where Student ID is 3

UPDATE Students
SET StudentName = 'Mustakim'
WHERE StudentId = 3


DELETE FROM Students WHERE StudentId = 3

---Delete a row of the student where Student ID is 2

DELETE FROM Students WHERE StudentId = 2