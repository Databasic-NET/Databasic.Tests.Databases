@set dbName=databasic_demo_company.db
@set currentDir=%cd%
@cd ..
@set parentDir=%cd%
@cd ../sqlite_importer_source_files
@if not exist SQLiteImporter.exe (
    @call build.bat
)
@if exist %parentDir%\%dbName% (
    @del /Q /F %parentDir%\%dbName%
)
@copy %currentDir%\%dbName% %parentDir%\%dbName% >nul
@SQLiteImporter.exe %currentDir%\01-dbd-company-structure.sql %parentDir%\%dbName%
@SQLiteImporter.exe %currentDir%\02-dbd-company-data-attendance.sql %parentDir%\%dbName%
@SQLiteImporter.exe %currentDir%\03-dbd-company-data-contacts.sql %parentDir%\%dbName%
@SQLiteImporter.exe %currentDir%\04-dbd-company-data-contacts_categories.sql %parentDir%\%dbName%
@SQLiteImporter.exe %currentDir%\05-dbd-company-data-departments.sql %parentDir%\%dbName%
@SQLiteImporter.exe %currentDir%\06-dbd-company-data-persons.sql %parentDir%\%dbName%
@SQLiteImporter.exe %currentDir%\07-dbd-company-indexes.sql %parentDir%\%dbName%
@cd %currentDir%
@pause