import mysql.connector
mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password=" ",
    database="PES1UG20CS150_RRS_GUI",
    auth_plugin='mysql_native_password'
)
c = mydb.cursor()

def create_table():
    c.execute('CREATE TABLE IF NOT EXISTS TRAIN(train_no TEXT, train_name TEXT, train_type TEXT, source TEXT, destination TEXT,availability TEXT)')

def add_data(train_no, train_name,train_type,source, destination,availability):
    c.execute('INSERT INTO DEALER(train_no,train_name,train_type,source,destination,availability) VALUES (%s,%s,%s,%s,%s,%s)',(train_no,train_name,train_type,source,destination,availability))
    mydb.commit()

def view_all_data():
    c.execute('SELECT * FROM TRAIN')
    data = c.fetchall()
    return data

def view_only_train_names():
    c.execute('SELECT train_name FROM TRAIN')
    data = c.fetchall()
    return data

def get_train(train_no):
    c.execute('SELECT * FROM TRAIN WHERE train_no="{}"'.format(train_no))
    data = c.fetchall()
    return data

def edit_train_data(new_train_no, new_train_name, new_train_type, new_source, new_destination,new_availability,train_no,train_name,train_type,source,destination,availability):
    c.execute("UPDATE TRAIN SET train_no=%s, train_name=%s, train_type=%s,source=%s, destination=%s ,availability=%s WHERE train_no=%s and train_name=%s and train_type=%s and source=%s and destination=%s and availability=%s", (new_train_no, new_train_name, new_train_type,new_source, new_destination,new_availability, train_no,train_name,train_type,source,destination,availability))
    mydb.commit()
    data = c.fetchall()
    return data

def delete_data(train_no):
    c.execute('DELETE FROM TRAIN WHERE train_no="{}"'.format(train_no))
    mydb.commit()
