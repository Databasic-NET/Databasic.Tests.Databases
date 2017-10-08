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
@echo *             Databasic Demo MLM Database Import                *
@echo *                                                               *
@echo *****************************************************************
@echo.

sqlcmd.exe -S %mssqlServer% -i %currentDir%/01-dbd-mlm-structure.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/02-dbd-mlm-data-Dealers.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/03-dbd-mlm-data-Clients.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/04-dbd-mlm-data-Orders.sql
sqlcmd.exe -S %mssqlServer% -i %currentDir%/05-dbd-mlm-data-indexes.sql

@echo.
@echo All data imported.
@echo.

@cd %currentDir%
@pause