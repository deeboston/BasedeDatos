--medico que mas atendio paciente
SELECT m.codigo_medico, m.nombre_medico, COUNT(h.codigo_paciente) AS total_pacientes
FROM detalle_historia dh
JOIN historia h ON dh.codigo_historia = h.codigo_historia
JOIN medico m ON dh.codigo_medico = m.codigo_medico
GROUP BY m.codigo_medico, m.nombre_medico
HAVING COUNT(h.codigo_paciente) = (
    SELECT MAX(total_pacientes)
    FROM (
        SELECT COUNT(h.codigo_paciente) AS total_pacientes
        FROM detalle_historia dh
        JOIN historia h ON dh.codigo_historia = h.codigo_historia
        GROUP BY dh.codigo_medico
    ) AS subquery
);

--otro method
SELECT m.codigo_medico, m.nombre_medico, COUNT(DISTINCT h.codigo_paciente) AS total_pacientes
FROM detalle_historia dh
JOIN historia h ON dh.codigo_historia = h.codigo_historia
JOIN medico m ON dh.codigo_medico = m.codigo_medico
GROUP BY m.codigo_medico, m.nombre_medico
ORDER BY total_pacientes DESC
LIMIT 1;


--medico que mas realizo examenes
SELECT m.codigo_medico, m.nombre_medico, COUNT(dh.codigo_examen) AS total_examenes
FROM detalle_historia dh
JOIN medico m ON dh.codigo_medico = m.codigo_medico
GROUP BY m.codigo_medico, m.nombre_medico
HAVING COUNT(dh.codigo_examen) = (
    SELECT MAX(total_examenes)
    FROM (
        SELECT COUNT(dh.codigo_examen) AS total_examenes
        FROM detalle_historia dh
        GROUP BY dh.codigo_medico
    ) AS subquery
);

--otro method
SELECT m.codigo_medico, m.nombre_medico, COUNT(dh.codigo_examen) AS total_examenes
FROM detalle_historia dh
JOIN medico m ON dh.codigo_medico = m.codigo_medico
GROUP BY m.codigo_medico, m.nombre_medico
ORDER BY total_examenes DESC
LIMIT 1;


--examen que mas se realizo
SELECT e.codigo_examen, e.nombre_examen, COUNT(dh.codigo_examen) AS total_realizados
FROM detalle_historia dh
JOIN examen e ON dh.codigo_examen = e.codigo_examen
GROUP BY e.codigo_examen, e.nombre_examen
HAVING COUNT(dh.codigo_examen) = (
    SELECT MAX(total_realizados)
    FROM (
        SELECT COUNT(dh.codigo_examen) AS total_realizados
        FROM detalle_historia dh
        GROUP BY dh.codigo_examen
    ) AS subquery
);

--otro method
SELECT e.codigo_examen, e.nombre_examen, COUNT(dh.codigo_examen) AS total_realizados
FROM detalle_historia dh
JOIN examen e ON dh.codigo_examen = e.codigo_examen
GROUP BY e.codigo_examen, e.nombre_examen
ORDER BY total_realizados DESC
LIMIT 1;


--el paciente que mas historias tiene
SELECT p.codigo_paciente, p.nombre_paciente, COUNT(h.codigo_historia) AS total_historias
FROM historia h
JOIN pacientes p ON h.codigo_paciente = p.codigo_paciente
GROUP BY p.codigo_paciente, p.nombre_paciente
HAVING COUNT(h.codigo_historia) = (
    SELECT MAX(total_historias)
    FROM (
        SELECT COUNT(h.codigo_historia) AS total_historias
        FROM historia h
        GROUP BY h.codigo_paciente
    ) AS subquery
);

--otro method
SELECT p.codigo_paciente, p.nombre_paciente, COUNT(h.codigo_historia) AS total_historias
FROM historia h
JOIN pacientes p ON h.codigo_paciente = p.codigo_paciente
GROUP BY p.codigo_paciente, p.nombre_paciente
ORDER BY total_historias DESC
LIMIT 1;
