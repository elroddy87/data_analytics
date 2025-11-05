--Calculate the total number of patient encounters in the healthcare dataset
SELECT patient_nbr, count(encounter_id) AS encounter_count
FROM DIABETIC_DATA
GROUP BY patient_nbr 
ORDER BY encounter_count DESC;

--Identify the top 10 most frequent diagnoses in the dataset
SELECT diagnosis , sum(num_of_diagnoses )diagnoses_count FROM(
SELECT diag_1 AS diagnosis, count(diag_1) as num_of_diagnoses
FROM DIABETIC_DATA
GROUP BY diagnosis
UNION
SELECT diag_2 AS diagnosis, count(diag_2) as num_of_diagnoses
FROM DIABETIC_DATA
GROUP BY diagnosis
UNION
SELECT diag_3 AS diagnosis, count(diag_3) as num_of_diagnoses
FROM DIABETIC_DATA
GROUP BY diagnosis
)GROUP BY diagnosis
ORDER BY diagnoses_count DESC
LIMIT 10;

--Calculate the average length of hospital stay for each admission type
SELECT admission_type_id, ROUND(AVG(time_in_hospital),0) AS avg_time_in_hospital
FROM DIABETIC_DATA
GROUP BY admission_type_id ;

--Determine the number of readmitted patients and the percentage of total encounters that they represent
SELECT *,ROUND(100.0 *((readmission_count *1.0)/ total_encounter ),2) AS readmission_percentage
FROM (SELECT 
(SELECT count(*) FROM DIABETIC_DATA ) AS total_encounter,
(SELECT count(*) FROM DIABETIC_DATA where readmitted <>'NO') as readmission_count
)

--Identify the age distribution of patients
SELECT age, count(age) AS age_grp_count
FROM DIABETIC_DATA
GROUP BY age

--Identify the most common procedures performed during patient encounters
--NO PROCEDURES LISTED

--Calculate the average number of medications prescribed for patients in each age group
SELECT age, ROUND(avg(num_medications ) ,0) AS average_num_of_meds
FROM DIABETIC_DATA
GROUP BY age

--Identify the distribution of readmission rates across different payer codes
SELECT payer_code , count(*) as total_encounters,
SUM(CASE WHEN readmitted <>'NO' THEN 1 ELSE 0 END) AS readmitted_count,
ROUND(100.0 * SUM(CASE WHEN readmitted <> 'NO' THEN 1 ELSE 0 END) / COUNT(*), 2) as readmission_rate
FROM DIABETIC_DATA
GROUP BY payer_code