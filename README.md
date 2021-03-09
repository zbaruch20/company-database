# company-database

This is a physical SQLite representation of the COMPANY database used several times in "Fundamentals of Database Systems".

## How to Use

These files are to be used in a database management system, such as [sqliteonline](https://sqliteonline.com/) or [DataGrip](https://www.jetbrains.com/datagrip/). There are three ways to open the database:

1. Open the binary database file (`company.db`)
2. To create the tables and fill in the data all in one step, load `master.sql` into the DBMS and run the SQL queries.
3. To separately create the tables and fill in data, first load `company-tables.sql` into the DBMS and run the SQL queries. Then, you can either:
	* Import the CSV files (using the file name as the table name, the first line as column names, `,` as the delimiter character, and `"` as the escape character)
	* Import the SQL schemas for the different tables, and run the queries
	* Fill in your own data using whichever method you prefer.
	* *You can mix and match these options for each table!*