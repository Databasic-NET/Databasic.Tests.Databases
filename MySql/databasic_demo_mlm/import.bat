:: ======================================================================================
::
:: leave it blank if you have mysql in PATH system variable:
@set mysqlPath=
:: mysql user name:
@set mysqlUser=root
:: mysql password:
@set mysqlPass=
:: mysql imported database name:
@set databaseName=databasic_demo_mlm
::
:: ======================================================================================

@set currentDir=%CD%
@cd %mysqlPath%

mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" -e "DROP DATABASE IF EXISTS %databaseName%;"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" -e "CREATE DATABASE IF NOT EXISTS `%databaseName%` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/01-dbd-mlm-structure.sql"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/02-dbd-mlm-data-clients.sql"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/03-dbd-mlm-data-dealers.sql"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/04-dbd-mlm-data-orders.sql"
mysql.exe --user="%mysqlUser%" --password="%mysqlPass%" --database="%databaseName%" <"%currentDir%/05-dbd-mlm-indexes.sql"

@cd %currentDir%
@pause