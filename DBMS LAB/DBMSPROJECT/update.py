import pandas as pd
import streamlit as st
from database import view_all_voter_details, view_only_voter_names, get_voter, edit_voter_info


def update():
    result = view_all_voter_details()
    # st.write(result)
    df = pd.DataFrame(result, columns=['BallotID', 'FirstName', 'LastName','DateOFBirth','Gender','Street','City','State','SSN','PrecinctID','EmailID'])
    with st.expander("Current Voters"):
        st.dataframe(df)
    list_of_voters = [i[0] for i in view_only_voter_names()]
    selected_voter = st.selectbox("Voter to edit", list_of_voters)
    selected_result = get_voter(selected_voter)
    #st.write(selected_result)
    if selected_result:
        BallotID = selected_result[0][0]
        FirstName = selected_result[0][1]
        LastName = selected_result[0][2]
        DateOFBirth = selected_result[0][3]
        Gender = selected_result[0][4]
        Street = selected_result[0][5]
        City = selected_result[0][6]
        State = selected_result[0][7]
        SSN = selected_result[0][8]
        PrecinctID = selected_result[0][9]
        EmailID = selected_result[0][10]
        # Layout of Create

        col1, col2, col3,col4 = st.columns(4)
        with col1:
            new_BallotID = st.text_input("Ballot ID:", BallotID)
            new_FirstName = st.text_input("FirstName:", FirstName)
        with col2:
            new_LastName = st.text_input("LastName:", LastName)
            new_DateOfBirth = st.text_input("DateOfBirth:",DateOFBirth)
        with col3:
            new_Gender = st.selectbox("Gender:",Gender)
            new_Street = st.text_input("Street:", Street)
            new_City= st.text_input("City:", City)
            new_State = st.text_input("State:",State)
        with col4:
            new_SSN=st.text_input("SSN:",SSN)
            new_PrecinctID=st.text_input("PrecinctID:",PrecinctID)
            new_EmailID= st.text_input("EmailID:",EmailID)
        if st.button("Update Voter"):
            edit_voter_info(new_BallotID,new_FirstName, new_LastName,new_DateOfBirth, new_Gender, new_Street,new_City,new_State,new_SSN,new_PrecinctID,new_EmailID,BallotID,FirstName,LastName,DateOFBirth,Gender,Street,City,State,SSN,PrecinctID,EmailID)
            st.success("Successfully updated:: {} to ::{}".format(FirstName,new_FirstName))

    result2 = view_all_voter_details()
    df2 = pd.DataFrame(result2, columns=['BallotID', 'FirstName', 'LastName','DateOfBirth','Gender','Street','City','State','SSN','PrecinctID','EmailID'])
    with st.expander("Updated data"):
        st.dataframe(df2)
