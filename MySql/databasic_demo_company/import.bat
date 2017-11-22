:: ======================================================================================
::
:: leave it blank if you have mysql in PATH system variable:
@set mysqlPath=
:: mysql user name:
@set mysqlUser=root
:: mysql password:
@set mysqlPass=
:: mysql imported database name:
@set databaseName=databasic_demo_company
::
:: ======================================================================================

@set currentDir=%CD%
@cd %mysqlPath%

mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" -e "DROP DATABASE IF EXISTS %databaseName%;"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" -e "CREATE DATABASE IF NOT EXISTS `%databaseName%` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/01-dbd-company-structure.sql"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/02-dbd-company-data-attendance.sql"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/03-dbd-company-data-contacts.sql"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/04-dbd-company-data-contacts_categories.sql"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/05-dbd-company-data-departments.sql"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/06-dbd-company-data-persons.sql"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/07-dbd-company-indexes.sql"

@cd %currentDir%
@pause