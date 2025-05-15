USE `prueba_2`;
DROP procedure IF EXISTS `listF`;

USE `prueba_2`;
DROP procedure IF EXISTS `prueba_2`.`listF`;
;

DELIMITER $$
USE `prueba_2`$$
CREATE  PROCEDURE `listF`(
	In nom varchar(100)
)
BEGIN
	insert into Fabricante (nombre)
    value (nom);
END$$

DELIMITER ;
;



USE `prueba_2`;
DROP procedure IF EXISTS `listP`;

USE `prueba_2`;
DROP procedure IF EXISTS `prueba_2`.`listP`;
;

DELIMITER $$
USE `prueba_2`$$
CREATE  PROCEDURE `listP`(
	In nomb varchar(100),
    In pric double,
    In Di_fab int
)
BEGIN
	insert into Producto(nombre, precio, idfabricante)
    value(nomb, pric, Di_fab);
END$$

DELIMITER ;
;