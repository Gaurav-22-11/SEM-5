DELIMITER ;;
CREATE FUNCTION Income(
a VARCHAR(100),
b VARCHAR(100)) 
RETURNS varchar(100) CHARSET utf8
BEGIN
DECLARE ans VARCHAR(100);
SET ans=0;
SET ans=a-b;
RETURN ans;
END ;;
DELIMITER ;

SELECT c.campaignid, c.campaignname, a.candidatename,TRUNCATE(Income(c.FundSpent,c.ReceivedDonations),2) AS INCOME_Million
FROM Campaign c
INNER JOIN candidates a
ON c.candidateid=a.candidateid
order by income_million desc;
 