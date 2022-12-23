# pip install mysql-connector-python
import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    port=3307,
    database="project"
)
c = mydb.cursor()


def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS Voter(BallotID TEXT, FirstName TEXT, LastName TEXT, DOB TEXT, Gender TEXT,Street TEXT,City TEXT,State TEXT,SSN TEXT ,PrecinctID TEXT,EmailID TEXT )')


def add_data(BallotID, FirstName, LastName,DateOfBirth, Gender,Street,City,State,SSN,PrecinctID,EmailID):
    c.execute('INSERT INTO voter_info(BallotID,FirstName,LastName,DateOfBirth,Gender,Street,City,State,SSN,PrecinctID,EmailID) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)',
              (BallotID,FirstName,LastName,DateOfBirth,Gender,Street,City,State,SSN,PrecinctID,EmailID))
    mydb.commit()


def view_all_voter_details():
    c.execute('SELECT * FROM voter_info')
    data = c.fetchall()
    return data


def view_only_voter_names():
    c.execute('SELECT FirstName from voter_info')
    data = c.fetchall()
    return data


def get_voter(FirstName):
    c.execute('SELECT * FROM voter_info WHERE FirstName="{}"'.format(FirstName))
    data = c.fetchall()
    return data


def edit_voter_info(new_BallotID, new_FirstName, new_LastName,new_DateOfBirth,new_Gender,new_Street,new_City,new_State,new_SSN,new_PrecinctID,new_EmailID,Ballot_ID,FirstName,LastName,DateOfBirth,Gender,Street,City,State,SSN,PrecinctID,EmailID):
    c.execute("UPDATE voter_info SET BallotID=%s, FirstName=%s, LastName=%s,DateOfBirth=%s,Gender=%s,Street=%s,City=%s,State=%s,SSN=%s,PrecinctID=%s,EmailID=%s WHERE "
              "BallotID=%s and FirstName=%s and Lastname=%s and DateOfBirth=%s and Gender=%s and Street=%s and City=%s and State=%s and SSN=%s and PrecinctID=%s and EmailID=%s", (new_BallotID, new_FirstName, new_LastName,new_DateOfBirth,new_Gender,new_Street,new_City,new_State,new_SSN,new_PrecinctID,new_EmailID,Ballot_ID,FirstName,LastName,DateOfBirth,Gender,Street,City,State,SSN,PrecinctID,EmailID))
    mydb.commit()
    data = c.fetchall()
    return data


def delete_voter(FirstName):
    c.execute('DELETE FROM voter_info WHERE FirstName="{}"'.format(FirstName))
    mydb.commit()
