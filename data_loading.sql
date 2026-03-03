		INSERT INTO Hospital_Types(Types_Name)
		SELECT DISTINCT hospital_type FROM hospital_general
		WHERE hospital_type IS NOT NULL
							   
		INSERT INTO Hospitals(Provider_ID,
		Hospital_Names,Address,City,states,
		Zip_code,County_Name,
		Phone_Number,Types_ID,
		Hospital_Ownership,
		Emergency_Services)
		SELECT g.provider_id,
			   g.hospital_name,
			   g.address,
			   g.city,
			   g.state,
			   g.zip_code,
			   g.county_name,
			   g.phone_number,
			   t.Types_ID,
			   g.hospital_ownership,
			   g.emergency_services
		FROM hospital_general g
		JOIN Hospital_Types t ON g.hospital_type=t.Types_Name

		INSERT INTO Hospital_Locations(Location_ID,Provider_ID,latitude,longitude,Beds,Trauma_Level,Total_Staffs,Website)
		SELECT location_id,
			   provider_id,
			   latitude,
			   longitude,
			   beds,
			   trauma_level,
			   total_staff,
			   website
			   FROM hospital_Location