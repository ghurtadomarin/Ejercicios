SELECT num, name, town_code FROM departments WHERE name LIKE 'A%G';
SELECT surname FROM employees where commission IS NULL and surname like 'P%';
SELECT surname FROM employees where occu_code LIKE 'EMP' or occu_code LIKE 'MAN' or occu_code LIKE 'SAL';