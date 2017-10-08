:: ======================================================================================
::
:: leave it blank if you have MS SQL Server 'Binn' directory in PATH system variable:
@set mssqlPath=
:: mssql server address (COMPUTER\INSTANCE):
@set mssqlServer=.\SQLEXPRESS
::
:: ======================================================================================

@set currentDir=%CD%
@cd %mssqlPath%

@cls
@echo *****************************************************************
@echo *                                                               *
@echo *           Databasic Demo Company Database Import              *
@echo *                                                               *
@echo *****************************************************************
@echo.

sqlcmd.exe -S %mssqlServer% -i %currentDir%/01-dbd-company-structure.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/02-dbd-company-data-Attendance.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/03-dbd-company-data-Contacts.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/04-dbd-company-data-ContactsCategories.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/05-dbd-company-data-Departments.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/05-dbd-company-data-Departments.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/06-dbd-company-data-Persons.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/07-dbd-company-data-indexes.sql

@echo.
@echo All data imported.
@echo.

@cd %currentDir%
@pause