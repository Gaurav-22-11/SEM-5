import mysql.connector
import streamlit as st
from create import create
from database import create_table
from delete import delete
from read import read
from update import update
def main():
    st.title("PES1UG20CS150 RRS App")
    menu = ["Add", "View", "Edit", "Remove"]
    choice = st.sidebar.selectbox("Menu", menu)
    create_table()
    if choice == "Add":
        st.subheader("Enter Train Details:")
        create()
    elif choice == "View":
        st.subheader("View created tasks")
        read()
    elif choice == "Edit":
        st.subheader("Update created tasks")
        update()
    elif choice == "Remove":
        st.subheader("Delete created tasks")
        delete()
    else:
        st.subheader("About tasks")
if __name__ == '__main__':
    main()

#mydb=mysql.connector.connect(
#    host="localhost",
#    user="root",
#   port= 3307,
#    password=""
#)
#c=mydb.cursor()
#c.execute("create database PES1UG20CS150_RRS_GUI")
