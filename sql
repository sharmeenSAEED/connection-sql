import pyodbc

conn = pyodbc.connect(
    'Driver={ODBC Driver 18 for SQL Server};'
    'Server=localhost\\SQLEXPRESS;'
    'Database=master;'
    'Trusted_Connection=yes;'
    'TrustServerCertificate=yes;'
)

cursor = conn.cursor()
print("SQL Connected!")

cursor.execute("""
IF OBJECT_ID('students', 'U') IS NULL
BEGIN
    CREATE TABLE students(
        id INT IDENTITY(1,1) PRIMARY KEY,
        name VARCHAR(50),
        age INT,
        grade NVARCHAR(10)
    )
END
""")

conn.commit()
print("Table created successfully!")
