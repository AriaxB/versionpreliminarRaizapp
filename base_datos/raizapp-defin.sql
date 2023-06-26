-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema raizapp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema raizapp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `raizapp` DEFAULT CHARACTER SET utf8mb4 ;
USE `raizapp` ;

-- -----------------------------------------------------
-- Table `raizapp`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`usuarios` (
  `id_user` INT(11) NOT NULL,
  `cargo` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `raizapp`.`administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`administrador` (
  `id_admin` INT(11) NOT NULL,
  `contraseña` VARCHAR(20) NULL DEFAULT NULL,
  `correo` VARCHAR(30) NULL DEFAULT NULL,
  `num_telefono` INT(11) NULL DEFAULT NULL,
  `ciudad` VARCHAR(30) NULL DEFAULT NULL,
  `direccion` VARCHAR(30) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(15) NULL DEFAULT NULL,
  `genero` VARCHAR(10) NULL DEFAULT NULL,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `apellido` VARCHAR(30) NULL DEFAULT NULL,
  `id_user` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_admin`),
  INDEX `id_user` (`id_user` ASC) VISIBLE,
  CONSTRAINT `administrador_ibfk_1`
    FOREIGN KEY (`id_user`)
    REFERENCES `raizapp`.`usuarios` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `raizapp`.`emprendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`emprendedor` (
  `ced_emprendedor` INT(11) NOT NULL,
  `nombre_emprendimiento` VARCHAR(25) NULL DEFAULT NULL,
  `contraseña` VARCHAR(20) NULL DEFAULT NULL,
  `correo` VARCHAR(30) NULL DEFAULT NULL,
  `num_telefono` INT(11) NULL DEFAULT NULL,
  `direccion` VARCHAR(30) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `comunidad_etnica` VARCHAR(20) NULL DEFAULT NULL,
  `genero` VARCHAR(10) NULL DEFAULT NULL,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `apellido` VARCHAR(20) NOT NULL,
  `ciudad_emp` VARCHAR(25) NULL DEFAULT NULL,
  `num_cuenta` INT(11) NOT NULL,
  `balance` INT(11) NOT NULL,
  `estado_balance` VARCHAR(15) NULL DEFAULT NULL,
  `id_user` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`ced_emprendedor`),
  INDEX `id_user` (`id_user` ASC) VISIBLE,
  CONSTRAINT `emprendedor_ibfk_1`
    FOREIGN KEY (`id_user`)
    REFERENCES `raizapp`.`usuarios` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `raizapp`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`producto` (
  `nombre_producto` VARCHAR(25) NULL DEFAULT NULL,
  `id_producto` INT(11) NOT NULL,
  `foto` VARCHAR(50) NULL DEFAULT NULL,
  `cantidad_producto` INT(11) NULL DEFAULT NULL,
  `precio` DECIMAL(10,0) NULL DEFAULT NULL,
  `descripcion` VARCHAR(150) NULL DEFAULT NULL,
  `estado_producto` INT(11) NOT NULL,
  `id_catalogo` INT(11) NULL DEFAULT NULL,
  `id_emprendedor` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `id_catalogo` (`id_catalogo` ASC) VISIBLE,
  INDEX `id_emprendedor` (`id_emprendedor` ASC) VISIBLE,
  CONSTRAINT `producto_ibfk_1`
    FOREIGN KEY (`id_catalogo`)
    REFERENCES `raizapp`.`catalogo` (`id_catalogo`),
  CONSTRAINT `producto_ibfk_2`
    FOREIGN KEY (`id_emprendedor`)
    REFERENCES `raizapp`.`emprendedor` (`ced_emprendedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `raizapp`.`catalogo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`catalogo` (
  `nombre_cat` VARCHAR(20) NULL DEFAULT NULL,
  `id_catalogo` INT(11) NOT NULL,
  `id_prod` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_catalogo`),
  INDEX `id_prod` (`id_prod` ASC) VISIBLE,
  CONSTRAINT `catalogo_ibfk_1`
    FOREIGN KEY (`id_prod`)
    REFERENCES `raizapp`.`producto` (`id_producto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `raizapp`.`comprador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`comprador` (
  `doc_comprador` INT(11) NOT NULL,
  `contraseña` VARCHAR(20) NULL DEFAULT NULL,
  `correo` VARCHAR(30) NULL DEFAULT NULL,
  `num_telefono` INT(11) NULL DEFAULT NULL,
  `direccion` VARCHAR(30) NULL DEFAULT NULL,
  `fecha_nacimiento` DATE NULL DEFAULT NULL,
  `nacionalidad` VARCHAR(15) NULL DEFAULT NULL,
  `genero` VARCHAR(10) NULL DEFAULT NULL,
  `nombre_com` VARCHAR(30) NULL DEFAULT NULL,
  `apellido_com` VARCHAR(30) NULL DEFAULT NULL,
  `ciudad_com` VARCHAR(25) NULL DEFAULT NULL,
  `id_user` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`doc_comprador`),
  INDEX `id_user` (`id_user` ASC) VISIBLE,
  CONSTRAINT `comprador_ibfk_1`
    FOREIGN KEY (`id_user`)
    REFERENCES `raizapp`.`usuarios` (`id_user`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `raizapp`.`orden_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`orden_pedido` (
  `numero_orden` INT(11) NOT NULL,
  `precio_total` INT(11) NULL DEFAULT NULL,
  `cantidad_productos` INT(11) NULL DEFAULT NULL,
  `precio_unitario` DECIMAL(10,0) NULL DEFAULT NULL,
  `numero_guia` VARCHAR(20) NULL DEFAULT NULL,
  `id_producto` INT(11) NULL DEFAULT NULL,
  `ced_emprendedor` INT(11) NOT NULL,
  `doc_comprador` INT(11) NOT NULL,
  PRIMARY KEY (`numero_orden`),
  INDEX `id_producto` (`id_producto` ASC) VISIBLE,
  INDEX `ced_emprendedor` (`ced_emprendedor` ASC) VISIBLE,
  INDEX `doc_comprador` (`doc_comprador` ASC) VISIBLE,
  CONSTRAINT `orden_pedido_ibfk_1`
    FOREIGN KEY (`id_producto`)
    REFERENCES `raizapp`.`producto` (`id_producto`),
  CONSTRAINT `orden_pedido_ibfk_2`
    FOREIGN KEY (`ced_emprendedor`)
    REFERENCES `raizapp`.`emprendedor` (`ced_emprendedor`),
  CONSTRAINT `orden_pedido_ibfk_3`
    FOREIGN KEY (`doc_comprador`)
    REFERENCES `raizapp`.`comprador` (`doc_comprador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `raizapp`.`historial_compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`historial_compra` (
  `fecha_hora_compra` DATE NULL DEFAULT NULL,
  `num_orden` INT(11) NULL DEFAULT NULL,
  `id_historial_compra` INT(11) NOT NULL,
  `num_guia` INT(11) NOT NULL,
  `doc_comprador` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_historial_compra`),
  INDEX `doc_comprador` (`doc_comprador` ASC) VISIBLE,
  INDEX `num_orden` (`num_orden` ASC) VISIBLE,
  CONSTRAINT `historial_compra_ibfk_1`
    FOREIGN KEY (`doc_comprador`)
    REFERENCES `raizapp`.`comprador` (`doc_comprador`),
  CONSTRAINT `historial_compra_ibfk_2`
    FOREIGN KEY (`doc_comprador`)
    REFERENCES `raizapp`.`comprador` (`doc_comprador`),
  CONSTRAINT `historial_compra_ibfk_3`
    FOREIGN KEY (`num_orden`)
    REFERENCES `raizapp`.`orden_pedido` (`numero_orden`),
  CONSTRAINT `historial_compra_ibfk_4`
    FOREIGN KEY (`doc_comprador`)
    REFERENCES `raizapp`.`comprador` (`doc_comprador`),
  CONSTRAINT `historial_compra_ibfk_5`
    FOREIGN KEY (`num_orden`)
    REFERENCES `raizapp`.`orden_pedido` (`numero_orden`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `raizapp`.`historial_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`historial_venta` (
  `fecha_hora_venta` DATETIME NULL DEFAULT NULL,
  `id_historial_venta` INT(11) NOT NULL,
  `num_orden` INT(11) NOT NULL,
  `num_guia` INT(11) NOT NULL,
  `ced_emprendedor` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_historial_venta`),
  INDEX `ced_emprendedor` (`ced_emprendedor` ASC) VISIBLE,
  INDEX `num_orden` (`num_orden` ASC) VISIBLE,
  CONSTRAINT `historial_venta_ibfk_1`
    FOREIGN KEY (`ced_emprendedor`)
    REFERENCES `raizapp`.`emprendedor` (`ced_emprendedor`),
  CONSTRAINT `historial_venta_ibfk_2`
    FOREIGN KEY (`num_orden`)
    REFERENCES `raizapp`.`orden_pedido` (`numero_orden`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `raizapp`.`notificacion_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`notificacion_pago` (
  `nombre` VARCHAR(15) NULL DEFAULT NULL,
  `apellido` VARCHAR(15) NULL DEFAULT NULL,
  `cedula` INT(15) NOT NULL,
  `correo` VARCHAR(20) NULL DEFAULT NULL,
  `NoCuenta` INT(15) NULL DEFAULT NULL,
  `balance` DECIMAL(10,0) NULL DEFAULT NULL,
  `estado` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


-- -----------------------------------------------------
-- Table `raizapp`.`notificacion_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `raizapp`.`notificacion_pedido` (
  `fecha` DATE NULL DEFAULT NULL,
  `descripcion` VARCHAR(120) NULL DEFAULT NULL,
  `numero_notificacion_pedido` INT(11) NOT NULL,
  `doc_comprador` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`numero_notificacion_pedido`),
  INDEX `doc_comprador` (`doc_comprador` ASC) VISIBLE,
  CONSTRAINT `notificacion_pedido_ibfk_1`
    FOREIGN KEY (`doc_comprador`)
    REFERENCES `raizapp`.`comprador` (`doc_comprador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;