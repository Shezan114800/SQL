
CREATE DATABASE StudentManagementSystem

CREATE DATABASE ProductInformationSystem

ALTER DATABASE StudentManagementSystem MODIFY NAME = StudentInformationSystem

EXECUTE sp_renamedb 'StudentInformationSystem','StudentManagementSystem'

ALTER DATABASE ProductInformationSystem MODIFY NAME = ProductInfoSystem


DROP DATABASE StudentManagementSystem

DROP DATABASE ProductInfoSystem
