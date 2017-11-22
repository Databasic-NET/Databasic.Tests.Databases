@set dbName=databasic_demo_mlm.db
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
@SQLiteImporter.exe %currentDir%\01-dbd-mlm-structure.sql %parentDir%\%dbName%
@SQLiteImporter.exe %currentDir%\02-dbd-mlm-data-dealers.sql %parentDir%\%dbName%
@SQLiteImporter.exe %currentDir%\03-dbd-mlm-data-clients.sql %parentDir%\%dbName%
@SQLiteImporter.exe %currentDir%\04-dbd-mlm-data-orders.sql %parentDir%\%dbName%
@SQLiteImporter.exe %currentDir%\05-dbd-mlm-indexes.sql %parentDir%\%dbName%
@cd %currentDir%
@pause