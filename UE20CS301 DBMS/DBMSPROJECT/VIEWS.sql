#Votes for every candidate
CREATE VIEW Winner AS
SELECT v.electionid,e.electionname, v.candidateid, c.candidatename, p.partyname, count(v.candidateid) AS Total_Votes
FROM vote v INNER JOIN Candidates c INNER JOIN Election e INNER JOIN Party p
ON v.ElectionID=e.electionid AND v.CandidateID=c.candidateid AND v.partyid=p.partyid
WHERE v.candidateid is NOT NULL AND v.VoteStatus='yes'
GROUP BY v.electionid, v.CandidateID
ORDER BY v.electionID;

select * from winner;
select * from winner group by electionid;

#Total voters for every election
CREATE VIEW totalvoters
   AS
   select v.electionid, e.electionname, count(v.ballotid) as Total_votes 
   from vote v INNER JOIN election e
   ON v.electionid=e.electionid
   where v.votestatus='yes'
   group by v.electionid
   order by v.electionid;
  select * from totalvoters; 
  
#who won per election
CREATE VIEW Votesummary
AS
SELECT t.electionid, max(t.totalvotes) As winner_total, t.candidatename
FROM (SELECT v.electionid,c.candidatename, COUNT(v.candidateid) AS totalvotes 
FROM vote v 
INNER JOIN candidates c 
ON c.CandidateID=v.CandidateID 
WHERE v.votestatus='yes' 
GROUP BY v.electionid, v.candidateid) AS t
GROUP BY t.electionid
ORDER BY t.electionid;

select * from Votesummary group by electionid;
