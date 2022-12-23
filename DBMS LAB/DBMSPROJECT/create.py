import streamlit as st
from database import add_data


def create():
    col1, col2, col3,col4 = st.columns(4)
    with col1:
        BallotID = st.text_input("BallotID:")
        FirstName = st.text_input("FirstName:")
    with col2:
        LastName = st.text_input("LastName:")
        DateOfBirth = st.text_input("DateOfBirth:")
    with col3:
        Gender = st.text_input("Gender")
        Street = st.text_input("Street:")
        City = st.text_input("City:")
        State = st.text_input("State:")
    with col4:
        SSN = st.text_input("SSN:")
        PrecinctID=st.text_input("PrecinctID:")
        EmailID=st.text_input("EmailID:")
    if st.button("Add Voter"):
        add_data(BallotID,FirstName,LastName,DateOfBirth,Gender,Street,City,State,SSN,PrecinctID,EmailID)
        st.success("Successfully added Voter: {}".format(FirstName,SSN))
