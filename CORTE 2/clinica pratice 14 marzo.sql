SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';

SELECT * FROM pacientes;
SELECT * FROM historia;
SELECT * FROM detalle_historia;
SELECT * FROM medico;
SELECT * FROM examen;

--Count Patients and Their Exams
SELECT p.codigo_paciente AS patient_id, 
       p.nombre_paciente AS patient_name, 
       COUNT(e.codigo_examen) AS total_exams
FROM pacientes p
LEFT JOIN examen e ON p.codigo_paciente = e.codigo_examen
GROUP BY p.codigo_paciente, p.nombre_paciente
ORDER BY total_exams DESC;

--List Patients with Their Exam Details
SELECT p.codigo_paciente AS patient_id, 
       p.nombre_paciente AS patient_name, 
       e.codigo_examen AS exam_id, 
       e.nombre_examen AS exam_name
FROM pacientes p
LEFT JOIN examen e ON p.codigo_paciente = e.codigo_examen
ORDER BY p.codigo_paciente, e.codigo_examen;

--Get Total Number of Patients
SELECT COUNT(*) AS total_patients FROM pacientes;

--List Patients and Their Exams (Even Those Without examens)
SELECT p.codigo_paciente AS patient_id, 
       p.nombre_paciente AS patient_name, 
       COALESCE(e.nombre_examen, 'No Exams') AS exam_name
FROM pacientes p
LEFT JOIN examen e ON p.codigo_paciente = e.codigo_examen
ORDER BY p.nombre_paciente;

-- Find Patients Who Haven’t Taken Any Exams
SELECT p.codigo_paciente, p.nombre_paciente
FROM pacientes p
LEFT JOIN examen e ON p.codigo_paciente = e.codigo_examen
WHERE e.codigo_examen IS NULL;

--Count How Many Patients Have Taken at Least One Exam
SELECT COUNT(DISTINCT p.codigo_paciente) AS patients_with_exams
FROM pacientes p
INNER JOIN examen e ON p.codigo_paciente = e.codigo_examen;

--Count the Number of Each Type of Exam Taken
SELECT e.nombre_examen, COUNT(*) AS total_taken
FROM examen e
GROUP BY e.nombre_examen
ORDER BY total_taken DESC;

--Find the Most Active Patients (Who Have Taken the Most Exams)
SELECT p.codigo_paciente, p.nombre_paciente, COUNT(e.codigo_examen) AS exam_count
FROM pacientes p
INNER JOIN examen e ON p.codigo_paciente = e.codigo_examen
GROUP BY p.codigo_paciente, p.nombre_paciente
ORDER BY exam_count DESC
LIMIT 10;


--14 de marzo
--patients who have taken the same exam more than 5 times
SELECT 
    h.codigo_paciente AS patient_id, 
    p.nombre_paciente AS patient_name, 
    e.nombre_examen AS exam_name, 
    COUNT(*) AS exam_count
FROM historia h
JOIN pacientes p ON h.codigo_paciente = p.codigo_paciente
JOIN detalle_historia dh ON h.codigo_historia = dh.codigo_historia
JOIN examen e ON dh.codigo_examen = e.codigo_examen
GROUP BY h.codigo_paciente, p.nombre_paciente, e.nombre_examen
HAVING COUNT(*) > 5;


--exams that were taken more than 5 times
SELECT e.nombre_examen AS exam_name, 
       COUNT(*) AS exam_count
FROM detalle_historia dh
JOIN examen e ON dh.codigo_examen = e.codigo_examen
GROUP BY e.nombre_examen
HAVING COUNT(*) > 5
ORDER BY exam_count DESC;

