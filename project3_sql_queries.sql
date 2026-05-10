CREATE DATABASE drug_safety_db;
USE drug_safety_db;
CREATE TABLE drug_adverse_events (
    Report_ID INT PRIMARY KEY,
    Date DATE,
    Drug_Name VARCHAR(50),
    Drug_Class VARCHAR(50),
    Patient_Age INT,
    Gender VARCHAR(10),
    Reaction_Type VARCHAR(50),
    Severity VARCHAR(20),
    Outcome VARCHAR(20),
    Country VARCHAR(30),
    Hospitalization VARCHAR(10)
);

SELECT * FROM drug_adverse_events;

-- DRUG FREQUENCY
SELECT Drug_name,COUNT(*)  AS Report_count
FROM drug_adverse_events
GROUP BY Drug_name
ORDER BY Report_count DESC;

-- Reaction Type Frequency--

SELECT  Reaction_Type, COUNT(*) AS reaction_count
FROM drug_adverse_events
GROUP BY Reaction_Type
ORDER BY reaction_count DESC;

-- Severe Cases by Drug--
SELECT Drug_Name,count(*) AS severe_cases
FROM drug_adverse_events
WHERE Severity = 'Severe'
GROUP BY Drug_Name
ORDER BY severe_cases DESC;

-- Hospitalization Burden--
SELECT Drug_Name,
       COUNT(*) AS hospitalized_cases
FROM drug_adverse_events
WHERE Hospitalization = 'Yes'
GROUP BY Drug_Name
ORDER BY hospitalized_cases DESC;


-- Severity Distribution--
SELECT Severity,
       COUNT(*) AS severity_count
FROM drug_adverse_events
GROUP BY Severity;

-- Gender Distribution
SELECT Gender,
       COUNT(*) AS patient_count
FROM drug_adverse_events
GROUP BY Gender;

-- Average Age by Drug
SELECT Drug_Name,
       AVG(Patient_Age) AS avg_age
FROM drug_adverse_events
GROUP BY Drug_Name;

-- Drug Class Severe Burden

SELECT Drug_Class,
       COUNT(*) AS severe_cases
FROM drug_adverse_events
WHERE Severity = 'Severe'
GROUP BY Drug_Class
ORDER BY severe_cases DESC;

