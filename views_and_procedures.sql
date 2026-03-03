							CREATE VIEW vw_hospitals_by_state AS
							SELECT states,COUNT(Provider_ID) AS Hospital_count
							from Hospitals
							GROUP BY states

							CREATE VIEW avg_bed AS 
							select ht.Types_Name,AVG(hl.Beds) avg_beds
							FROM Hospitals h JOIN Hospital_Types ht ON h.Types_ID=ht.Types_ID
							JOIN Hospital_Locations hl ON h.Provider_ID=hl.Provider_ID
							WHERE Beds IS NOT NULL
							GROUP BY ht.Types_Name

							CREATE VIEW no_emergency AS select city, count(*) Emergency_Services from
							Hospitals WHERE Emergency_Services IS NULL OR Emergency_Services= 0
							group by City

							CREATE PROCEDURE sp_get_hospital_count_by_state
								@state_code NVARCHAR(50)
							AS
							BEGIN
							SELECT 
								states,
							COUNT(provider_id) AS hospital_count
								FROM hospitals
								WHERE states = @state_code
								GROUP BY states;
							END;

							-- Stored Procedure 2: Get all hospitals in a specified state
							CREATE PROCEDURE sp_get_hospitals_by_state
							@state_code NVARCHAR(50)
							AS
							BEGIN
								SELECT 
								Hospital_Names,
								city,
								hospital_ownership,
								emergency_services
								FROM hospitals
								WHERE states = @state_code;
							END;

							-- Stored Procedure 3: Filter by ownership type and minimum bed count
							CREATE PROCEDURE sp_get_hospitals_by_ownership_and_beds
								@ownership_type NVARCHAR(100),
								@min_beds INT
							AS
							BEGIN
							SELECT 
								h.Hospital_Names,
								h.states,
								h.city,
								h.hospital_ownership,
								hl.beds
							FROM hospitals h
							JOIN hospital_locations hl ON h.provider_id = hl.provider_id
						    WHERE h.hospital_ownership = @ownership_type
							AND hl.beds >= @min_beds
							ORDER BY hl.beds DESC;
							END;