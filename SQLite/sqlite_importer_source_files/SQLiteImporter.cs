using System;
using System.IO;
using Databasic;
using Desharp;

public class SQLiteImporter {
	static void Main(string[] args) {

		Databasic.Events.Error += SQLiteImporter.onDbError;

		string content = "";
		try {
			Console.Clear();

			string currentDir = Path.GetDirectoryName(
				System.Diagnostics.Process.GetCurrentProcess().MainModule.FileName.Replace("\\", "/")
			).TrimEnd('/').Replace("\\", "/");

			if (args.Length != 2) {
				Console.WriteLine("Wrong arguments. Call:");
				Console.WriteLine("SQLiteImporter.exe ./path/to/script.sql ./path/to/database.db");
				Console.ReadLine();
				return;
			}

			string scriptPath = args[0];
			string dbPath = args[1];
			if (!File.Exists(scriptPath)) scriptPath = Path.Combine(currentDir, scriptPath);
			if (!File.Exists(dbPath)) dbPath = Path.Combine(currentDir, dbPath);

			if (!File.Exists(scriptPath)) {
				Console.WriteLine("SQL script not found:");
				Console.WriteLine(args[0]);
				Console.ReadLine();
				return;
			} else {
				scriptPath = scriptPath.Replace("\\", "/");
			}

			if (!File.Exists(dbPath)) {
				Console.WriteLine("Database file not found:");
				Console.WriteLine(args[1]);
				Console.ReadLine();
				return;
			} else {
				dbPath = dbPath.Replace("\\", "/");
			}

			Databasic.Connection.RegisterConfigRecord(
				"db", "Data Source=" + dbPath + ";Version=3;", "System.Data.SQLite"
			);
			Console.WriteLine(
				"Processing SQL script:\n   {0}\ninto database:\n   {1}", 
				scriptPath, dbPath
			);
			Console.WriteLine("Processed: 0.0%");
			double percentage = 0;
			int linesCount = File.ReadAllLines(scriptPath).Length;
			StreamReader reader = new StreamReader(scriptPath);
			double counter = 0;
			while (counter < linesCount) {
				content += (
					content.Length == 0
						? ""
						: Environment.NewLine
					) + reader.ReadLine();
				if (content.Length > 0 && content.LastIndexOf(";") == content.Length - 1) {
					Databasic.Statement.Prepare(content, "db").Exec();
					percentage = counter / linesCount * 100;
					Console.Clear();
					Console.WriteLine("Processing SQL script:\n   {0}\ninto database:\n   {1}", scriptPath, dbPath);
					Console.WriteLine("Processed: {0}%", percentage.ToString("0.0"));
					content = "";
				}
				counter += 1;
			}
			Console.Clear();
			Console.WriteLine(
				"SQL script \n   {0}\nprocessed into database:\n   {1}",
				scriptPath, dbPath
			);
			Console.WriteLine("Processed: 100.0%");
			//Console.WriteLine("Press any key to continue...");
		} catch (Exception ex) {
			Debug.Dump(ex);
			Debug.Dump(content);
			Debug.Log(ex);
			Debug.Log(content, Level.DEBUG);
		}

		//Console.ReadLine();
	}

	private static void onDbError(Exception ex, SqlErrorsCollection sqlErrors) {
		if (ex is Exception) { 
			Debug.Dump(ex);
			Debug.Log(ex);
		} else if (sqlErrors is SqlErrorsCollection && sqlErrors.Count > 0) {
			foreach (var sqlError in sqlErrors) {
				Debug.Dump((sqlError as SqlError).Message);
				Debug.Log(sqlError);
			}
		}
	}
}
