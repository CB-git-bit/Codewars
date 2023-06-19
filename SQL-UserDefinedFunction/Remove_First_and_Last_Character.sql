-- # write your SQL statement here: you are given a table 'removechar' with column 's', return a table with column 's' and your result in a column named 'res'.
CREATE OR REPLACE FUNCTION remove_outer_characters(
  var VARCHAR)

RETURNS VARCHAR AS
$$
BEGIN
  --removes 1st (2) & last char (len -2)
  RETURN SUBSTRING(var, 2, LENGTH(var) - 2);
END;
$$
LANGUAGE plpgsql; --specify fct is written in PL/pgSQL

--apply the function to the table remove char on column s as requested:
SELECT s, remove_outer_characters(s) AS res 
FROM removechar;

--Initial attempt:
-- CREATE FUNCTION remove_outer_characters(
--   @VAR CHAR)

-- RETURNS CHAR AS
-- BEGIN
--   RETURN IF LENGTH(@VAR) > 2 --execute the function only if string is longer than 2 characters
--     SELECT right(@VAR, len(@VAR)-1) as var_1; --remove first character w RIGHT fct
--     SELECT left(var_1, len(var_1)-1) as var_2; --remove last character w LEFT fct
        -- --use substring instead bc more efficient
-- END

-- SELECT *, .remove_outer_character('s') AS res from removechar
  
  

