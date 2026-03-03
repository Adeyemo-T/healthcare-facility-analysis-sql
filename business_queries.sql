--Which states have the most hospitals
select  top 10 states,COUNT(Provider_ID) as Hospital_Count
from Hospitals
group by states
ORDER BY Hospital_Count asc

--whats avg number of beds per hospital type
select ht.Types_Name,AVG(hl.Beds) avg_beds
FROM Hospitals h JOIN Hospital_Types ht ON h.Types_ID=ht.Types_ID
JOIN Hospital_Locations hl ON h.Provider_ID=hl.Provider_ID
WHERE Beds IS NOT NULL
GROUP BY ht.Types_Name
ORDER BY avg_beds

--Which Cities Have Hospitals With no Emergrncy Services
select city, count(*) Emergency_Services from
Hospitals WHERE Emergency_Services IS NULL OR Emergency_Services= 0
group by City

--WHats distribution of hospital ownership across states?
SELECT Hospital_Ownership,states,count(*) hospital_counts
from Hospitals
group by states,Hospital_Ownership
ORDER BY states,Hospital_Ownership

--Which hospitals has the most staff relative to their bed counts? - staffs per Ratio
SELECT TOP 10
h.Hospital_Names,
h.City,
h.states,
hl.Total_Staffs,
hl.Beds,
CAST(hl.Total_Staffs AS FLOAT)/hl.Beds AS Staffs_per_ratio
FROM Hospitals h
JOIN Hospital_Locations hl ON h.Provider_ID=hl.Provider_ID
WHERE hl.Total_Staffs IS NOT NULL
AND hl.Beds IS NOT NULL
AND hl.Beds >0
ORDER BY Staffs_per_ratio desc;

--what % of hospital have Trauma service
select h.states, count(*) as total,
SUM(CASE WHEN l.Trauma_level is not null then 1 ELSE 0 END)AS Hospital_with_Trauma,
CAST(SUM(CASE WHEN l.Trauma_level IS NOT NULL THEN 1 ELSE 0 END)AS float)/COUNT(*)*100 AS Trauma_percentage
from Hospitals h
JOIN Hospital_Locations l ON h.Provider_ID=l.Provider_ID
GROUP BY h.states
ORDER BY Trauma_percentage

--hospital types with the highest average bed count
SELECT TOP 1 ht.Types_Name, AVG(l.Beds) as highest_average
from Hospitals h
JOIN Hospital_Locations l ON h.Provider_ID=l.Provider_ID
JOIN Hospital_Types ht ON h.Types_ID=ht.Types_ID
GROUP BY Types_Name
ORDER BY AVG(l.Beds)

--Hospitals with missing critical data
SELECT h.Hospital_Names,h.city,h.states,l.Beds,l.Total_Staffs,
CASE
	WHEN l.Beds is null and l.Total_Staffs is null then 'Both missing'
	WHEN  l.Beds is null then'Beds missing'
	WHEN l.Total_Staffs is null then 'staff missing'
	END AS missing_Data
FROM Hospitals h
join Hospital_Locations l on h.Provider_ID=l.Provider_ID
Where Beds IS NULL or 
Total_Staffs IS NULL

--state that doesnt have govt owned hospitals
select distinct states from Hospitals
where states not in(select states from Hospitals
where Hospital_Ownership='Government')

