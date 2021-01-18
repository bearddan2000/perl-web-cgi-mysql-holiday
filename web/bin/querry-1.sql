SELECT * FROM american
WHERE id NOT IN (
  SELECT id FROM american
  WHERE MONTH(CURDATE()) >= mes
  AND DAY(CURDATE()) >= dia)
LIMIT 1;
