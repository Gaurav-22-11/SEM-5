#Person who won a particular election
DELIMITER $$
CREATE PROCEDURE campaigndetails(IN v varchar(60))
BEGIN
SELECT c.campaignid, c.campaignname,cm.mediaid,mm.name,c.fundspent,c.receiveddonations,
TRUNCATE(Income(c.FundSpent,c.ReceivedDonations),2) 
AS INCOME_Million,c.managerid,m.name as Manager_Name,c.noofvolunteers,c.CandidateID,a.candidatename
FROM Campaign c
INNER JOIN candidates_uses_media cm
INNER JOIN candidates a
INNER JOIN campaignManager m
INNER JOIN media mm
ON c.candidateid=a.candidateid AND m.managerid=c.managerid AND mm.MediaID=cm.MediaID AND cm.candidateid=a.CandidateID
where c.candidateid=v
order by campaignid;
END $$
DELIMITER ;
call campaigndetails(1002);


#revenue for each campaign
DELIMITER $$
CREATE PROCEDURE campaignrevenue(IN b varchar(60))
BEGIN
SELECT c.campaignid, c.campaignname, a.candidatename,p.partyname,TRUNCATE(Income(c.FundSpent,c.ReceivedDonations),2) AS INCOME_Million
FROM Campaign c
INNER JOIN candidates a
INNER JOIN Party p
ON c.candidateid=a.candidateid AND p.partyid=a.PartyID
WHERE Campaignid= b
order by income_million desc;
END $$
DELIMITER ;
CALL campaignrevenue('g');

#all campaign details of a particular candidate
DELIMITER $$
CREATE PROCEDURE electionresult(IN a varchar(60))
BEGIN
SELECT t.electionid, t.electionname, t.candidateid,t.candidatename,max(t.total)as totalVote, t.candidateid 
FROM (SELECT electionid, electionname, candidateid, candidatename, max(total_votes) AS Total
FROM Winner GROUP BY candidateid, electionid) t 
WHERE electionid = a
GROUP BY t.electionid;
END $$
DELIMITER ;
CALL electionresult('e02');
