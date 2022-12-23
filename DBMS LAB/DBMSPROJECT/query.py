import pandas as pd
import streamlit as st
import plotly.express as px
import mysql.connector

mydb = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    port=3307,
    database="project"
)
c=mydb.cursor()

def query(question):
    c.execute(question)
    data=c.fetchall()
    st.write(data)