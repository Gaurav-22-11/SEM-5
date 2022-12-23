import pandas as pd
import streamlit as st
import plotly.express as px
from database import view_all_voter_details


def read():
    result = view_all_voter_details()
    # st.write(result)
    df = pd.DataFrame(result, columns=['BallotID', 'FirstName', 'LastName','DateOfBirth' ,'Gender','Street','City','State','SSN','PrecinctID','EmailID'])
    with st.expander("View all Voter details"):
        st.dataframe(df)