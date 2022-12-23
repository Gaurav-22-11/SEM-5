import pandas as pd
import streamlit as st
from database import view_all_voter_details, view_only_voter_names, delete_voter


def delete():
    result = view_all_voter_details()
    df = pd.DataFrame(result, columns=['BallotID','FirstName','LastName','DateOfBirth','Gender','Street','City','State','SSN','PrecinctID','EmailID'])
    with st.expander("Current data"):
        st.dataframe(df)

    list_of_voters = [i[0] for i in view_only_voter_names()]
    selected_voter = st.selectbox("Task to Delete", list_of_voters)
    st.warning("Do you want to delete ::{}".format(selected_voter))
    if st.button("Delete Voter"):
        delete_voter(selected_voter)
        st.success("Voter information has been deleted successfully")
    new_result = view_all_voter_details()
    df2 = pd.DataFrame(new_result, columns=['BallotID','FirstName','LastName','DateOfBirth','Gender','Street','City','State','SSN','PrecinctID','EmailID'])
    with st.expander("Updated data"):
        st.dataframe(df2)