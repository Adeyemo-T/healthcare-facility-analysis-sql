# Hospital Data Analysis SQL Project

## Business Problem
Hospital administrators and healthcare policymakers need to analyze facility distribution, capacity, and service availability across states to optimize resource allocation and identify gaps in healthcare coverage. This project uses SQL to answer 9 critical business questions about hospital operations using a dataset of 20,000 hospital records.

## Dataset
- **Source**: Synthetic hospital data generated for analysis
- **Size**: 20,000 hospital records
- **Scope**: Hospital general information and location data across 10 US states
- **Key Fields**: Hospital names, locations, ownership types, bed counts, staff numbers, trauma services, emergency services

## Database Schema Design
Created a normalized relational database with the following structure:

### Tables Created:
1. **hospital_types** - Lookup table for hospital type categories
   - Primary Key: type_id
   
2. **hospitals** - Core hospital information
   - Primary Key: provider_id
   - Foreign Key: type_id references hospital_types
   
3. **hospital_locations** - Geographic and capacity data
   - Primary Key: location_id
   - Foreign Key: provider_id references hospitals

### Normalization Applied:
- Eliminated data redundancy by creating lookup table for hospital types
- Established proper primary key and foreign key relationships
- Separated operational data (hospitals) from geographic data (locations)

## Business Questions Analyzed

### 1. Which states have the most hospitals?
**Query**: Aggregated hospital counts by state
**Finding**: [Add your top 3 states and counts]
![Image](https://github.com/user-attachments/assets/9af80d8d-64fd-4c4e-a6bb-27dbacac5fd8)

### 2. What is the average number of beds per hospital type?
**Query**: Used JOIN and AVG() aggregate function across three tables
**Finding**: [Add hospital type with highest average]

![Image](https://github.com/user-attachments/assets/4cf572e5-45b3-4527-a241-dd1f4f8141d5)

### 3. Which cities have hospitals with no emergency services?
**Query**: Filtered hospitals where emergency_services is False or NULL
**Finding**: [Add count of cities]
![Image](https://github.com/user-attachments/assets/b65c8882-23da-4947-acee-c4db0988b967)

### 4. What is the distribution of hospital ownership across states?
**Query**: Used GROUP BY with multiple dimensions (state and ownership type)
**Finding**: [Add key insight about ownership distribution]
![Image](https://github.com/user-attachments/assets/89fc6728-1aa9-4d6c-80f3-6134d6472899)

### 5. Which hospitals have the highest staff-to-bed ratio?
**Query**: Calculated staff per bed ratio using CAST for decimal division
**Finding**: [Add top hospital name and ratio]
![Image](https://github.com/user-attachments/assets/55af2304-af7a-42a0-ade6-50ff4f03f434)

### 6. What percentage of hospitals have trauma services by state?
**Query**: Used CASE statements with SUM and aggregate functions to calculate percentages
**Finding**: [Add state with highest trauma coverage percentage]

![Image](https://github.com/user-attachments/assets/81d5954f-9e76-492c-b3b9-c1e2b4477ff9)

### 7. Which hospital type has the highest average bed count?
**Query**: Multi-table JOIN with AVG() aggregate function
**Finding**: [Add hospital type]
![Image](https://github.com/user-attachments/assets/a34360cc-e265-49af-a583-db52390a9351)

### 8. Find hospitals with missing critical data
**Query**: Used OR logic with IS NULL to identify data quality issues
**Finding**: [Add percentage of hospitals with missing data]
![Image](https://github.com/user-attachments/assets/abd16bc4-932d-456e-9b56-2de626282539)

### 9. Which states have zero government-owned hospitals?
**Query**: Used subquery with NOT IN to find states without government hospitals
**Finding**: All states in the dataset have at least one government hospital
![Image](https://github.com/user-attachments/assets/9e512e01-018d-4c9d-8afe-dc8390d5c62c)

## Technical Implementation

### Tools & Technologies:
- **Database**: Microsoft SQL Server
- **IDE**: SQL Server Management Studio (SSMS)
- **Data Generation**: Python with pandas library

### Key SQL Concepts Applied:
- Database normalization (1NF, 2NF, 3NF)
- Primary and foreign key constraints
- Multi-table JOINs (INNER JOIN)
- Aggregate functions (COUNT, AVG, SUM)
- Subqueries
- CASE statements for conditional logic
- Window functions (RANK with PARTITION BY)
- Views for query reusability
- Stored procedures with parameters
- Indexes for query optimization

### Performance Optimization:
Created indexes on frequently queried columns:
```sql
CREATE INDEX idx_state ON hospitals(state);
CREATE INDEX idx_beds ON hospital_locations(beds);
CREATE INDEX idx_provider ON hospital_locations(provider_id);
Views Created:
vw_hospitals_by_state - Simplified state-level hospital counts
vw_avg_beds_by_type - Average bed capacity by hospital type
Stored Procedures Created:
sp_get_hospital_count_by_state - Parameterized query for state-specific counts
sp_get_hospitals_by_state - Retrieve all hospitals in a specified state
sp_get_hospitals_by_ownership_and_beds - Filter by ownership type and minimum bed count
Key Insights
[Add 3-5 bullet points with your most important findings from the analysis]
Skills Demonstrated
Data modeling and schema design
SQL query writing for business analytics
Data normalization and referential integrity
Performance optimization with indexes
Creating reusable database objects (views, stored procedures)
Handling missing data and data quality issues
Complex aggregations and calculations
Window functions for advanced analytics
Future Enhancements
Connect to Power BI for interactive dashboard visualization
Add more complex stored procedures for automated reporting
Implement triggers for data validation
Expand analysis to include time-series trends
Add geographic visualization using latitude/longitude data
Project Files
hospital_general.csv - Source data for hospital information
hospital_location.csv - Source data for geographic and capacity information
schema_creation.sql - Database schema and table creation scripts
business_queries.sql - All 10 business analysis queries
views_and_procedures.sql - Reusable database objects
Author: [Your Name]
Date: [Current Date]
Contact: [Your LinkedIn/Email]
This is your complete README. Replace the bracketed placeholders with your actual results and add screenshots where indicated. Save this as README.md in your project folder.
