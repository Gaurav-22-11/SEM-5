#retrieve only the ballot nos of the voters who have voted
SELECT V.BALLOTID,V.ELECTIONID,E.ELECTIONNAME,V.CANDIDATEID,C.CANDIDATENAME,V.PARTYID,P.PARTYNAME 
FROM VOTE V INNER JOIN ELECTION E INNER JOIN CANDIDATES C INNER JOIN PARTY P
ON V.ELECTIONID=E.ELECTIONID AND V.CANDIDATEID=C.CANDIDATEID AND V.PARTYID=P.PARTYID
WHERE V.VOTESTATUS='YES'
order by electionid;

#get total no. of votes received by each candidate in each election
select  v.electionid,e.electionname, v.candidateid, c.candidatename, p.partyname, count(v.candidateid) AS Total_Votes
from vote v INNER JOIN Candidates c INNER JOIN Election e INNER JOIN Party p
ON v.ElectionID=e.electionid AND v.CandidateID=c.candidateid AND v.partyid=p.partyid
where v.candidateid is NOT NULL AND v.VoteStatus='yes'
group by v.electionid, v.CandidateID
order by v.electionID asc, total_votes desc;





