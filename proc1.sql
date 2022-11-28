USE procedimientos;

CREATE PROCEDURE pa_interpretes_lista()

SELECT
  *
FROM
  interprete;
  
-- ejecutar el procedimiento anterior  llamada
USE videoteca;

CALL pa_interpretes_lista();


