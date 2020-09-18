/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.4.11-MariaDB : Database - moduloprueba
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`moduloprueba` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `moduloprueba`;

/*Table structure for table `biblioteca` */

DROP TABLE IF EXISTS `biblioteca`;

CREATE TABLE `biblioteca` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODIGO ATC` varchar(90) DEFAULT NULL,
  `DESCRIPCION` varchar(120) DEFAULT NULL,
  `FORMA FARMACEUTICA` varchar(90) DEFAULT NULL,
  `CONCENTRACION` varchar(60) DEFAULT NULL,
  `NIVEL DE PRESCRIPCION` varchar(60) DEFAULT NULL,
  `NIVEL DE ATENCION` varchar(60) DEFAULT NULL,
  `VIA ADM` varchar(60) DEFAULT NULL,
  `USO` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=770 DEFAULT CHARSET=latin1;

/*Table structure for table `bitacora_faltantes` */

DROP TABLE IF EXISTS `bitacora_faltantes`;

CREATE TABLE `bitacora_faltantes` (
  `id_bitacora_faltantes` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) NOT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL,
  `cantidad` int(20) NOT NULL,
  PRIMARY KEY (`id_bitacora_faltantes`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Table structure for table `bitacora_precios` */

DROP TABLE IF EXISTS `bitacora_precios`;

CREATE TABLE `bitacora_precios` (
  `id_bitacora_precio` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) NOT NULL,
  `precio_compra` double(5,2) NOT NULL,
  `precio_venta` double(5,2) NOT NULL,
  `fecha_registro` datetime NOT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_bitacora_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

/*Table structure for table `cabecera_compra` */

DROP TABLE IF EXISTS `cabecera_compra`;

CREATE TABLE `cabecera_compra` (
  `id_cabecera_compra` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_proveedor` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `plazo` varchar(45) NOT NULL,
  `id_sucursal` bigint(20) DEFAULT NULL,
  `id_tipoPago` bigint(20) NOT NULL,
  `iva` decimal(10,7) NOT NULL,
  `descuento` decimal(10,7) NOT NULL,
  `total` decimal(10,7) NOT NULL,
  `estado` varchar(1) NOT NULL,
  PRIMARY KEY (`id_cabecera_compra`),
  KEY `fk_proveedor_cabcom` (`id_proveedor`),
  KEY `fk_sucursal_cabecera` (`id_sucursal`),
  KEY `fk_cabecera_TipoPago` (`id_tipoPago`),
  CONSTRAINT `fk_cabecera_TipoPago` FOREIGN KEY (`id_tipoPago`) REFERENCES `pagos` (`id_pagos`),
  CONSTRAINT `fk_proveedor_cabcom` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `fk_sucursal_cabcom` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Table structure for table `cabecera_nota_pedidos` */

DROP TABLE IF EXISTS `cabecera_nota_pedidos`;

CREATE TABLE `cabecera_nota_pedidos` (
  `id_cabecera_nota_pedidos` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` bigint(11) NOT NULL,
  `id_usuario` bigint(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `estado` varchar(2) NOT NULL,
  `plazo` varchar(45) NOT NULL,
  `forma_pago` varchar(45) NOT NULL,
  `iva` decimal(10,7) NOT NULL,
  `descuento` decimal(10,7) NOT NULL,
  `total` decimal(10,7) NOT NULL,
  PRIMARY KEY (`id_cabecera_nota_pedidos`),
  KEY `fk_cabecera_nota_pedidos_proveedor_idx` (`id_proveedor`),
  KEY `fk_cabecera_nota_pedidos_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_cabecera_nota_pedidos_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1;

/*Table structure for table `cabecera_venta` */

DROP TABLE IF EXISTS `cabecera_venta`;

CREATE TABLE `cabecera_venta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `num_venta` varchar(70) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `id_cliente` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(11) DEFAULT NULL,
  `id_sucursal` bigint(20) DEFAULT NULL,
  `tipo_pago` text DEFAULT NULL,
  `tipo_venta` text DEFAULT NULL,
  `subtotal_con_iva` decimal(10,7) NOT NULL,
  `subtotal_sin_iva` decimal(10,7) NOT NULL,
  `iva_total` decimal(10,7) NOT NULL,
  `descuento_total` decimal(10,7) NOT NULL,
  `total` decimal(10,7) NOT NULL,
  `utilidad` decimal(10,7) NOT NULL,
  `estado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cliente` (`id_cliente`),
  KEY `fk_id_usuario` (`id_usuario`),
  KEY `fk_id_sucursal` (`id_sucursal`),
  CONSTRAINT `fk_id_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_Clientes`),
  CONSTRAINT `fk_id_sucursal` FOREIGN KEY (`id_sucursal`) REFERENCES `sucursal` (`id_sucursal`),
  CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `fc_session` (`id_sesion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Table structure for table `caja_app` */

DROP TABLE IF EXISTS `caja_app`;

CREATE TABLE `caja_app` (
  `id_caja_app` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_caja_app` varchar(45) NOT NULL,
  `fecha_registro_app` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_caja_app`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1;

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id_categoria` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `usuario_creacion` varchar(20) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(20) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id_Clientes` bigint(20) NOT NULL AUTO_INCREMENT,
  `Cedula` text NOT NULL,
  `Nombre` text NOT NULL,
  `Apellido` text NOT NULL,
  `Direccion` text NOT NULL,
  `Fecha_reg` date NOT NULL,
  `Estado` char(1) NOT NULL,
  `str_telefono` text NOT NULL,
  `str_correo` text NOT NULL,
  PRIMARY KEY (`id_Clientes`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `codigobarra_app` */

DROP TABLE IF EXISTS `codigobarra_app`;

CREATE TABLE `codigobarra_app` (
  `id_codigobarras_app` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigobarra_app` varchar(45) NOT NULL,
  `nombre_codigo_app` varchar(45) NOT NULL,
  `id_caja_resgistra_codigobarra` bigint(20) NOT NULL,
  `fecha_registrocodigo_app` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_codigobarras_app`),
  UNIQUE KEY `codigobarra_app_UNIQUE` (`codigobarra_app`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Table structure for table `correo` */

DROP TABLE IF EXISTS `correo`;

CREATE TABLE `correo` (
  `id_Correo` bigint(20) NOT NULL AUTO_INCREMENT,
  `Correo` text NOT NULL,
  `Cedula` text NOT NULL,
  PRIMARY KEY (`id_Correo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

/*Table structure for table `detalle_compra` */

DROP TABLE IF EXISTS `detalle_compra`;

CREATE TABLE `detalle_compra` (
  `id_detalle_compra` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cabecera_compra` bigint(20) NOT NULL,
  `id_precio` bigint(20) NOT NULL,
  `cantidad` bigint(20) NOT NULL,
  `precio` decimal(10,7) NOT NULL,
  `descuento` decimal(10,7) NOT NULL,
  `iva` decimal(10,7) NOT NULL,
  `total` decimal(10,7) NOT NULL,
  `bono` bigint(20) NOT NULL,
  `fecha_caducidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `fk_cabcom_detcom` (`id_cabecera_compra`),
  KEY `fk_det_precios` (`id_precio`),
  CONSTRAINT `fk_cabcom_detcom` FOREIGN KEY (`id_cabecera_compra`) REFERENCES `cabecera_compra` (`id_cabecera_compra`),
  CONSTRAINT `fk_det_precios` FOREIGN KEY (`id_precio`) REFERENCES `precios` (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Table structure for table `detalle_faltantes` */

DROP TABLE IF EXISTS `detalle_faltantes`;

CREATE TABLE `detalle_faltantes` (
  `id_detalle_faltantes` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) NOT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL,
  `cantidad` int(11) NOT NULL,
  `estado` varchar(2) NOT NULL,
  PRIMARY KEY (`id_detalle_faltantes`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `fk_pro_detfal` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_productos`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Table structure for table `detalle_nota_pedidos` */

DROP TABLE IF EXISTS `detalle_nota_pedidos`;

CREATE TABLE `detalle_nota_pedidos` (
  `id_detalle_nota_pedidos` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_precio` bigint(11) NOT NULL,
  `id_cabecera_nota_pedidos` bigint(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,7) NOT NULL,
  `descuento` decimal(10,7) NOT NULL,
  `iva` decimal(10,7) NOT NULL,
  `total` decimal(10,7) NOT NULL,
  `bono` int(11) NOT NULL,
  `fecha_caducidad` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_nota_pedidos`),
  KEY `fk_detalle_nota_pedidos_cabecera_idx` (`id_cabecera_nota_pedidos`),
  KEY `fk_detalle_nota_pedidos_precio_idx` (`id_precio`),
  CONSTRAINT `fk_detalle_nota_pedidos_cabecera` FOREIGN KEY (`id_cabecera_nota_pedidos`) REFERENCES `cabecera_nota_pedidos` (`id_cabecera_nota_pedidos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_nota_pedidos_precio` FOREIGN KEY (`id_precio`) REFERENCES `precios` (`id_precio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

/*Table structure for table `detalle_venta` */

DROP TABLE IF EXISTS `detalle_venta`;

CREATE TABLE `detalle_venta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cabecera_venta` bigint(20) DEFAULT NULL,
  `id_control` bigint(20) NOT NULL,
  `precio` decimal(10,7) DEFAULT NULL,
  `cantidad` bigint(30) NOT NULL,
  `iva` decimal(10,7) DEFAULT NULL,
  `descuento` decimal(10,7) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cabecera_venta` (`id_cabecera_venta`),
  KEY `fk_id_control` (`id_control`),
  CONSTRAINT `fk_id_cabecera_venta` FOREIGN KEY (`id_cabecera_venta`) REFERENCES `cabecera_venta` (`id`),
  CONSTRAINT `fk_id_control` FOREIGN KEY (`id_control`) REFERENCES `precios` (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

/*Table structure for table `fc_bitacora_registros_usuario` */

DROP TABLE IF EXISTS `fc_bitacora_registros_usuario`;

CREATE TABLE `fc_bitacora_registros_usuario` (
  `id_bitacora` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `cedula` text DEFAULT NULL,
  `nombres` text DEFAULT NULL,
  `apellidos` text DEFAULT NULL,
  `telefono` text DEFAULT NULL,
  `convencional` text DEFAULT NULL,
  `correo` text DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `estado` text DEFAULT NULL,
  `ip_equipo` text DEFAULT NULL,
  `ip_publica` text DEFAULT NULL,
  `usuario_equipo` text DEFAULT NULL,
  `dir_ip_completa` text DEFAULT NULL,
  `genero` text DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `rol` text DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `accion` text DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`id_bitacora`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

/*Table structure for table `fc_bitacora_seguridad` */

DROP TABLE IF EXISTS `fc_bitacora_seguridad`;

CREATE TABLE `fc_bitacora_seguridad` (
  `id_bitacora_seguridad` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` text NOT NULL,
  `password` text NOT NULL,
  `ip_equipo` text NOT NULL,
  `ip_publico` text NOT NULL,
  `usuario_equipo` text NOT NULL,
  `fecha_login` datetime NOT NULL,
  `dir_ip_completa` text NOT NULL,
  `Verficacion` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_bitacora_seguridad`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=latin1;

/*Table structure for table `fc_discapacidad` */

DROP TABLE IF EXISTS `fc_discapacidad`;

CREATE TABLE `fc_discapacidad` (
  `id_discapacidad` bigint(20) NOT NULL AUTO_INCREMENT,
  `discapacidad` text DEFAULT NULL,
  PRIMARY KEY (`id_discapacidad`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `fc_estado_usuario` */

DROP TABLE IF EXISTS `fc_estado_usuario`;

CREATE TABLE `fc_estado_usuario` (
  `id_estado` bigint(20) NOT NULL AUTO_INCREMENT,
  `estado` text DEFAULT NULL,
  PRIMARY KEY (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `fc_genero` */

DROP TABLE IF EXISTS `fc_genero`;

CREATE TABLE `fc_genero` (
  `id_genero` bigint(20) NOT NULL AUTO_INCREMENT,
  `genero` text DEFAULT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `fc_localidad_guayas` */

DROP TABLE IF EXISTS `fc_localidad_guayas`;

CREATE TABLE `fc_localidad_guayas` (
  `id_localidad_guayas` bigint(20) NOT NULL AUTO_INCREMENT,
  `localidad` text DEFAULT NULL,
  PRIMARY KEY (`id_localidad_guayas`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Table structure for table `fc_punto_venta` */

DROP TABLE IF EXISTS `fc_punto_venta`;

CREATE TABLE `fc_punto_venta` (
  `id_punto_venta` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` text DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono_pv` text DEFAULT NULL,
  `ip_publica` text DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_actualizacion` date DEFAULT NULL,
  `ruc_local` text DEFAULT NULL,
  `id_localidad_guayas` bigint(20) DEFAULT NULL,
  `estado` text DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  PRIMARY KEY (`id_punto_venta`),
  KEY `id_localidad_guayas` (`id_localidad_guayas`),
  CONSTRAINT `fc_punto_venta_ibfk_1` FOREIGN KEY (`id_localidad_guayas`) REFERENCES `fc_localidad_guayas` (`id_localidad_guayas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `fc_rol` */

DROP TABLE IF EXISTS `fc_rol`;

CREATE TABLE `fc_rol` (
  `id_rol` bigint(20) NOT NULL AUTO_INCREMENT,
  `cargo` text DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `fc_session` */

DROP TABLE IF EXISTS `fc_session`;

CREATE TABLE `fc_session` (
  `id_sesion` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint(20) DEFAULT NULL,
  `id_rol` bigint(20) DEFAULT NULL,
  `observacion` text DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `id_punto_venta` bigint(20) DEFAULT NULL,
  `id_punto_venta_dos` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_sesion`),
  KEY `fk_fc_session_usuario_idx` (`id_usuario`),
  KEY `id_rol` (`id_rol`),
  KEY `id_punto_venta` (`id_punto_venta`),
  KEY `id_punto_venta_dos` (`id_punto_venta_dos`),
  CONSTRAINT `fc_session_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `fc_rol` (`id_rol`),
  CONSTRAINT `fc_session_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `fc_usuario` (`id_usuario`),
  CONSTRAINT `fc_session_ibfk_3` FOREIGN KEY (`id_punto_venta`) REFERENCES `fc_punto_venta` (`id_punto_venta`),
  CONSTRAINT `fc_session_ibfk_4` FOREIGN KEY (`id_punto_venta_dos`) REFERENCES `fc_punto_venta` (`id_punto_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

/*Table structure for table `fc_usuario` */

DROP TABLE IF EXISTS `fc_usuario`;

CREATE TABLE `fc_usuario` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `cedula` text NOT NULL,
  `nombres` text NOT NULL,
  `apellidos` text NOT NULL,
  `telefono` text DEFAULT NULL,
  `convencional` text DEFAULT NULL,
  `correo` text NOT NULL,
  `password` text NOT NULL,
  `ruta_imagen` text DEFAULT NULL,
  `fecha_registro` date NOT NULL,
  `id_estado` bigint(20) DEFAULT NULL,
  `ip_equipo` text NOT NULL,
  `ip_publica` text CHARACTER SET cp850 NOT NULL,
  `usuario_equipo` text NOT NULL,
  `dir_ip_completa` text NOT NULL,
  `id_genero` bigint(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `id_genero` (`id_genero`),
  KEY `id_estado` (`id_estado`),
  CONSTRAINT `fc_usuario_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `fc_genero` (`id_genero`),
  CONSTRAINT `fc_usuario_ibfk_4` FOREIGN KEY (`id_estado`) REFERENCES `fc_estado_usuario` (`id_estado`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

/*Table structure for table `iva` */

DROP TABLE IF EXISTS `iva`;

CREATE TABLE `iva` (
  `id_iva` int(11) NOT NULL AUTO_INCREMENT,
  `iva` double DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `est` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_iva`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Table structure for table `kardex` */

DROP TABLE IF EXISTS `kardex`;

CREATE TABLE `kardex` (
  `idkardex` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) NOT NULL,
  `id_cabecera_compra` bigint(20) DEFAULT NULL,
  `id_detalle_compra` bigint(20) DEFAULT NULL,
  `id_cabecera_venta` bigint(20) DEFAULT NULL,
  `id_detalle_venta` bigint(20) DEFAULT NULL,
  `id_precio` bigint(20) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `total` double(7,2) DEFAULT NULL,
  `fecha_generada` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idkardex`),
  KEY `fk_kardex_idx` (`id_producto`),
  KEY `id_cabecera_compra` (`id_cabecera_compra`),
  KEY `id_detalle_compra` (`id_detalle_compra`),
  KEY `id_cabecera_venta` (`id_cabecera_venta`),
  KEY `id_detalle_venta` (`id_detalle_venta`),
  KEY `id_precio` (`id_precio`),
  CONSTRAINT `fk_kardex` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_productos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `kardex_ibfk_1` FOREIGN KEY (`id_cabecera_compra`) REFERENCES `cabecera_compra` (`id_cabecera_compra`),
  CONSTRAINT `kardex_ibfk_2` FOREIGN KEY (`id_detalle_compra`) REFERENCES `detalle_compra` (`id_detalle_compra`),
  CONSTRAINT `kardex_ibfk_3` FOREIGN KEY (`id_cabecera_venta`) REFERENCES `cabecera_venta` (`id`),
  CONSTRAINT `kardex_ibfk_4` FOREIGN KEY (`id_detalle_venta`) REFERENCES `detalle_venta` (`id`),
  CONSTRAINT `kardex_ibfk_5` FOREIGN KEY (`id_precio`) REFERENCES `precios` (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `laboratorio` */

DROP TABLE IF EXISTS `laboratorio`;

CREATE TABLE `laboratorio` (
  `id_Laboratorio` bigint(20) NOT NULL AUTO_INCREMENT,
  `RUC` text NOT NULL,
  `Nombre` text NOT NULL,
  `Direccion` text NOT NULL,
  `Telefono` text NOT NULL,
  `Fecha` date NOT NULL,
  `Imagen` text NOT NULL,
  `Correo` text NOT NULL,
  PRIMARY KEY (`id_Laboratorio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Table structure for table `marcas` */

DROP TABLE IF EXISTS `marcas`;

CREATE TABLE `marcas` (
  `id_marcas` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_marcas`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Table structure for table `medidas` */

DROP TABLE IF EXISTS `medidas`;

CREATE TABLE `medidas` (
  `id_medidas` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre_medida` varchar(80) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_medidas`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Table structure for table `pagos` */

DROP TABLE IF EXISTS `pagos`;

CREATE TABLE `pagos` (
  `id_pagos` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_pagos`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `precios` */

DROP TABLE IF EXISTS `precios`;

CREATE TABLE `precios` (
  `id_precio` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_producto` bigint(20) DEFAULT NULL,
  `precio_base` double(5,2) DEFAULT NULL,
  `precio_compra` double(5,2) DEFAULT NULL,
  `precio_venta` double(5,2) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `fecha_registro` datetime DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `porcentaje` bigint(20) DEFAULT NULL,
  `descuentoVenta` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_precio`),
  KEY `fk_precios_productos` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

/*Table structure for table `presentaciones` */

DROP TABLE IF EXISTS `presentaciones`;

CREATE TABLE `presentaciones` (
  `idPresentaciones` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `usuarioCreacion` varchar(45) DEFAULT NULL,
  `fechaCreacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idPresentaciones`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id_productos` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(80) NOT NULL,
  `fecha_registro` date NOT NULL,
  `peso` double(7,2) NOT NULL,
  `id_tipo` bigint(20) NOT NULL,
  `id_medidas` bigint(20) NOT NULL,
  `id_categoria` bigint(20) NOT NULL,
  `id_marcas` bigint(20) NOT NULL,
  `estado` varchar(1) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  `iva` varchar(15) NOT NULL,
  `cantidad_minima` bigint(20) DEFAULT NULL,
  `receta` varchar(20) DEFAULT NULL,
  `unidades` bigint(20) DEFAULT NULL,
  `codigo_barras` varchar(30) DEFAULT NULL,
  `id_presentacion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_productos`),
  KEY `fk_tipos_productos` (`id_tipo`),
  KEY `fk_medidas_productos` (`id_medidas`),
  KEY `fk_envase_productos` (`id_categoria`),
  KEY `fk_marcas_productos` (`id_marcas`),
  KEY `fk_productos_presentaciones1` (`id_presentacion`),
  CONSTRAINT `fk_envase_productos` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`),
  CONSTRAINT `fk_marcas_productos` FOREIGN KEY (`id_marcas`) REFERENCES `marcas` (`id_marcas`),
  CONSTRAINT `fk_medidas_productos` FOREIGN KEY (`id_medidas`) REFERENCES `medidas` (`id_medidas`),
  CONSTRAINT `fk_productos_presentaciones1` FOREIGN KEY (`id_presentacion`) REFERENCES `presentaciones` (`idPresentaciones`),
  CONSTRAINT `fk_tipos_productos` FOREIGN KEY (`id_tipo`) REFERENCES `tipo` (`id_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

/*Table structure for table `productos_app` */

DROP TABLE IF EXISTS `productos_app`;

CREATE TABLE `productos_app` (
  `id_productos` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(120) DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `peso` double(7,2) DEFAULT NULL,
  `id_tipo` bigint(20) DEFAULT NULL,
  `id_medidas` bigint(20) DEFAULT NULL,
  `id_categoria` bigint(20) DEFAULT NULL,
  `id_marcas` bigint(20) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `iva` varchar(15) DEFAULT NULL,
  `cantidad_minima` bigint(20) DEFAULT NULL,
  `receta` varchar(20) DEFAULT NULL,
  `unidades` bigint(20) DEFAULT NULL,
  `codigo_barras` varchar(30) NOT NULL,
  `registro_actualizado` varchar(5) DEFAULT NULL,
  `precio_producto_app` varchar(45) DEFAULT NULL,
  `id_presentacion` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_productos`),
  UNIQUE KEY `codigo_barras_UNIQUE` (`codigo_barras`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `id_proveedor` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_proveedor_clase` bigint(20) NOT NULL,
  `cedula_ruc` varchar(15) NOT NULL,
  `entidad` varchar(100) NOT NULL,
  `representante` varchar(70) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `fecha_registro` date NOT NULL,
  `estado` varchar(1) NOT NULL,
  `telefono` varchar(70) NOT NULL,
  `correo` varchar(70) DEFAULT NULL,
  `direccionImagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  KEY `fk_1` (`id_proveedor_clase`),
  CONSTRAINT `fk_clase_proveedor` FOREIGN KEY (`id_proveedor_clase`) REFERENCES `proveedor_clase` (`id_proclase`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Table structure for table `proveedor_clase` */

DROP TABLE IF EXISTS `proveedor_clase`;

CREATE TABLE `proveedor_clase` (
  `id_proclase` bigint(20) NOT NULL AUTO_INCREMENT,
  `clase` varchar(50) NOT NULL,
  PRIMARY KEY (`id_proclase`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `proveedor_mail` */

DROP TABLE IF EXISTS `proveedor_mail`;

CREATE TABLE `proveedor_mail` (
  `id_promail` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tipo_correo` bigint(20) NOT NULL,
  `mail` varchar(70) NOT NULL,
  `cedula_ruc` varchar(15) NOT NULL,
  PRIMARY KEY (`id_promail`),
  KEY `fk_tipo_correo` (`id_tipo_correo`),
  CONSTRAINT `fk_tipo_correo` FOREIGN KEY (`id_tipo_correo`) REFERENCES `tipo_correo` (`id_tipo_correo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Table structure for table `proveedor_telefono` */

DROP TABLE IF EXISTS `proveedor_telefono`;

CREATE TABLE `proveedor_telefono` (
  `id_protelefono` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tipo_telefono` bigint(20) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `cedula_ruc` varchar(15) NOT NULL,
  PRIMARY KEY (`id_protelefono`),
  KEY `fk_tipo_telefeono` (`id_tipo_telefono`),
  CONSTRAINT `fk_tipo_telefeono` FOREIGN KEY (`id_tipo_telefono`) REFERENCES `tipo_telefono` (`id_tipo_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Table structure for table `stock` */

DROP TABLE IF EXISTS `stock`;

CREATE TABLE `stock` (
  `id_stock` bigint(20) NOT NULL AUTO_INCREMENT,
  `cantidad` bigint(20) NOT NULL,
  `id_precio` bigint(20) NOT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `fk_stock_precios` (`id_precio`),
  CONSTRAINT `fk_stock_precios` FOREIGN KEY (`id_precio`) REFERENCES `precios` (`id_precio`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

/*Table structure for table `sucursal` */

DROP TABLE IF EXISTS `sucursal`;

CREATE TABLE `sucursal` (
  `id_sucursal` bigint(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(15) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `representante` varchar(70) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(70) DEFAULT NULL,
  `id_proveedor` bigint(11) NOT NULL,
  PRIMARY KEY (`id_sucursal`),
  KEY `fk_4` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `telefono` */

DROP TABLE IF EXISTS `telefono`;

CREATE TABLE `telefono` (
  `id_Telefono` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_Tipo_Telefono` bigint(20) NOT NULL,
  `Numero` text NOT NULL,
  `Cedula` text NOT NULL,
  PRIMARY KEY (`id_Telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

/*Table structure for table `tipo` */

DROP TABLE IF EXISTS `tipo`;

CREATE TABLE `tipo` (
  `id_tipo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`id_tipo`),
  KEY `fk_tipo_subtipo` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

/*Table structure for table `tipo_correo` */

DROP TABLE IF EXISTS `tipo_correo`;

CREATE TABLE `tipo_correo` (
  `id_tipo_correo` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  PRIMARY KEY (`id_tipo_correo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `tipo_telefono` */

DROP TABLE IF EXISTS `tipo_telefono`;

CREATE TABLE `tipo_telefono` (
  `id_tipo_telefono` bigint(20) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  PRIMARY KEY (`id_tipo_telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Table structure for table `tipo_telefono_cliente` */

DROP TABLE IF EXISTS `tipo_telefono_cliente`;

CREATE TABLE `tipo_telefono_cliente` (
  `id_Tipo_Telefono` bigint(20) NOT NULL AUTO_INCREMENT,
  `Tipo` text NOT NULL,
  PRIMARY KEY (`id_Tipo_Telefono`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/* Trigger structure for table `productos_app` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `insertarproductoprincipalmodificacion` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `insertarproductoprincipalmodificacion` AFTER UPDATE ON `productos_app` FOR EACH ROW INSERT INTO productos (nombre, descripcion, fecha_registro,peso, id_tipo, id_medidas, id_categoria, id_marcas, estado,id_usuario, iva, cantidad_minima, receta, unidades, codigo_barras,id_presentacion) 
VALUES (old.nombre, old.descripcion, now(), new.peso, new.id_tipo, new.id_medidas, new.id_categoria, new.id_marcas, new.estado, old.id_usuario, new.iva, new.cantidad_minima, new.receta, new.unidades, 
old.codigo_barras,new.id_presentacion) */$$


DELIMITER ;

/* Function  structure for function  `EncontrarID` */

/*!50003 DROP FUNCTION IF EXISTS `EncontrarID` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `EncontrarID`(nombre1 varchar(80),id_marcas1 bigint(20),id_medidas1 bigint(20),id_tipo1 bigint(20),id_categoria1 bigint(20),id_presentacion1 bigint(20)) RETURNS int(11)
BEGIN
	DECLARE valor INT; 
        set valor = (SELECT `id_productos` FROM `productos` WHERE `nombre`= nombre1 AND `id_marcas`= id_marcas1 AND `id_medidas`= id_medidas1 AND `id_tipo`= id_tipo1 AND `id_categoria`= id_categoria1 AND `id_presentacion`= id_presentacion1);
        RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `validacion` */

/*!50003 DROP FUNCTION IF EXISTS `validacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `validacion`(ruc1 text) RETURNS int(11)
BEGIN
declare resultado int;
select count(id_Laboratorio) into resultado from Laboratorio where RUC=ruc1;
RETURN resultado;
END */$$
DELIMITER ;

/* Function  structure for function  `validarCategoriaProducto` */

/*!50003 DROP FUNCTION IF EXISTS `validarCategoriaProducto` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `validarCategoriaProducto`(nombre1 varchar(80)) RETURNS int(11)
BEGIN
	declare valor int; 
    SELECT COUNT(id_categoria)INTO valor FROM categoria
	WHERE nombre = nombre1 and estado = 'A';
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `validarMarcaProducto` */

/*!50003 DROP FUNCTION IF EXISTS `validarMarcaProducto` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `validarMarcaProducto`(nombre1 VARCHAR(80)) RETURNS int(11)
BEGIN
	DECLARE valor INT; 
        SELECT COUNT(`id_marcas`)INTO valor FROM marcas
        WHERE nombre = nombre1 ;
        RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `validarMedidaProducto` */

/*!50003 DROP FUNCTION IF EXISTS `validarMedidaProducto` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `validarMedidaProducto`(nombre_medida1 varchar(80)) RETURNS int(11)
BEGIN
	DECLARE valor INT; 
        SELECT COUNT(`id_medidas`)INTO valor FROM medidas
        WHERE nombre_medida = nombre_medida1;
        RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `validarPresentacionesProducto` */

/*!50003 DROP FUNCTION IF EXISTS `validarPresentacionesProducto` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `validarPresentacionesProducto`(nombre1 varchar(80)) RETURNS int(11)
BEGIN
	declare valor int; 
    SELECT COUNT(idPresentaciones)INTO valor FROM presentaciones
	WHERE nombre = nombre1 and estado = 'A';
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `validarProveedor` */

/*!50003 DROP FUNCTION IF EXISTS `validarProveedor` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `validarProveedor`(cedula varchar(15)) RETURNS int(11)
BEGIN
	DECLARE val INT;
        SELECT COUNT(cedula_ruc) INTO val FROM proveedor WHERE cedula_ruc = cedula;
        RETURN val;
    END */$$
DELIMITER ;

/* Function  structure for function  `validarPrueba` */

/*!50003 DROP FUNCTION IF EXISTS `validarPrueba` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `validarPrueba`(nombre1 text, apellido1 text,direccion1 text ) RETURNS bigint(20)
BEGIN
declare resultado bigint;
select  id_Clientes into resultado from Clientes
where nombre= nombre1 and Apellido=apellido1 and direccion=direccion1;
RETURN resultado;
END */$$
DELIMITER ;

/* Function  structure for function  `validarTipoProducto` */

/*!50003 DROP FUNCTION IF EXISTS `validarTipoProducto` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `validarTipoProducto`(nombre1 varchar(80)) RETURNS int(11)
BEGIN
	declare valor int; 
        SELECT COUNT(`id_tipo`)INTO valor FROM tipo
        WHERE nombre = nombre1 and estado = 'A';
        return valor;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ActivarEstadoNotaPedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `ActivarEstadoNotaPedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ActivarEstadoNotaPedido`(IN id_cabecera_nota_pedidos1 BIGINT,
OUT valor TEXT)
BEGIN
	UPDATE cabecera_nota_pedidos 
	SET estado = 'SI'
	WHERE id_cabecera_nota_pedidos = id_cabecera_nota_pedidos1;
	SET valor ='Actualizado';
END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizar` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar`(in id_Laboratorio1 bigint, in RUC1 text, in nombre1 text,
in direccion1 text, in telefono1 text, in fecha1 date, in imagen1 text, in correo1 text, out valor text)
BEGIN
update laboratorio set RUC= RUC1 , Nombre = nombre1,
Direccion = direccion1, Telefono = telefono1, 
Fecha = fecha1, Imagen = imagen1, Correo = correo1 where id_Laboratorio = id_Laboratorio1;
set valor = 'Laboratorio actualizado';
END */$$
DELIMITER ;

/* Procedure structure for procedure `ActualizarCabeceraNotaPedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `ActualizarCabeceraNotaPedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarCabeceraNotaPedido`(in plazo1 text, in formapago2 text, in iva3 decimal(10,7),
in descuento4 decimal(10,7),in total5 decimal(10,7),in idcab6 decimal(10,7),out valor text)
BEGIN
	UPDATE `cabecera_nota_pedidos` SET `plazo`=plazo1,`forma_pago`=formapago2,`iva`=iva3,`descuento`=descuento4,`total`=total5 WHERE `id_cabecera_nota_pedidos`= idcab6;
	set valor ='actualizacion con exito';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizarCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizarCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarCliente`(
in cedula123 text,
in nombre text,
in apellido text,
in direccion text,
in telefono text,
in correo text,
out msg text)
BEGIN
declare fecha_reg date;
select now() into fecha_reg;
 UPDATE Clientes set 
 Nombre = nombre,
 Apellido = apellido,
 Direccion = direccion,
 Fecha_reg = fecha_reg,
 str_telefono = telefono,
 str_correo = correo
 WHERE Cedula = cedula123;
 set msg = 'Cliente Actualizado Con Éxito!!';
END */$$
DELIMITER ;

/* Procedure structure for procedure `ActualizarDetalleCompras` */

/*!50003 DROP PROCEDURE IF EXISTS  `ActualizarDetalleCompras` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDetalleCompras`(IN id_detalle_nota_pedidos1 BIGINT,
IN cantidad1 INT,IN descuento1 DECIMAL(10,7),IN iva1 DECIMAL(10,7) ,IN total1 DECIMAL(10,7),IN bono1 BIGINT,
in idCompra bigint,in id_precio2 bigint,in cantAnt bigint,OUT valor TEXT)
BEGIN
	DECLARE id_preciox BIGINT;
	DECLARE cantidadx BIGINT;
	DECLARE cant BIGINT;
	DECLARE cantcomp BIGINT;
	DECLARE id_productox BIGINT;
	DECLARE cant_faltante BIGINT;
	declare operacion bigint;
	
	UPDATE `detalle_nota_pedidos` SET  cantidad = cantidad1,descuento = descuento1,iva = iva1,total = total1,`bono`= bono1
	WHERE id_detalle_nota_pedidos = id_detalle_nota_pedidos1;
	
	UPDATE `detalle_compra` SET  cantidad = cantidad1,descuento = descuento1,iva = iva1,total = total1,`bono`= bono1
	WHERE `id_detalle_compra` = idCompra ;
	
	SELECT `id_precio` INTO  id_preciox  FROM `stock` WHERE `id_precio`=id_precio2;
	
	IF(id_preciox = id_precio2)THEN
	
		if(cantAnt < cantidad1)then
			set operacion=(cantidad1-cantAnt);
			SET cantidadx =(SELECT `cantidad` FROM `stock` WHERE `id_precio`= id_precio2);
			SET cant =(cantidadx + operacion);
			UPDATE `stock` SET `cantidad` = cant WHERE `id_precio` = id_precio2;
			end if;
		if(cantAnt > cantidad1)then
			set operacion= (cantAnt - cantidad1);
			SET cantidadx= (SELECT `cantidad` FROM `stock` WHERE `id_precio`= id_precio2);
			SET cant =(cantidadx - operacion);
			UPDATE `stock` SET `cantidad` = cant WHERE `id_precio` = id_precio2;	
			end if;
	
	END IF;
		
	
	
	SET valor ='Detalles Actualizado';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ActualizarDetalleIndividualNotaPedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `ActualizarDetalleIndividualNotaPedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDetalleIndividualNotaPedido`(in id_detalle_nota_pedidos1 BIGINT,
in cantidad1 int,in descuento1 Double,in iva1 Double ,in total1 Double )
BEGIN
UPDATE `detalle_nota_pedidos` SET  
cantidad = cantidad1,
descuento = descuento1,
iva = iva1,
total = total1 
WHERE id_detalle_nota_pedidos = id_detalle_nota_pedidos1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `ActualizarDetalleNotaPedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `ActualizarDetalleNotaPedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarDetalleNotaPedido`(IN id_detalle_nota_pedidos1 BIGINT,
IN cantidad1 INT,IN descuento1 decimal(10,7),IN iva1 decimal(10,7) ,IN total1 decimal(10,7),in bono1 bigint,OUT valor TEXT)
BEGIN
UPDATE `detalle_nota_pedidos` SET  
cantidad = cantidad1,
descuento = descuento1,
iva = iva1,
total = total1,
`bono`= bono1
WHERE id_detalle_nota_pedidos = id_detalle_nota_pedidos1;
SET valor ='Detalle Actualizado';
END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizarPrecioCompra` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizarPrecioCompra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarPrecioCompra`(IN id_producto1 BIGINT,in precioBase2 double(5,2),IN precio_compra2 DOUBLE(5,2),IN precio_venta3 DOUBLE(5,2),in fecha4 datetime,in id_usu bigint,IN Porcen BIGINT,in descvent bigint,OUT valor1 TEXT )
BEGIN
	DECLARE id_pre INT;
	INSERT INTO `precios`(`id_producto`,`precio_base`,`precio_compra`,`precio_venta`,`estado`,`fecha_registro`,`id_usuario`,`porcentaje`,`descuentoVenta`) VALUES (id_producto1,precioBase2,precio_compra2,precio_venta3,'A',fecha4,id_usu,Porcen,descvent);
	set valor1='PRECIO AGREGADO';
   -- SET id_pre =(SELECT `id_precio` FROM `precios` WHERE `id_producto`=id_producto1 AND`precio_compra`=precio_compra2 AND `precio_venta`= precio_venta3);
    -- UPDATE `precios` SET estado='I' WHERE `id_precio` NOT IN (id_pre) AND `id_producto`=id_producto1;
	-- SET valor1=(SELECT `id_precio` FROM `precios` WHERE `id_producto`=id_producto1 AND `precio_compra`= precio_compra2 AND`precio_venta`=precio_venta3);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizarPrecioConvertidor` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizarPrecioConvertidor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarPrecioConvertidor`(IN id_producto1 BIGINT,IN precio_compra2 DOUBLE(5,2),IN precio_venta3 DOUBLE(5,2),IN fecha4 DATETIME,IN id_usu BIGINT,IN Porcen BIGINT,OUT valor2 TEXT )
BEGIN
	DECLARE id_pre INT;
	INSERT INTO `precios`(`id_producto`,`precio_compra`,`precio_venta`,`estado`,`fecha_registro`,`id_usuario`,`porcentaje`) VALUES (id_producto1,precio_compra2,precio_venta3,'A',fecha4,id_usu,Porcen);
	seT valor2=(SELECT `id_precio` FROM `precios` WHERE `id_producto`=id_producto1 AND`precio_compra`=precio_compra2 AND `precio_venta`= precio_venta3);
   -- SET id_pre =(SELECT `id_precio` FROM `precios` WHERE `id_producto`=id_producto1 AND`precio_compra`=precio_compra2 AND `precio_venta`= precio_venta3);
    -- UPDATE `precios` SET estado='I' WHERE `id_precio` NOT IN (id_pre) AND `id_producto`=id_producto1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizarPrecioProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizarPrecioProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizarPrecioProducto`(IN consu TEXT,OUT valor TEXT)
BEGIN
    SET @query = CONCAT(consu);
    PREPARE statement FROM @query;       -- Preparar query.
    EXECUTE statement;                   -- Ejecutar query.
    DEALLOCATE PREPARE statement;        -- Eliminar query alojado en memoria.
    SET valor ='precio actualizado';
END */$$
DELIMITER ;

/* Procedure structure for procedure `ActualizarStockVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `ActualizarStockVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStockVentas`(
in _id_control bigint,
in _cantidad bigint
)
BEGIN
UPDATE `stock`
SET 
  `cantidad` = _cantidad
WHERE `stock`.`id_precio` = _id_control;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Actualizar_Categoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `Actualizar_Categoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Categoria`(
in nombre1 text,in id_categoria1 int ,out salida text)
BEGIN
declare v int;
set v=(SELECT validarCategoriaProducto(nombre1));
	if(v<1) then 
	update categoria
    set nombre=nombre1 , fecha_actualizacion=now() 
    where categoria.id_categoria = id_categoria1;
	set salida = 'DATO ACTUALIZADO';
	else
	set salida ='DATO EXISTENTE';
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Actualizar_Presentaciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `Actualizar_Presentaciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Presentaciones`(
in nombre1 text,in idPresentaciones1 int,out salida text)
BEGIN
declare v int;
set v=(SELECT validarPresentacionesProducto(nombre1));
	if(v<1) then 
	update presentaciones
    set nombre=nombre1
    where presentaciones.idPresentaciones = idPresentaciones1;
	set salida = 'DATO ACTUALIZADO';
	else
	set salida ='DATO EXISTENTE';
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizar_punto_venta` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizar_punto_venta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_punto_venta`(id1 BIGINT, nombre_localidad1 TEXT,nombre_local1 TEXT,  direccion1 TEXT,dir_ip1 TEXT,  IN observacion TEXT, OUT salida TEXT)
BEGIN
DECLARE id_localidad1 INT;
SELECT `id_localidad_guayas` INTO id_localidad1 FROM `fc_localidad_guayas` WHERE `localidad`=nombre_localidad1;
UPDATE fc_punto_venta SET `id_localidad_guayas`=id_localidad1, `nombre`=nombre_local1,`direccion`=direccion1, 
`observacion`=observacion, `ip_publica`=	dir_ip1 WHERE `id_punto_venta`=id1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Actualizar_Tipo` */

/*!50003 DROP PROCEDURE IF EXISTS  `Actualizar_Tipo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Tipo`(in nombre_f text,in id_tipo_f int, out salida text)
BEGIN
declare nra int;
set nra = (SELECT validarTipoProducto(nombre_f));
	if(nra<1) then 
	update tipo set nombre = nombre_f where tipo.id_tipo = id_tipo_f;
	set salida = 'DATO ACTUALIZADO';
	else
	set salida ='DATO EXISTENTE';
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `bitacora_seguridad` */

/*!50003 DROP PROCEDURE IF EXISTS  `bitacora_seguridad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `bitacora_seguridad`(IN `user1` TEXT, IN `password1` TEXT, IN `ip_equipo1` TEXT, /*in `ip_publico1` text,*/
    IN `usuario_equipo1` TEXT, IN `dir_ip_completa1` TEXT)
BEGIN
    DECLARE fecha_login1 DATETIME;
    DECLARE valor INT;
    SELECT NOW() INTO fecha_login1;
    SELECT COUNT(id_usuario) INTO valor FROM fc_usuario WHERE correo=user1 AND PASSWORD=password1;
    IF(valor=0)THEN
    INSERT INTO fc_bitacora_seguridad(`user`,`password`,`ip_equipo`,`ip_publico`,`usuario_equipo`,`fecha_login`,`dir_ip_completa`,`Verficacion`)
    VALUES(user1,password1,  ip_equipo1, '100000000',usuario_equipo1, fecha_login1,dir_ip_completa1,'I' );
    ELSE
    INSERT INTO fc_bitacora_seguridad(`user`,`password`,`ip_equipo`,`ip_publico`,`usuario_equipo`,`fecha_login`,`dir_ip_completa`,`Verficacion`)
    VALUES(user1,password1,  ip_equipo1, '100000000',usuario_equipo1, fecha_login1,dir_ip_completa1,'C' );
    END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `buscarIDCabeceraCompras` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscarIDCabeceraCompras` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarIDCabeceraCompras`(IN descuento1 DECIMAL(10,7),
IN iva1 DECIMAL(10,7),IN total1 DECIMAL(10,7),OUT valor TEXT)
BEGIN
	select `id_cabecera_compra` into valor from `cabecera_compra` where `descuento`= descuento1 and `iva`= iva1 and `total`= total1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `buscarIDDetalleCompras` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscarIDDetalleCompras` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarIDDetalleCompras`(in idcab bigint,IN descuento1 DECIMAL(10,7),
in iva1 decimal(10,7),in total1 decimal(10,7),in bono1 bigint,out valor text)
BEGIN
    
	select `id_detalle_compra` into valor from `detalle_compra` where `descuento`= descuento1 and`iva`=iva1  and `total`= total1 and `bono`=bono1;
     
    END */$$
DELIMITER ;

/* Procedure structure for procedure `BuscarIDProductoNuevo` */

/*!50003 DROP PROCEDURE IF EXISTS  `BuscarIDProductoNuevo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarIDProductoNuevo`(
IN nombre1 VARCHAR(45),IN descripcion1 VARCHAR(80),IN fecha_registro1 DATE,IN peso1 DOUBLE(7,2),IN id_tipo1 BIGINT(20), 
IN id_medidas1 BIGINT(20),IN id_categoria1 BIGINT(20),IN id_presentacion1 BIGINT(20),IN id_marcas1 BIGINT(20),IN id_usuario1 BIGINT,IN iva1 VARCHAR(15),
IN cantidad_minima1 BIGINT,IN receta1 VARCHAR(45),IN unidade1 BIGINT, OUT valor1 TEXT)
BEGIN
	SET valor1= (SELECT `id_productos` FROM `productos` WHERE `descripcion`=descripcion1 
    AND`fecha_registro`=fecha_registro1 AND`peso`=peso1 AND`id_tipo`=id_tipo1 AND `id_medidas`=id_medidas1 
    AND `id_categoria`= id_categoria1 AND `id_presentacion`= id_presentacion1
    AND `id_marcas`=id_marcas1 AND`estado`='A' AND `id_usuario`=id_usuario1 AND`iva`=iva1 
    AND `cantidad_minima`=cantidad_minima1 AND `receta`= receta1 AND `unidades`=unidade1); 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `BuscarStockVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `BuscarStockVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `BuscarStockVentas`(
in _id_cabecera_ventas bigint
)
BEGIN
SELECT `detalle_venta`.`id_control` AS id_control,(`stock`.`cantidad`-`detalle_venta`.`cantidad`) AS cantidad
FROM  `stock` INNER JOIN `detalle_venta`
ON `stock`.`id_precio` = `detalle_venta`.`id_control`
WHERE `detalle_venta`.`id_cabecera_venta` = _id_cabecera_ventas;
END */$$
DELIMITER ;

/* Procedure structure for procedure `cambiarEstadoDevolucion` */

/*!50003 DROP PROCEDURE IF EXISTS  `cambiarEstadoDevolucion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cambiarEstadoDevolucion`(in id_nota bigint, in id_compra bigint)
BEGIN
	update `cabecera_nota_pedidos` set `estado` = 'D' where`id_cabecera_nota_pedidos`= id_nota;
	update `cabecera_compra` set `estado` = 'D' where `id_cabecera_compra` = id_compra;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `cantidad_compras` */

/*!50003 DROP PROCEDURE IF EXISTS  `cantidad_compras` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cantidad_compras`(in fecha1 date, in fecha2 date)
BEGIN
select distinct
pr.id_producto,
p.nombre,
p.descripcion,
SUM(dc.cantidad) AS `cantidad_comprado`,
SUM(dc.total) AS `total`
from cabecera_compra cp
join detalle_compra dc on dc.id_cabecera_compra=cp.id_cabecera_compra
join precios pr on pr.id_precio = dc.id_precio
join productos p on p.id_productos=pr.id_producto
join pagos pg on cp.id_tipoPago = pg.id_pagos
where fecha_creacion between (fecha1)and(fecha2)
GROUP BY 1,2
order by cantidad_comprado desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `cantidad_ventas` */

/*!50003 DROP PROCEDURE IF EXISTS  `cantidad_ventas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cantidad_ventas`(in fecha1 date, in fecha2 date)
BEGIN
select distinct
p.id_productos,
p.nombre,
p.descripcion,
SUM(dv.cantidad) AS cantidad_venta,
SUM(cv.total) AS total
from cabecera_venta cv
join detalle_venta dv on dv.id_cabecera_venta=cv.id
join precios pr on pr.id_precio = dv.id_control
join productos p on p.id_productos=pr.id_producto
where fecha_creacion between (fecha1)and(fecha2)
GROUP BY 1,2,3
order by cantidad_venta desc;
END */$$
DELIMITER ;

/* Procedure structure for procedure `convertirStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `convertirStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `convertirStock`(in Stock1 bigint,in Stock2 bigint,in valor1 bigint,valor2 bigint,out valor text)
BEGIN
	update `stock` set `cantidad`=valor1 where `id_stock`=Stock1;
	UPDATE `stock` SET `cantidad`=valor2 WHERE `id_stock`=Stock2;
	set valor ='EXITO';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `convertirStockProductoNuevo` */

/*!50003 DROP PROCEDURE IF EXISTS  `convertirStockProductoNuevo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `convertirStockProductoNuevo`(IN Stock1 BIGINT,IN id_precio2 BIGINT,IN valor1 BIGINT,valor2 BIGINT,OUT valor TEXT)
BEGIN
	DECLARE id_preciox BIGINT;
	DECLARE cantidadx BIGINT;
	DECLARE cant BIGINT;
		
	UPDATE `stock` SET `cantidad`=valor1 WHERE `id_stock`=Stock1;
	
	SELECT `id_precio` INTO  id_preciox  FROM `stock` WHERE `id_precio`=id_precio2;
	
	IF(id_preciox = id_precio2)THEN
	SET cantidadx=(SELECT `cantidad` FROM `stock` WHERE `id_precio`=id_precio2);
	SET cant =(cantidadx + valor2);
	UPDATE `stock` SET `cantidad` = cant WHERE `id_precio` = id_precio2;
	ELSE
	-- SET cant2 = (cantidad3+bono8);
	INSERT INTO `stock`(`cantidad`,`id_precio`)VALUES(valor2,id_precio2);
	END IF;
	
	SET valor ='EXITO';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `DesactivarNotaPedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `DesactivarNotaPedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `DesactivarNotaPedido`(IN id_cabecera_nota_pedidos1 BIGINT,
OUT valor TEXT)
BEGIN
	UPDATE cabecera_nota_pedidos 
	SET estado = 'NO'
	WHERE id_cabecera_nota_pedidos = id_cabecera_nota_pedidos1;
	SET valor ='Actualizado';
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `devolverProductosComprados` */

/*!50003 DROP PROCEDURE IF EXISTS  `devolverProductosComprados` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `devolverProductosComprados`(IN cantidad1 INT,IN id_precio2 BIGINT,out valor text)
BEGIN
    	DECLARE id_preciox BIGINT;
	DECLARE cantidadx BIGINT;
	DECLARE cant BIGINT;
	
	SELECT `id_precio` INTO  id_preciox  FROM `stock` WHERE `id_precio`=id_precio2;
	
	IF(id_preciox = id_precio2)THEN
	
		SET cantidadx =(SELECT `cantidad` FROM `stock` WHERE `id_precio`= id_precio2);
		SET cant =(cantidadx - cantidad1);			
		UPDATE `stock` SET `cantidad` = cant WHERE `id_precio` = id_precio2;
		set valor ='¡DEVOLUCION EXITOSA!';
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `edicionCabeceraNota` */

/*!50003 DROP PROCEDURE IF EXISTS  `edicionCabeceraNota` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `edicionCabeceraNota`(IN iva8 DECIMAL(10,7),
IN descuento9 DECIMAL(10,7),IN total10 DECIMAL(10,7),IN id_cab_ped11 BIGINT,OUT valor TEXT)
BEGIN
	UPDATE`cabecera_nota_pedidos` SET `iva`= iva8 ,`descuento`= descuento9 ,`total`= total10 WHERE`id_cabecera_nota_pedidos`= id_cab_ped11;
	SET valor='EXITO';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `edicionCompra` */

/*!50003 DROP PROCEDURE IF EXISTS  `edicionCompra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `edicionCompra`(IN iva8 DECIMAL(10,7),
IN descuento9 DECIMAL(10,7),IN total10 DECIMAL(10,7),IN id_cab_ped11 BIGINT,in idComp bigint,OUT valor TEXT)
BEGIN
	update`cabecera_nota_pedidos` set `iva`= iva8 ,`descuento`= descuento9 ,`total`= total10 where`id_cabecera_nota_pedidos`= id_cab_ped11;
	
	update `cabecera_compra` set `iva`= iva8 ,`descuento`= descuento9 ,`total`= total10 where `id_cabecera_compra` = idComp;
	set valor='exito';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `editarMarcaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `editarMarcaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editarMarcaProducto`(IN nombre_medida1 VARCHAR(80),in pos int, OUT valor1 TEXT)
BEGIN
	DECLARE nr INT;
	IF (nombre_medida1='') THEN
	SET valor1 ='campos invalidos';
	ELSE
	SET nr = (SELECT validarMarcaProducto(nombre_medida1));
	IF(nr<1) THEN 
	UPDATE marcas SET nombre = nombre_medida1 WHERE id_marcas = POS;
	SET valor1 ='exito';
	ELSE
	SET valor1 ='ya existe';
	END IF;
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `editarMedidaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `editarMedidaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editarMedidaProducto`(IN nombre_medida1 VARCHAR(80),in pos int, OUT valor1 TEXT)
BEGIN
	DECLARE nr INT;
	IF (nombre_medida1='') THEN
	SET valor1 ='campos invalidos';
	ELSE
	SET nr = (SELECT validarMedidaProducto(nombre_medida1));
	IF(nr<1) THEN 
	UPDATE medidas SET nombre_medida = nombre_medida1 WHERE ID_MEDIDAS = POS;
	SET valor1 ='exito';
	ELSE
	SET valor1 ='ya existe';
	END IF;
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `editarProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `editarProveedor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `editarProveedor`(IN id_proveedor_clase1 BIGINT, IN entidad3 VARCHAR(100),
IN representante4 VARCHAR(70),IN direccion5 VARCHAR(100),IN fecha6 DATE,IN estado7 VARCHAR(1),IN telefono8 VARCHAR(70),IN correo9 VARCHAR(70),IN cedula2 VARCHAR(15),IN imagen TEXT,OUT valor TEXT)
BEGIN
UPDATE proveedor SET `id_proveedor_clase`=id_proveedor_clase1,`entidad`=entidad3,`representante`=representante4,`direccion`=direccion5,
`fecha_registro`=fecha6,`estado`=estado7,`telefono`=telefono8,`correo`=correo9 ,`direccionImagen`=imagen WHERE cedula_ruc = cedula2;
SET valor = 'Proveedor Actualizado'; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `eliminar` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar`(id_Laboratorio1 bigint, out valor  text)
BEGIN
delete from laboratorio where id_Laboratorio = id_Laboratorio1;
set valor = 'Laboratorio eliminado';
END */$$
DELIMITER ;

/* Procedure structure for procedure `eliminarDetalleCompra` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminarDetalleCompra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarDetalleCompra`(IN id_cab BIGINT,IN id_det BIGINT,OUT valor TEXT)
BEGIN
	DELETE FROM `detalle_nota_pedidos` WHERE `id_detalle_nota_pedidos`= id_det AND `id_cabecera_nota_pedidos`= id_cab;
	SET valor='elemento eliminado';
		
    END */$$
DELIMITER ;

/* Procedure structure for procedure `EliminarDetalleDevolucion` */

/*!50003 DROP PROCEDURE IF EXISTS  `EliminarDetalleDevolucion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDetalleDevolucion`(in detNotaPed bigint,in idPrecio1 bigint, in cantidad1 bigint,
    in descuento1 decimal(10,7),in iva1 DECIMAL(10,7),in total1 DECIMAL(10,7),in bono1 bigint,out valor text)
BEGIN
	declare idDetCompra bigint;
	select `id_detalle_compra` into idDetCompra from `detalle_compra` where `id_precio`= idPrecio1 and `descuento`= descuento1 and 
	`iva`= iva1 and `total`= total1 and `bono`=bono1;
	
	delete from `detalle_nota_pedidos` where `id_detalle_nota_pedidos`= detNotaPed;
	
	delete from `detalle_compra` where `id_detalle_compra`=idDetCompra;
	SET valor='EXITO';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `EliminarDetalleNotaPedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `EliminarDetalleNotaPedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarDetalleNotaPedido`(IN id_detalle_nota_pedidos1 BIGINT,OUT valor TEXT)
BEGIN
DELETE FROM `detalle_nota_pedidos` WHERE id_detalle_nota_pedidos = id_detalle_nota_pedidos1;
SET valor='Detalle Eliminado';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `eliminarMarcaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminarMarcaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarMarcaProducto`(in pos int, OUT valor1 TEXT)
BEGIN
	-- DECLARE nr INT;
	-- IF (nombre_medida1='') THEN
	-- SET valor1 ='campos invalidos';
	-- ELSE
	-- SET nr = (SELECT validarMedidaProducto(nombre_medida1));
	-- IF(nr<1) THEN 
	UPDATE marcas SET estado = 'I' WHERE id_marcas = pos;
	SET valor1 ='exito';
	-- ELSE
	-- SET valor1 ='ya existe';
	-- END IF;
	-- END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `eliminarMedidaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminarMedidaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarMedidaProducto`(in pos int, OUT valor1 TEXT)
BEGIN
	-- DECLARE nr INT;
	-- IF (nombre_medida1='') THEN
	-- SET valor1 ='campos invalidos';
	-- ELSE
	-- SET nr = (SELECT validarMedidaProducto(nombre_medida1));
	-- IF(nr<1) THEN 
	UPDATE medidas SET estado = 'I' WHERE id_medidas = pos;
	SET valor1 ='exito';
	-- ELSE
	-- SET valor1 ='ya existe';
	-- END IF;
	-- END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `eliminarProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminarProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarProducto`(in id_productos1 bigint,out valor text)
BEGIN
	update `productos` set `estado`='I' where `productos`.`id_productos`= id_productos1;
	set valor='Producto Eliminado con Exito';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `eliminarProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminarProveedor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminarProveedor`(in op bigint, id_proveedor1 bigint,out valor text)
BEGIN
	if (op=1)then
	update `proveedor` set `estado`='I' where `id_proveedor`=id_proveedor1;
	set valor='¡PROVEEDOR DADO DE BAJA!';
	end if;
	IF (op=2)THEN
	UPDATE `proveedor` SET `estado`='A' WHERE `id_proveedor`=id_proveedor1;
	SET valor='¡PROVEEDOR RESTABLECIDO!';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Eliminar_Categoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `Eliminar_Categoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Categoria`(in id_categoria1 int,out salida text)
BEGIN
update categoria
set estado='I' 
where categoria.id_categoria = id_categoria1;
set salida = 'DATO ELIMINADO';
END */$$
DELIMITER ;

/* Procedure structure for procedure `eliminar_iva` */

/*!50003 DROP PROCEDURE IF EXISTS  `eliminar_iva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_iva`(IN id_iva1 INT,OUT msg TEXT)
BEGIN
	UPDATE iva SET est = 'I' WHERE id_iva= id_iva1;
    SET msg = 'Valor Eliminado';
END */$$
DELIMITER ;

/* Procedure structure for procedure `Eliminar_Presentaciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `Eliminar_Presentaciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Presentaciones`(in idPresentaciones1 int,out salida text)
BEGIN
update presentaciones
set estado='I' 
where presentaciones.idPresentaciones = idPresentaciones1;
set salida = 'DATO ELIMINADO';
END */$$
DELIMITER ;

/* Procedure structure for procedure `Eliminar_Tipo` */

/*!50003 DROP PROCEDURE IF EXISTS  `Eliminar_Tipo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Eliminar_Tipo`(in id_tipo_f int, out salida text)
BEGIN
declare esta_f char(1);
    set esta_f = 'I';
update tipo set estado = esta_f where id_tipo = id_tipo_f;
 set salida = 'DATO ELIMINADO';
 select salida;
END */$$
DELIMITER ;

/* Procedure structure for procedure `estadoCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `estadoCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `estadoCliente`(
in cedula123 text, 
 out msg text)
BEGIN
update  Clientes set Estado = 'I' WHERE Cedula = cedula123;
set msg = 'Cliente eliminado!!';
END */$$
DELIMITER ;

/* Procedure structure for procedure `estadoCliente2` */

/*!50003 DROP PROCEDURE IF EXISTS  `estadoCliente2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `estadoCliente2`(
in cedula123 text, out mst text)
BEGIN
update  Clientes set Estado = 'A' WHERE Cedula = cedula123;
set mst = 'Cliente activado!!';
END */$$
DELIMITER ;

/* Procedure structure for procedure `faltantes_cantidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `faltantes_cantidad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `faltantes_cantidad`()
BEGIN
SELECT DISTINCT (df.`id_detalle_faltantes`),df.`id_producto`,p.`nombre`, m.nombre AS marcas,df.`cantidad`AS cantidad_Faltantes,
p.`cantidad_minima` AS can_minima,df.`estado`,p.`descripcion` AS descripcion
FROM `detalle_faltantes` df
JOIN `productos` p ON p.`id_productos` = df.`id_producto`
JOIN `precios` pr ON pr.`id_producto`= p.`id_productos`
JOIN `marcas` m ON p.`id_marcas` = m.`id_marcas`    
WHERE `df`.cantidad <= cantidad_minima OR `df`.cantidad = 0
AND `df`.estado = 'NO' OR `df`.estado = 'OK';
END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_actualizar_local` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_actualizar_local` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_actualizar_local`(IN nombre1 TEXT,IN direccion1 TEXT,IN telefono_pv1 TEXT, OUT salida TEXT)
BEGIN    
    
UPDATE `fc_punto_venta`
SET `nombre` = nombre1,
  `direccion` = direccion1,
  `telefono_pv` = telefono_pv1,
  `fecha_actualizacion` = now()
WHERE `id_punto_venta` = 1;
SET salida='Local acualizado correctamente';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_actualizar_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_actualizar_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_actualizar_usuario`(IN cedula1 TEXT, IN nombres1 TEXT, IN apellidos1 TEXT, IN telefono1 TEXT, IN convencional1 TEXT, IN correo1 TEXT, 
/*IN ip_publica1 TEXT,*//* IN genero1 TEXT, IN discapacidad1 TEXT, IN porcentaje_discapacidad1 TEXT, */
IN direccion1 TEXT,/* IN cargo1 TEXT, IN nombrepv1 TEXT,*/ IN ip_equipo1 TEXT, IN usuario_equipo1 TEXT,IN dir_ip_completa1 TEXT, IN ruta_img1 TEXT, IN observacion1 TEXT,IN genero1 TEXT,IN cargo1 TEXT, IN password1 TEXT,IN sesion1 LONG,in estado1 text, OUT salida TEXT)
BEGIN
DECLARE v_cedula INT;
DECLARE v_genero BIGINT;
DECLARE v_rol BIGINT;
DECLARE v_id_pv BIGINT;
DECLARE v_estado BIGINT;
DECLARE v_cedula_dos BIGINT;
SELECT COUNT(`cedula`)INTO v_cedula FROM `fc_usuario` WHERE `cedula` = cedula1;
SELECT `id_genero` INTO v_genero FROM `fc_genero` WHERE `genero` = genero1;
SELECT `id_estado` INTO v_estado FROM `fc_estado_usuario` WHERE `estado`= estado1;
SELECT `id_usuario` INTO v_cedula_dos FROM `fc_usuario` WHERE `cedula` = cedula1;
	
IF(v_cedula = 1)THEN 
	
	UPDATE `fc_usuario` SET `cedula` = cedula1,`nombres` = nombres1,`apellidos` = apellidos1,`telefono` =telefono1,
	  `convencional` = convencional,`correo` = correo1,`password` = password1,`ruta_imagen` = ruta_img1, 
	  `id_estado` = v_estado,`ip_equipo` = ip_equipo1,`ip_publica` = '2',
	  `usuario_equipo` = usuario_equipo1,`dir_ip_completa` = dir_ip_completa1,`id_genero` = v_genero,`direccion` = direccion1 
	WHERE `id_usuario` = v_cedula_dos;
			
	SELECT `id_rol` INTO v_rol FROM `fc_rol` WHERE `cargo` = cargo1; 
		
	UPDATE `fc_session` SET `id_rol` = v_rol,`observacion` = observacion1,`fecha_actualizacion` = now(),`id_punto_venta` = '1' 
	WHERE `id_sesion` = sesion1;
			
	SET salida='Usuario actualizado'; 
ELSE  
	SET salida='El usuario no existe'; 
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_combos_ac_usuarios` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_combos_ac_usuarios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_combos_ac_usuarios`(IN op BIGINT,IN id BIGINT, OUT valor TEXT)
BEGIN
    SET valor=''; 
	IF op=1 THEN 
		SELECT DISTINCT (`fc_rol`.`cargo`) INTO valor FROM `fc_rol` 
		INNER JOIN `fc_session` ON `fc_rol`.`id_rol` = `fc_session`.`id_rol` 
		WHERE `fc_session`.`id_rol` = id;
	END IF;
	
	IF op=2 THEN 
		SELECT DISTINCT (`fc_estado_usuario`.`estado`) INTO valor FROM `fc_estado_usuario` 
		INNER JOIN `fc_usuario` ON `fc_usuario`.`id_estado` = `fc_estado_usuario`.`id_estado`  
		WHERE `fc_usuario`.`id_estado` = id; 
	END IF; 
	
	IF op=3 THEN 
		SELECT DISTINCT (`fc_genero`.`genero`) INTO valor FROM `fc_genero` 
		INNER JOIN `fc_usuario` ON `fc_usuario`.`id_genero` = `fc_genero`.`id_genero`  
		WHERE `fc_usuario`.`id_genero` = id; 
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_combo_discapacidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_combo_discapacidad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_combo_discapacidad`()
BEGIN
	SELECT `discapacidad` FROM `fc_discapacidad`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_combo_genero` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_combo_genero` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_combo_genero`()
BEGIN
	SELECT `id_genero`,`genero` FROM `fc_genero`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_combo_porcentaje` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_combo_porcentaje` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_combo_porcentaje`()
BEGIN
	SELECT `porcentaje` FROM `fc_porcentaje_discapacidad`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_combo_pv` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_combo_pv` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_combo_pv`()
BEGIN
	SELECT `nombre` FROM `fc_punto_venta` ORDER BY `nombre` ASC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_combo_rol` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_combo_rol` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_combo_rol`()
BEGIN
	SELECT `id_rol`,`cargo` FROM `fc_rol`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_crear_local` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_crear_local` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_crear_local`(in nombre1 text,in direccion1 text,in telefono_pv1 text, out salida text)
BEGIN
	INSERT INTO `fc_punto_venta` (`nombre`,`direccion`,`telefono_pv`,`fecha_creacion`,`fecha_actualizacion`)
	VALUES (nombre1,direccion1,telefono_pv1,now(),'0000-00-00');
	SET salida='Local creado correctamente'; 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_esatdo_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_esatdo_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_esatdo_usuario`()
BEGIN
	SELECT `id_estado`,`estado` FROM `fc_estado_usuario`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_estado_pv` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_estado_pv` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_estado_pv`()
BEGIN
	SELECT `fc_estado_pv`.`id_estado_pv`, `fc_estado_pv`.`estado_pv` FROM `fc_estado_pv`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_filtro_apellido_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_filtro_apellido_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_filtro_apellido_usuario`(in valor text)
BEGIN
SELECT `fc_session`.`id_sesion`, `fc_usuario`.`fecha_registro`, `fc_usuario`.`cedula`, `fc_usuario`.`apellidos`, `fc_usuario`.`nombres`, 
	`fc_usuario`.`direccion`,`fc_usuario`.`telefono`, `fc_usuario`.`convencional`, `fc_usuario`.`correo`,`fc_genero`.`id_genero`, `fc_genero`.`genero`, 
	`fc_rol`.`id_rol`,`fc_rol`.`cargo`,`fc_estado_usuario`.`id_estado`,`fc_estado_usuario`.`estado`,
	`fc_session`.`observacion`, `fc_usuario`.`ruta_imagen` 
	FROM `fc_session` INNER JOIN `fc_usuario` ON `fc_usuario`.`id_usuario` = `fc_session`.`id_usuario` 
	INNER JOIN `fc_punto_venta` ON `fc_punto_venta`.`id_punto_venta` = `fc_session`.`id_punto_venta` 
	INNER JOIN `fc_rol` ON `fc_rol`.`id_rol` = `fc_session`.`id_rol` 
	INNER JOIN `fc_genero` ON `fc_genero`.`id_genero` = `fc_usuario`.`id_genero` 
	INNER JOIN `fc_estado_usuario` ON `fc_estado_usuario`.`id_estado` = `fc_usuario`.`id_estado` 
	WHERE `fc_usuario`.`apellidos` LIKE concat('',valor,'%'); 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_filtro_cedula_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_filtro_cedula_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_filtro_cedula_usuario`(IN valor TEXT)
BEGIN
SELECT `fc_session`.`id_sesion`, `fc_usuario`.`fecha_registro`, `fc_usuario`.`cedula`, `fc_usuario`.`apellidos`, `fc_usuario`.`nombres`, 
	`fc_usuario`.`direccion`,`fc_usuario`.`telefono`, `fc_usuario`.`convencional`, `fc_usuario`.`correo`,`fc_genero`.`id_genero`, `fc_genero`.`genero`, 
	`fc_rol`.`id_rol`,`fc_rol`.`cargo`,`fc_estado_usuario`.`id_estado`,`fc_estado_usuario`.`estado`,
	`fc_session`.`observacion`, `fc_usuario`.`ruta_imagen` 
	FROM `fc_session` INNER JOIN `fc_usuario` ON `fc_usuario`.`id_usuario` = `fc_session`.`id_usuario` 
	INNER JOIN `fc_punto_venta` ON `fc_punto_venta`.`id_punto_venta` = `fc_session`.`id_punto_venta` 
	INNER JOIN `fc_rol` ON `fc_rol`.`id_rol` = `fc_session`.`id_rol` 
	INNER JOIN `fc_genero` ON `fc_genero`.`id_genero` = `fc_usuario`.`id_genero` 
	INNER JOIN `fc_estado_usuario` ON `fc_estado_usuario`.`id_estado` = `fc_usuario`.`id_estado` 
	WHERE `fc_usuario`.`cedula` LIKE CONCAT('',valor,'%'); 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_filtro_cod_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_filtro_cod_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_filtro_cod_usuario`(IN valor bigint)
BEGIN
SELECT `fc_session`.`id_sesion`, `fc_usuario`.`fecha_registro`, `fc_usuario`.`cedula`, `fc_usuario`.`apellidos`, `fc_usuario`.`nombres`, 
	`fc_usuario`.`direccion`,`fc_usuario`.`telefono`, `fc_usuario`.`convencional`, `fc_usuario`.`correo`,`fc_genero`.`id_genero`, `fc_genero`.`genero`, 
	`fc_rol`.`id_rol`,`fc_rol`.`cargo`,`fc_estado_usuario`.`id_estado`,`fc_estado_usuario`.`estado`,
	`fc_session`.`observacion`, `fc_usuario`.`ruta_imagen` 
	FROM `fc_session` INNER JOIN `fc_usuario` ON `fc_usuario`.`id_usuario` = `fc_session`.`id_usuario` 
	INNER JOIN `fc_punto_venta` ON `fc_punto_venta`.`id_punto_venta` = `fc_session`.`id_punto_venta` 
	INNER JOIN `fc_rol` ON `fc_rol`.`id_rol` = `fc_session`.`id_rol` 
	INNER JOIN `fc_genero` ON `fc_genero`.`id_genero` = `fc_usuario`.`id_genero` 
	INNER JOIN `fc_estado_usuario` ON `fc_estado_usuario`.`id_estado` = `fc_usuario`.`id_estado` 
	WHERE `fc_session`.`id_sesion` = valor; 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_filtro_estado_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_filtro_estado_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_filtro_estado_usuario`(IN valor bigint)
BEGIN
SELECT `fc_session`.`id_sesion`, `fc_usuario`.`fecha_registro`, `fc_usuario`.`cedula`, `fc_usuario`.`apellidos`, `fc_usuario`.`nombres`, 
	`fc_usuario`.`direccion`,`fc_usuario`.`telefono`, `fc_usuario`.`convencional`, `fc_usuario`.`correo`,`fc_genero`.`id_genero`, `fc_genero`.`genero`, 
	`fc_rol`.`id_rol`,`fc_rol`.`cargo`,`fc_estado_usuario`.`id_estado`,`fc_estado_usuario`.`estado`,
	`fc_session`.`observacion`, `fc_usuario`.`ruta_imagen` 
	FROM `fc_session` INNER JOIN `fc_usuario` ON `fc_usuario`.`id_usuario` = `fc_session`.`id_usuario` 
	INNER JOIN `fc_punto_venta` ON `fc_punto_venta`.`id_punto_venta` = `fc_session`.`id_punto_venta` 
	INNER JOIN `fc_rol` ON `fc_rol`.`id_rol` = `fc_session`.`id_rol` 
	INNER JOIN `fc_genero` ON `fc_genero`.`id_genero` = `fc_usuario`.`id_genero` 
	INNER JOIN `fc_estado_usuario` ON `fc_estado_usuario`.`id_estado` = `fc_usuario`.`id_estado` 
	WHERE `fc_usuario`.`id_estado` = valor; 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_filtro_fecha_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_filtro_fecha_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_filtro_fecha_usuario`(IN valor text)
BEGIN
SELECT `fc_session`.`id_sesion`, `fc_usuario`.`fecha_registro`, `fc_usuario`.`cedula`, `fc_usuario`.`apellidos`, `fc_usuario`.`nombres`, 
	`fc_usuario`.`direccion`,`fc_usuario`.`telefono`, `fc_usuario`.`convencional`, `fc_usuario`.`correo`,`fc_genero`.`id_genero`, `fc_genero`.`genero`, 
	`fc_rol`.`id_rol`,`fc_rol`.`cargo`,`fc_estado_usuario`.`id_estado`,`fc_estado_usuario`.`estado`,
	`fc_session`.`observacion`, `fc_usuario`.`ruta_imagen` 
	FROM `fc_session` INNER JOIN `fc_usuario` ON `fc_usuario`.`id_usuario` = `fc_session`.`id_usuario` 
	INNER JOIN `fc_punto_venta` ON `fc_punto_venta`.`id_punto_venta` = `fc_session`.`id_punto_venta` 
	INNER JOIN `fc_rol` ON `fc_rol`.`id_rol` = `fc_session`.`id_rol` 
	INNER JOIN `fc_genero` ON `fc_genero`.`id_genero` = `fc_usuario`.`id_genero` 
	INNER JOIN `fc_estado_usuario` ON `fc_estado_usuario`.`id_estado` = `fc_usuario`.`id_estado` 
	WHERE `fc_usuario`.`fecha_registro` LIKE CONCAT('',valor,'%'); 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_filtro_pv_id` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_filtro_pv_id` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_filtro_pv_id`(in id_punto_venta1 bigint)
BEGIN
SELECT `fc_punto_venta`.`id_punto_venta`,
	  `fc_punto_venta`.`nombre`,
	  `fc_punto_venta`.`direccion`,
	  `fc_punto_venta`.`telefono_pv`,
	  `fc_punto_venta`.`id_localidad_guayas`, 
	  `fc_localidad_guayas`.`localidad`, 
	  `fc_punto_venta`.`observacion`, 
	  `fc_punto_venta`.`estado` 
	FROM `fc_punto_venta` INNER JOIN `fc_localidad_guayas` ON `fc_localidad_guayas`.`id_localidad_guayas` =`fc_punto_venta`.`id_localidad_guayas`
	WHERE `fc_punto_venta`.`id_punto_venta`= id_punto_venta1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_filtro_pv_nombre` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_filtro_pv_nombre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_filtro_pv_nombre`( IN nombre1 TEXT)
BEGIN
	SELECT `fc_punto_venta`.`id_punto_venta`,
	  `fc_punto_venta`.`nombre`,
	  `fc_punto_venta`.`direccion`,
	  `fc_punto_venta`.`telefono_pv`,
	  `fc_punto_venta`.`id_localidad_guayas`, 
	  `fc_localidad_guayas`.`localidad`, 
	  `fc_punto_venta`.`observacion`, 
	  `fc_punto_venta`.`estado` 
	FROM `fc_punto_venta` INNER JOIN `fc_localidad_guayas` ON `fc_localidad_guayas`.`id_localidad_guayas` =`fc_punto_venta`.`id_localidad_guayas`
	WHERE `fc_punto_venta`.`nombre` LIKE CONCAT('',nombre1,'%');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_getComboVariosUsuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_getComboVariosUsuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_getComboVariosUsuario`(IN op BIGINT,IN id BIGINT, OUT valor TEXT)
BEGIN
	SET valor='';
	IF op=1 THEN 
		SELECT DISTINCT (`fc_genero`.`genero`) INTO valor 
		FROM `fc_genero`
		INNER JOIN `fc_usuario` ON `fc_genero`.`id_genero`= `fc_usuario`.`id_genero` 
		WHERE `fc_usuario`.`id_genero`= id;
	END IF;
		
	IF op=2 THEN 
		SELECT DISTINCT (`fc_rol`.`cargo`) iNTO valor 
		FROM `fc_rol`
		INNER JOIN `fc_session` ON `fc_session`.`id_rol`= `fc_rol`.`id_rol` 
		WHERE `fc_session`.`id_rol`= id;
	END IF;
	
	IF op=3 THEN 
		SELECT DISTINCT (`fc_discapacidad`.`discapacidad`) iNTO valor 
		FROM `fc_discapacidad`
		INNER JOIN `fc_usuario` ON `fc_discapacidad`.`id_discapacidad`= `fc_usuario`.`id_discapacidad` 
		WHERE `fc_usuario`.`id_discapacidad`= id;
	END IF;
	
	IF op=4 THEN 
		SELECT DISTINCT (`fc_porcentaje_discapacidad`.`porcentaje`) iNTO valor 
		FROM `fc_porcentaje_discapacidad`
		INNER JOIN `fc_usuario` ON `fc_porcentaje_discapacidad`.`id_porcentaje_discapacidad`= `fc_usuario`.`id_porcentaje_discapacidad` 
		WHERE `fc_usuario`.`id_discapacidad`= id; 
	END IF;
	
	IF op=5 THEN 
		SELECT DISTINCT (`fc_punto_venta`.`nombre`) INTO valor 
		FROM `fc_punto_venta` 
		INNER JOIN `fc_session` ON `fc_punto_venta`.`id_punto_venta`= `fc_session`.`id_punto_venta` 
		WHERE `fc_punto_venta`.`id_punto_venta`= id;
	END IF;
	
	IF op=6 THEN 
		SELECT DISTINCT (`fc_estado_usuario`.`estado`) iNTO valor 
		FROM `fc_estado_usuario` 
		INNER JOIN `fc_usuario` ON `fc_estado_usuario`.`id_estado`= `fc_usuario`.`id_estado` 
		WHERE `fc_usuario`.`id_estado`= id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_login_bitacora` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_login_bitacora` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_login_bitacora`(IN `user1` TEXT, IN `password1` TEXT, IN `ip_equipo1` TEXT, /*in `ip_publico1` text,*/
    IN `usuario_equipo1` TEXT, IN `dir_ip_completa1` TEXT, OUT salida TEXT)
BEGIN
    DECLARE fecha_login1 DATETIME;
    DECLARE valor INT;
    SELECT NOW() INTO fecha_login1;
    SELECT COUNT(id_usuario) INTO valor FROM fc_usuario WHERE correo=user1 AND PASSWORD=password1;
    IF(valor=0)THEN
    INSERT INTO fc_bitacora_seguridad(`user`,`password`,`ip_equipo`,`ip_publico`,`usuario_equipo`,`fecha_login`,`dir_ip_completa`,`Verficacion`)
    VALUES(user1,password1,  ip_equipo1, '100000000',usuario_equipo1, fecha_login1,dir_ip_completa1,'I' );
    SET salida='Usuario no existe';
    ELSE
    INSERT INTO fc_bitacora_seguridad(`user`,`password`,`ip_equipo`,`ip_publico`,`usuario_equipo`,`fecha_login`,`dir_ip_completa`,`Verficacion`)
    VALUES(user1,password1,  ip_equipo1, '100000000',usuario_equipo1, fecha_login1,dir_ip_completa1,'C' );
    END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_mostrar_local` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_mostrar_local` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_mostrar_local`()
BEGIN
	SELECT `fc_punto_venta`.`nombre`, `fc_punto_venta`.`direccion`, `fc_punto_venta`.`telefono_pv`,`fc_punto_venta`.`fecha_creacion`, 
	`fc_punto_venta`.`fecha_actualizacion` FROM `fc_punto_venta` where `fc_punto_venta`.`id_punto_venta`=1;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_mostrar_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_mostrar_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_mostrar_usuario`()
BEGIN
SELECT `fc_session`.`id_sesion`, `fc_usuario`.`fecha_registro`, `fc_usuario`.`cedula`, `fc_usuario`.`apellidos`, `fc_usuario`.`nombres`, 
`fc_usuario`.`direccion`,`fc_usuario`.`telefono`, `fc_usuario`.`convencional`, `fc_usuario`.`correo`,`fc_genero`.`id_genero`, `fc_genero`.`genero`, 
/*`fc_discapacidad`.`id_discapacidad`,`fc_discapacidad`.`discapacidad`,`fc_porcentaje_discapacidad`.`id_porcentaje_discapacidad`, 
`fc_porcentaje_discapacidad`.`porcentaje`,*/ `fc_rol`.`id_rol`,`fc_rol`.`cargo`,`fc_estado_usuario`.`id_estado`,`fc_estado_usuario`.`estado`,
/*`fc_punto_venta`.`id_punto_venta`,`fc_punto_venta`.`nombre` AS nombrepv,*/ `fc_session`.`observacion`, `fc_usuario`.`ruta_imagen` 
FROM `fc_session` INNER JOIN `fc_usuario` ON `fc_usuario`.`id_usuario` = `fc_session`.`id_usuario` 
INNER JOIN `fc_punto_venta` ON `fc_punto_venta`.`id_punto_venta` = `fc_session`.`id_punto_venta` 
INNER JOIN `fc_rol` ON `fc_rol`.`id_rol` = `fc_session`.`id_rol` 
INNER JOIN `fc_genero` ON `fc_genero`.`id_genero` = `fc_usuario`.`id_genero` 
INNER JOIN `fc_estado_usuario` ON `fc_estado_usuario`.`id_estado` = `fc_usuario`.`id_estado` 
WHERE `fc_usuario`.`id_estado` = 1 ORDER BY `fc_session`.`id_sesion` ASC; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_nuevo_punto_venta` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_nuevo_punto_venta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_nuevo_punto_venta`(in localidad_guayas1 text,IN nombre1 TEXT,IN direccion1 TEXT,IN ruc_local1 TEXT,IN telefono_pv1 TEXT,out salida text)
BEGIN
    declare v_id_localidad bigint;
    declare v_ruc int;
    
    select `id_localidad_guayas` into v_id_localidad from `fc_localidad_guayas` where `localidad`=localidad_guayas1;
    select count(`id_punto_venta`) into v_ruc from `fc_punto_venta` where `ruc_local` = ruc_local1;
    
if(v_ruc = 0)then
	INSERT INTO `fc_punto_venta` (`nombre`,`direccion`, `telefono_pv`,`fecha_creacion`,`ruc_local`,`estado`,`observacion`,`id_localidad_guayas`)
	VALUES (nombre1,direccion1, telefono_pv1,CURDATE(),ruc_local1,'ACTIVO', 'NUEVO LOCAL',v_id_localidad);
	SET salida='Local creado correctamente';
else 
	SET salida='El local ya existe!';
end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_punto_venta_prueba` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_punto_venta_prueba` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_punto_venta_prueba`()
BEGIN
SELECT
  `fc_punto_venta`.`id_punto_venta`,
  `fc_punto_venta`.`nombre`,
  `fc_punto_venta`.`direccion`,
  `fc_punto_venta`.`telefono_pv`,
  `fc_punto_venta`.`id_localidad_guayas`, 
  `fc_localidad_guayas`.`localidad`, 
  `fc_punto_venta`.`observacion`, 
  `fc_punto_venta`.`estado` 
FROM `fc_punto_venta` INNER JOIN `fc_localidad_guayas` ON `fc_localidad_guayas`.`id_localidad_guayas` =`fc_punto_venta`.`id_localidad_guayas`
where `fc_punto_venta`.`estado`='ACTIVO';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_registrar_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_registrar_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_registrar_usuario`(IN cedula1 TEXT, IN nombres1 TEXT, IN apellidos1 TEXT, IN telefono1 TEXT, IN convencional1 TEXT, IN correo1 TEXT, 
/*IN ip_publica1 TEXT,*//* IN genero1 TEXT, IN discapacidad1 TEXT, IN porcentaje_discapacidad1 TEXT, */
IN direccion1 TEXT,/* IN cargo1 TEXT, IN nombrepv1 TEXT,*/ IN ip_equipo1 TEXT, IN usuario_equipo1 TEXT,IN dir_ip_completa1 TEXT, IN ruta_img1 TEXT, in observacion1 text,in genero1 text,IN cargo1 TEXT, OUT salida TEXT)
BEGIN
DECLARE v_cedula INT;
DECLARE v_fecha_registro DATETIME;
DECLARE v_genero BIGINT;
/*DECLARE v_discapacidad BIGINT;
DECLARE v_porcentaje_discapacidad BIGINT;*/
 
DECLARE v_rol BIGINT;
DECLARE v_n_usuario BIGINT;
SELECT COUNT(`cedula`)INTO v_cedula FROM `fc_usuario` WHERE `cedula` = cedula1;
SELECT NOW() INTO v_fecha_registro; 
SELECT `id_genero` INTO v_genero FROM `fc_genero` WHERE `genero` = genero1;
/*SELECT `id_discapacidad` INTO v_discapacidad FROM `fc_discapacidad` WHERE `discapacidad` = discapacidad1;
SELECT `id_porcentaje_discapacidad` INTO v_porcentaje_discapacidad FROM `fc_porcentaje_discapacidad` WHERE `porcentaje` = porcentaje_discapacidad1;*/
 
	
IF(v_cedula = 0)THEN 
	INSERT INTO `fc_usuario`(`cedula`,`nombres`,  `apellidos`, `telefono`,`convencional`,`correo`,`password`,`ruta_imagen`,`fecha_registro`, 
		`id_estado`,`ip_equipo`,`ip_publica`,`usuario_equipo`,`dir_ip_completa`,`id_genero`,/*`id_discapacidad`,`id_porcentaje_discapacidad`,*/ `direccion`) 
		 VALUES(cedula1,nombres1,apellidos1,telefono1,convencional1,correo1,cedula1,ruta_img1,v_fecha_registro,
		 '1',ip_equipo1,'3',usuario_equipo1,dir_ip_completa1,v_genero,/*v_discapacidad,v_porcentaje_discapacidad,*/ direccion1); 
			
	SELECT MAX(`id_usuario`)INTO v_n_usuario FROM `fc_usuario`; 
	SELECT `id_rol` INTO v_rol FROM `fc_rol` WHERE `cargo` = cargo1; 
	#SELECT `id_punto_venta` INTO v_id_pv FROM `fc_punto_venta` WHERE `nombre` = nombrepv1;
	INSERT INTO `fc_session`(`id_usuario`,`id_rol`,`observacion`,`id_punto_venta`) 
		VALUES(v_n_usuario, v_rol, observacion1,'1'); 
			
	SET salida='Nuevo usuario ingresado, rol asignado'; 
ELSE  
	SET salida='El usuario ya existe'; 
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_respaldo_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_respaldo_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_respaldo_usuario`(IN cedula1 TEXT,IN nombres1 TEXT,IN apellidos1 TEXT,IN telefono1 TEXT,
    IN convencional1 TEXT,IN correo1 TEXT,IN direccion1 TEXT,IN ip_equipo1 TEXT,IN usuario_equipo1 TEXT, IN dir_ip_completa1 TEXT,
    IN observacion1 TEXT, IN genero1 TEXT,IN rol1 TEXT,IN estado1 TEXT,IN id_usuario1 BIGINT,IN fecha_registro1 TEXT)
BEGIN
INSERT INTO `fc_bitacora_registros_usuario`
            (`id_usuario`,
             `cedula`,
             `nombres`,
             `apellidos`,
             `telefono`,
             `convencional`,
             `correo`,
             `fecha_registro`,
             `estado`,
             `ip_equipo`,
             `ip_publica`,
             `usuario_equipo`,
             `dir_ip_completa`,
             `genero`,
             `direccion`,
             `rol`,
             `observacion`)
VALUES ( id_usuario1,
        cedula1,
        nombres1,
        apellidos1,
        telefono1,
        convencional1,
        correo1,
        fecha_registro1,
        estado1,
        ip_equipo1,
        '1',
        usuario_equipo1,
        dir_ip_completa1,
        genero1,
        direccion1,
        rol1,
        observacion1);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fc_ruc_local` */

/*!50003 DROP PROCEDURE IF EXISTS  `fc_ruc_local` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `fc_ruc_local`(in valor text, out salida text)
BEGIN
declare v_id int;
select count(`id_punto_venta`) into v_id from `fc_punto_venta` where `ruc_local` = valor; 
if(v_id = 0)then 
	UPDATE `fc_punto_venta`
	SET`ruc_local` = valor 
	WHERE `id_punto_venta` = 1;
	SET salida = 'Ruc agregado correctamente';
end if;    
	IF(v_id = 0)THEN     
	UPDATE `fc_punto_venta`
	SET`ruc_local` = valor 
	WHERE `id_punto_venta` = 1;
	set salida = 'Ruc actualizado';
END IF;    
    END */$$
DELIMITER ;

/* Procedure structure for procedure `filtroProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `filtroProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `filtroProducto`(IN consu TEXT)
BEGIN
	SET @query = CONCAT(consu);
    PREPARE statement FROM @query;       -- Preparar query.
    EXECUTE statement;                   -- Ejecutar query.
    DEALLOCATE PREPARE statement;        -- Eliminar query alojado en memoria.
    END */$$
DELIMITER ;

/* Procedure structure for procedure `FiltroRangoFecha` */

/*!50003 DROP PROCEDURE IF EXISTS  `FiltroRangoFecha` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FiltroRangoFecha`(
IN op INT,IN Fecha1 DATETIME, IN Fecha2 DATETIME
)
BEGIN
IF op=1 THEN 
	SELECT cnp.`id_cabecera_nota_pedidos`,cnp.`id_proveedor`,p.`entidad` AS proveedor,p.`correo`,p.`id_proveedor_clase`,pc.`clase`, 
	p.`direccion`,p.`cedula_ruc`,p.`representante`,p.`telefono`,cnp.`fecha_creacion`,cnp.`estado`,cnp.`iva`,cnp.`descuento`,cnp.`total`,
    cnp.`forma_pago`,cnp.`plazo` 
	FROM `cabecera_nota_pedidos` cnp 
	JOIN `proveedor` p ON p.`id_proveedor`= cnp.`id_proveedor` 
	JOIN `proveedor_clase` pc ON pc.`id_proclase`= p.`id_proveedor_clase` 
	WHERE fecha_creacion BETWEEN Fecha1 AND Fecha2 AND cnp.estado= "EF"; 
END IF; 
IF op=2 THEN 
	SELECT cnp.`id_cabecera_nota_pedidos`,cnp.`id_proveedor`,p.`entidad` AS proveedor,p.`correo`,p.`id_proveedor_clase`,pc.`clase`, 
	p.`direccion`,p.`cedula_ruc`,p.`representante`,p.`telefono`,cnp.`fecha_creacion`,cnp.`estado`,cnp.`iva`,cnp.`descuento`,cnp.`total`,
    cnp.`forma_pago`,cnp.`plazo` 
	FROM `cabecera_nota_pedidos` cnp 
	JOIN `proveedor` p ON p.`id_proveedor`= cnp.`id_proveedor` 
	JOIN `proveedor_clase` pc ON pc.`id_proclase`= p.`id_proveedor_clase` 
	WHERE fecha_creacion BETWEEN Fecha1 AND Fecha2 AND cnp.estado= "EF";  
END IF; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `FiltroRangoFecha2` */

/*!50003 DROP PROCEDURE IF EXISTS  `FiltroRangoFecha2` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FiltroRangoFecha2`(
IN op INT,IN Fecha1 DATETIME, IN Fecha2 DATETIME
)
BEGIN
IF op=1 THEN 
select distinct
pr.id_producto,
p.nombre,
p.descripcion,
SUM(dc.cantidad) AS `cantidad_comprado`,
SUM(dc.total) AS `total`
from cabecera_compra cp
join detalle_compra dc on dc.id_cabecera_compra=cp.id_cabecera_compra
join precios pr on pr.id_precio = dc.id_precio
join productos p on p.id_productos=pr.id_producto
join pagos pg on cp.id_tipoPago = pg.id_pagos
where fecha_creacion between (fecha1)and(fecha2)
GROUP BY 1,2
order by cantidad_comprado desc;
END IF; 
IF op=2 THEN 
	select distinct
pr.id_producto,
p.nombre,
p.descripcion,
SUM(dc.cantidad) AS `cantidad_comprado`,
SUM(dc.total) AS `total`
from cabecera_compra cp
join detalle_compra dc on dc.id_cabecera_compra=cp.id_cabecera_compra
join precios pr on pr.id_precio = dc.id_precio
join productos p on p.id_productos=pr.id_producto
join pagos pg on cp.id_tipoPago = pg.id_pagos
where fecha_creacion between (fecha1)and(fecha2)
GROUP BY 1,2
order by cantidad_comprado desc;
END IF; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `FiltroRangoFecha3` */

/*!50003 DROP PROCEDURE IF EXISTS  `FiltroRangoFecha3` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FiltroRangoFecha3`(
IN op INT,IN Fecha1 DATETIME, IN Fecha2 DATETIME
)
BEGIN
IF op=1 THEN 
	select distinct
p.id_productos,
p.nombre,
p.descripcion,
SUM(dv.cantidad) AS cantidad_venta,
SUM(cv.total) AS total
from cabecera_venta cv
join detalle_venta dv on dv.id_cabecera_venta=cv.id
join precios pr on pr.id_precio = dv.id_control
join productos p on p.id_productos=pr.id_producto
where fecha_creacion between (fecha1)and(fecha2)
GROUP BY 1,2,3
order by cantidad_venta desc;
END IF; 
IF op=2 THEN 
	select distinct
p.id_productos,
p.nombre,
p.descripcion,
SUM(dv.cantidad) AS cantidad_venta,
SUM(cv.total) AS total
from cabecera_venta cv
join detalle_venta dv on dv.id_cabecera_venta=cv.id
join precios pr on pr.id_precio = dv.id_control
join productos p on p.id_productos=pr.id_producto
where fecha_creacion between (fecha1)and(fecha2)
GROUP BY 1,2,3
order by cantidad_venta desc;
END IF; 
END */$$
DELIMITER ;

/* Procedure structure for procedure `FiltrosProductosNota` */

/*!50003 DROP PROCEDURE IF EXISTS  `FiltrosProductosNota` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `FiltrosProductosNota`(IN Buscar_Producto TEXT,IN accion TEXT)
BEGIN
CASE accion
    WHEN 'TODO' THEN
    SELECT DISTINCT df.id_detalle_faltantes,pr.id_precio,df.id_producto,p.nombre AS producto,m.id_marcas,m.nombre AS marca
    ,p.id_envase,en.nombre AS envase,p.id_medidas,me.nombre_medida AS medida
    ,t.id_tipo,t.nombre AS tipo ,df.cantidad,df.estado,pr.precio_compra AS precio,p.iva AS IVA
    FROM detalle_faltantes df
    JOIN productos p ON  p.id_productos= df.id_producto
    JOIN tipo t ON t.id_tipo=p.id_tipo
    JOIN marcas m ON m.id_marcas=p.id_marcas
    JOIN envase en ON en.id_envase = p.id_envase
    JOIN medidas me ON me.id_medidas = p.id_medidas
    JOIN precios pr ON pr.id_producto = p.id_productos
    WHERE df.estado= 'TR' AND p.`estado`='A' AND pr.`estado`='A' AND m.`estado`='A' AND t.`estado`='A' AND en.`estado`='A' AND me.`estado`='A'
    GROUP BY df.id_detalle_faltantes
    ORDER BY df.id_detalle_faltantes;
    
    
    WHEN 'CODIGO' THEN
    SELECT DISTINCT df.id_detalle_faltantes,pr.id_precio,df.id_producto,p.nombre AS producto,m.id_marcas,m.nombre AS marca,
    p.id_presentacion,pre.nombre AS presentacion, p.id_categoria,ca.nombre AS categoria,
    p.id_medidas,me.nombre_medida AS medida
    ,t.id_tipo,t.nombre AS tipo ,df.cantidad,df.estado,pr.precio_compra AS precio,p.iva AS IVA
    FROM detalle_faltantes df
    JOIN productos p ON  p.id_productos= df.id_producto
    JOIN tipo t ON t.id_tipo=p.id_tipo
    JOIN marcas m ON m.id_marcas=p.id_marcas
    JOIN categoria ca ON ca.id_categoria = p.id_categoria
    JOIN presentaciones pre ON pre.idPresentaciones= p.id_presentacion
    JOIN medidas me ON me.id_medidas = p.id_medidas
    JOIN precios pr ON pr.id_producto = p.id_productos
    WHERE df.estado= 'TR' AND p.`estado`='A' AND pr.`estado`='A' AND m.`estado`='A' AND t.`estado`='A' 
    AND ca.`estado`='A' AND pre.`estado`='A' AND me.`estado`='A'
    AND p.id_productos = Buscar_Producto
    GROUP BY df.id_detalle_faltantes
    ORDER BY df.id_detalle_faltantes;
    
    WHEN 'NOMBRE' THEN
    SELECT DISTINCT df.id_detalle_faltantes,pr.id_precio,df.id_producto,p.nombre AS producto,m.id_marcas,m.nombre AS marca,
    p.id_presentacion,pre.nombre AS presentacion, p.id_categoria,ca.nombre AS categoria,
    p.id_medidas,me.nombre_medida AS medida
    ,t.id_tipo,t.nombre AS tipo ,df.cantidad,df.estado,pr.precio_compra AS precio,p.iva AS IVA
    FROM detalle_faltantes df
    JOIN productos p ON  p.id_productos= df.id_producto
    JOIN tipo t ON t.id_tipo=p.id_tipo
    JOIN marcas m ON m.id_marcas=p.id_marcas
    JOIN categoria ca ON ca.id_categoria = p.id_categoria
    JOIN presentaciones pre ON pre.idPresentaciones= p.id_presentacion
    JOIN medidas me ON me.id_medidas = p.id_medidas
    JOIN precios pr ON pr.id_producto = p.id_productos
    WHERE df.estado= 'TR' AND p.`estado`='A' AND pr.`estado`='A' AND m.`estado`='A' AND t.`estado`='A' 
    AND ca.`estado`='A' AND pre.`estado`='A' AND me.`estado`='A'
    AND p.nombre LIKE Buscar_Producto
    GROUP BY df.id_detalle_faltantes
    ORDER BY df.id_detalle_faltantes;
    
    WHEN 'TIPO' THEN
    SELECT DISTINCT df.id_detalle_faltantes,pr.id_precio,df.id_producto,p.nombre AS producto,m.id_marcas,m.nombre AS marca,
    p.id_presentacion,pre.nombre AS presentacion, p.id_categoria,ca.nombre AS categoria,
    p.id_medidas,me.nombre_medida AS medida
    ,t.id_tipo,t.nombre AS tipo ,df.cantidad,df.estado,pr.precio_compra AS precio,p.iva AS IVA
    FROM detalle_faltantes df
    JOIN productos p ON  p.id_productos= df.id_producto
    JOIN tipo t ON t.id_tipo=p.id_tipo
    JOIN marcas m ON m.id_marcas=p.id_marcas
    JOIN categoria ca ON ca.id_categoria = p.id_categoria
    JOIN presentaciones pre ON pre.idPresentaciones= p.id_presentacion
    JOIN medidas me ON me.id_medidas = p.id_medidas
    JOIN precios pr ON pr.id_producto = p.id_productos
    WHERE df.estado= 'TR' AND p.`estado`='A' AND pr.`estado`='A' AND m.`estado`='A' AND t.`estado`='A' 
    AND ca.`estado`='A' AND pre.`estado`='A' AND me.`estado`='A'
    AND t.nombre LIKE Buscar_Producto
    GROUP BY df.id_detalle_faltantes
    ORDER BY df.id_detalle_faltantes;
    
    WHEN 'MEDIDA' THEN
	SELECT DISTINCT df.id_detalle_faltantes,pr.id_precio,df.id_producto,p.nombre AS producto,m.id_marcas,m.nombre AS marca,
    p.id_presentacion,pre.nombre AS presentacion, p.id_categoria,ca.nombre AS categoria,
    p.id_medidas,me.nombre_medida AS medida
    ,t.id_tipo,t.nombre AS tipo ,df.cantidad,df.estado,pr.precio_compra AS precio,p.iva AS IVA
    FROM detalle_faltantes df
    JOIN productos p ON  p.id_productos= df.id_producto
    JOIN tipo t ON t.id_tipo=p.id_tipo
    JOIN marcas m ON m.id_marcas=p.id_marcas
    JOIN categoria ca ON ca.id_categoria = p.id_categoria
    JOIN presentaciones pre ON pre.idPresentaciones= p.id_presentacion
    JOIN medidas me ON me.id_medidas = p.id_medidas
    JOIN precios pr ON pr.id_producto = p.id_productos
    WHERE df.estado= 'TR' AND p.`estado`='A' AND pr.`estado`='A' AND m.`estado`='A' AND t.`estado`='A' 
    AND ca.`estado`='A' AND pre.`estado`='A' AND me.`estado`='A' 
	AND me.nombre_medida LIKE Buscar_Producto
	GROUP BY df.id_detalle_faltantes
	ORDER BY df.id_detalle_faltantes;
    
    WHEN 'PRESENTACION' THEN
	SELECT DISTINCT df.id_detalle_faltantes,pr.id_precio,df.id_producto,p.nombre AS producto,m.id_marcas,m.nombre AS marca,
    p.id_presentacion,pre.nombre AS presentacion, p.id_categoria,ca.nombre AS categoria,
    p.id_medidas,me.nombre_medida AS medida
    ,t.id_tipo,t.nombre AS tipo ,df.cantidad,df.estado,pr.precio_compra AS precio,p.iva AS IVA
    FROM detalle_faltantes df
    JOIN productos p ON  p.id_productos= df.id_producto
    JOIN tipo t ON t.id_tipo=p.id_tipo
    JOIN marcas m ON m.id_marcas=p.id_marcas
    JOIN categoria ca ON ca.id_categoria = p.id_categoria
    JOIN presentaciones pre ON pre.idPresentaciones= p.id_presentacion
    JOIN medidas me ON me.id_medidas = p.id_medidas
    JOIN precios pr ON pr.id_producto = p.id_productos
    WHERE df.estado= 'TR' AND p.`estado`='A' AND pr.`estado`='A' AND m.`estado`='A' AND t.`estado`='A' 
    AND ca.`estado`='A' AND pre.`estado`='A' AND me.`estado`='A' 
	AND pre.nombre LIKE Buscar_Producto
	GROUP BY df.id_detalle_faltantes
	ORDER BY df.id_detalle_faltantes;
        
    WHEN 'MARCA' THEN
	SELECT DISTINCT df.id_detalle_faltantes,pr.id_precio,df.id_producto,p.nombre AS producto,m.id_marcas,m.nombre AS marca,
    p.id_presentacion,pre.nombre AS presentacion, p.id_categoria,ca.nombre AS categoria,
    p.id_medidas,me.nombre_medida AS medida
    ,t.id_tipo,t.nombre AS tipo ,df.cantidad,df.estado,pr.precio_compra AS precio,p.iva AS IVA
    FROM detalle_faltantes df
    JOIN productos p ON  p.id_productos= df.id_producto
    JOIN tipo t ON t.id_tipo=p.id_tipo
    JOIN marcas m ON m.id_marcas=p.id_marcas
    JOIN categoria ca ON ca.id_categoria = p.id_categoria
    JOIN presentaciones pre ON pre.idPresentaciones= p.id_presentacion
    JOIN medidas me ON me.id_medidas = p.id_medidas
    JOIN precios pr ON pr.id_producto = p.id_productos
    WHERE df.estado= 'TR' AND p.`estado`='A' AND pr.`estado`='A' AND m.`estado`='A' AND t.`estado`='A' 
    AND ca.`estado`='A' AND pre.`estado`='A' AND me.`estado`='A' 
	AND m.nombre LIKE Buscar_Producto
	GROUP BY df.id_detalle_faltantes
	ORDER BY df.id_detalle_faltantes;
    END CASE;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getComboPrecios` */

/*!50003 DROP PROCEDURE IF EXISTS  `getComboPrecios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getComboPrecios`(IN op BIGINT, IN id BIGINT,OUT valor DOUBLE(5,2))
BEGIN
	SET valor='';
	IF op=1 THEN 
	SELECT DISTINCT (p.`precio_compra`) INTO valor
	FROM `precios` p
	WHERE p.`id_precio`= id;
	END IF;
	IF op=2 THEN
	SELECT DISTINCT (p.`precio_venta`) INTO valor
	FROM `precios` p
	WHERE p.`id_precio`= id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getLocalidadComboGuayas` */

/*!50003 DROP PROCEDURE IF EXISTS  `getLocalidadComboGuayas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getLocalidadComboGuayas`(IN op BIGINT,IN id BIGINT, OUT valor TEXT)
BEGIN
    SET valor='';
	IF op=1 THEN 
	 SELECT DISTINCT (t.`localidad`) INTO valor
	FROM `fc_punto_venta` p
	JOIN `fc_localidad_guayas` t ON t.`id_localidad_guayas`= p.`id_localidad_guayas`
	WHERE p.`id_punto_venta`= id;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `getNombreComboProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `getNombreComboProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `getNombreComboProducto`(IN op BIGINT,IN id BIGINT, OUT valor TEXT,OUT valord DOUBLE)
BEGIN	
	SET valor='';
	IF op=1 THEN 
	SELECT DISTINCT (t.`nombre`) INTO valor
	FROM `productos` p
	JOIN tipo t ON t.`id_tipo`= p.`id_tipo`
	WHERE p.`id_tipo`= id;
	END IF;
	IF op=2 THEN
	SELECT DISTINCT (m.`nombre_medida`) INTO valor
	FROM `productos` p
	JOIN `medidas` m ON m.`id_medidas`= p.`id_medidas`
	WHERE p.`id_medidas`=id;
	END IF;
	IF op=3 THEN
	SELECT DISTINCT (pr.`nombre`) INTO valor
	FROM `productos` p
	JOIN `presentaciones` pr ON pr.`idPresentaciones`= p.`id_presentacion`
	WHERE p.`id_presentacion`= id;
	END IF;
	IF op=4 THEN
	SELECT DISTINCT (m.`nombre`) INTO valor
	FROM `productos` p
	JOIN `marcas` m ON m.`id_marcas`= p.`id_marcas`
	WHERE p.`id_marcas`=id;
	END IF;
        IF op=5 THEN
	SELECT DISTINCT (p.iva) INTO valor
	FROM `productos` p
	WHERE p.id_productos =id;
	END IF;
	IF op=6 THEN
	SELECT DISTINCT(p.`precio_compra`) INTO valord
	FROM `precios` p 
	WHERE p.id_producto =id AND p.`estado`='A';
	END IF;
	IF op=7 THEN
	SELECT DISTINCT(p.`precio_venta`) INTO valord
	FROM `precios` p 
	WHERE p.id_producto =id AND p.`estado`='A';
	END IF;
	IF op=8 THEN
	SELECT DISTINCT (p.estado1) INTO valor
	FROM `precios` p
	WHERE p.id_producto =id AND estado='A';
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ingresarProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `ingresarProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresarProducto`(in codigo1 varchar(13),IN nombre1 VARCHAR(45),
IN descripcion1 VARCHAR(80),IN fecha_registro1 DATE,IN peso1 DOUBLE(7,2),IN id_tipo1 BIGINT(20), 
IN id_medidas1 BIGINT(20),IN id_categoria1 BIGINT(20),IN id_presentacion1 BIGINT(20),IN id_marcas1 BIGINT(20),
IN id_usuario1 BIGINT,IN iva1 VARCHAR(15),IN cantidad_minima1 BIGINT,IN receta1 VARCHAR(45),
IN unidade1 BIGINT, OUT valor1 TEXT)
BEGIN
	DECLARE nr INT; 
DECLARE id_pro INT; 
IF (nombre1='' OR descripcion1=''OR fecha_registro1='' OR peso1='' OR id_tipo1='' OR id_medidas1=''
 OR id_categoria1='' OR id_presentacion1='' OR id_marcas1='') THEN 
SET valor1 ='campos invalidos2'; 
ELSE 
INSERT INTO `productos` (codigo_barras, `nombre`,`descripcion`,`fecha_registro`,`peso`,`id_tipo`, 
`id_medidas`,`id_categoria`,`id_presentacion`,`id_marcas`,`estado`,`id_usuario`,`iva`,`cantidad_minima`,`receta`,`unidades`) 
VALUES(codigo1,nombre1,descripcion1,fecha_registro1,peso1,id_tipo1,
id_medidas1,id_categoria1,id_presentacion1,id_marcas1,'A',id_usuario1,iva1,cantidad_minima1,receta1,unidade1); 
SET id_pro = (SELECT EncontrarID(nombre1,id_marcas1,id_medidas1,id_tipo1,id_categoria1,id_presentacion1)); 
INSERT INTO `detalle_faltantes`(`id_producto`,`fecha_registro`,`cantidad`,`estado`) 
VALUES (id_pro,fecha_registro1,0,'NO'); 
SET valor1 ='exito'; 
END IF; 
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ingresarProductoConvertidor` */

/*!50003 DROP PROCEDURE IF EXISTS  `ingresarProductoConvertidor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresarProductoConvertidor`(IN nombre1 VARCHAR(45),IN descripcion1 VARCHAR(80),
IN fecha_registro1 DATE,IN peso1 DOUBLE(7,2),IN id_tipo1 BIGINT(20),
	IN id_medidas1 BIGINT(20),IN id_categoria1 BIGINT(20),IN id_presentacion1 BIGINT(20),IN id_marcas1 BIGINT(20),
    IN id_usuario1 BIGINT,IN iva1 VARCHAR(15),IN cantidad_minima1 BIGINT, OUT valor1 TEXT)
BEGIN
	DECLARE id_pro INT;
	INSERT INTO `productos` (`nombre`,`descripcion`,`fecha_registro`,`peso`,`id_tipo`,
	`id_medidas`,`id_categoria`,`id_presentacion`,`id_marcas`,`estado`,`id_usuario`,`iva`,`cantidad_minima`)
	VALUES(nombre1,descripcion1,fecha_registro1,peso1,id_tipo1,id_medidas1,id_categoria1,id_presentacion1,id_marcas1,'A',id_usuario1,iva1,cantidad_minima1);
	SET id_pro = (SELECT EncontrarID(nombre1,id_marcas1,id_medidas1,id_tipo1,id_categoria1,id_presentacion1));
	INSERT INTO `detalle_faltantes`(`id_producto`,`fecha_registro`,`cantidad`,`estado`) VALUES (id_pro,fecha_registro1,0,'NO');
	SET valor1 = id_pro;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ingresoDePrecios` */

/*!50003 DROP PROCEDURE IF EXISTS  `ingresoDePrecios` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ingresoDePrecios`(IN op BIGINT, id_producto1 BIGINT,IN precio_compra2 DOUBLE(5,2),IN precio_venta3 DOUBLE(5,2),
    IN fecha_registro6 TEXT,IN id_usuario7 BIGINT,OUT valor1 TEXT)
BEGIN
	DECLARE id_pre INT;
	IF (op=1)THEN
	UPDATE `precios` SET `estado`='A',`fecha_registro`=fecha_registro6,`id_usuario`=id_usuario7
	WHERE `id_producto`= id_producto1 AND `precio_compra`=precio_compra2 AND `precio_venta`=precio_venta3;
                
        SET id_pre =(SELECT `id_precio` FROM `precios` WHERE `precio_compra`=precio_compra2 AND `precio_venta`=precio_venta3 AND 
        `fecha_registro`= fecha_registro6);
        
        -- UPDATE `precios` SET `estado`='I' WHERE `id_producto`= id_producto1 AND`id_precio` < id_pre;   
        UPDATE `precios` SET estado='I' WHERE `id_precio` NOT IN (id_pre) AND `id_producto`=id_producto1;
        SET valor1='precio ingresado';
        
        INSERT INTO `bitacora_precios`(`id_producto`,`precio_compra`,`precio_venta`,`fecha_registro`,`id_usuario`)
        VALUES(id_producto1,precio_compra2,precio_venta3,fecha_registro6,id_usuario7);
        END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `iniciar_sesion` */

/*!50003 DROP PROCEDURE IF EXISTS  `iniciar_sesion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `iniciar_sesion`(IN correo1 TEXT,IN password1 TEXT,IN ip_equipo1 TEXT, /*ip_publico1 text,*/ IN usuario_equipo1 TEXT, OUT salida TEXT)
BEGIN
DECLARE fecha_login1 DATETIME;
DECLARE ip_publico1 TEXT;
DECLARE valor INT;
DECLARE id_usuario1 BIGINT;
SET ip_publico1='100000';
SELECT NOW() INTO fecha_login1; 
SELECT COUNT(id_usuario) INTO valor FROM fc_usuario WHERE correo=correo1 AND PASSWORD=password1;
SELECT id_usuario INTO id_usuario1 FROM fc_usuario WHERE correo=correo1 AND PASSWORD=password1;
IF(valor=1) THEN 
INSERT INTO fc_session(id_usuario, ip_equipo, ip_publico, usuario_equipo, fecha_login) 
VALUES(id_usuario1, ip_equipo1, ip_publico1, usuario_equipo1, fecha_login1);
SET salida= 'Bienvenido';
ELSE SET salida='Usuario no existe';
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertaBitacoraFaltantes` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertaBitacoraFaltantes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertaBitacoraFaltantes`(IN id_detalle_faltantes1 BIGINT(20), 
IN fecha_registro1 DATETIME,
IN cantidad1 INT
)
BEGIN
INSERT INTO `bitacora_faltantes` (`id_detalle_faltantes`,`fecha_registro`,`cantidad`)
	VALUES(id_detalle_faltantes1,fecha_registro1,cantidad1);
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarCabceraCompras` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarCabceraCompras` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCabceraCompras`(in id_proveedor2 bigint,in id_usuario3 bigint,
in fecha_creacion4 datetime,in plazo5 varchar(45),in id_sucursal6 bigint,in id_tipoPago7 varchar(45),in iva8 Decimal(10,7),
in descuento9 DECIMAL(10,7),in total10 DECIMAL(10,7),in id_cab_ped11 bigint,out valor text)
BEGIN
	declare id_pago bigint;
	set id_pago =(SELECT `id_pagos` FROM `pagos` WHERE `nombre`=id_tipoPago7);
	
	insert into `cabecera_compra` (`id_proveedor`,`id_usuario`,`fecha_creacion`,`plazo`,`id_sucursal`,`id_tipoPago`,`iva`,`descuento`,`total`,`estado`)
	values(id_proveedor2,id_usuario3,fecha_creacion4,plazo5,id_sucursal6,id_pago,iva8,descuento9,total10,'A');
	
	set valor =(SELECT `id_cabecera_compra` FROM `cabecera_compra` WHERE `id_proveedor`= id_proveedor2 AND `id_usuario`= id_usuario3 AND `fecha_creacion` = fecha_creacion4 
	AND `id_sucursal`= id_sucursal6 AND `total`= total10);
	
	UPDATE `cabecera_nota_pedidos` SET estado='EF',`iva`= iva8,`descuento`= descuento9,`total`= total10 WHERE `id_cabecera_nota_pedidos`= id_cab_ped11;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarCabeceraNotaPedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarCabeceraNotaPedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCabeceraNotaPedido`(IN id_proveedor1 BIGINT,IN id_usuario2 BIGINT,IN fecha_creacion3 DATETIME,
    IN plazo5 VARCHAR(45), IN forma_pago6 VARCHAR(45),IN iva7 DOUBLE, IN descuento8 DOUBLE,IN total9 DOUBLE, OUT valor TEXT)
BEGIN
	INSERT INTO `cabecera_nota_pedidos`(`id_proveedor`,`id_usuario`,`fecha_creacion`,`estado`,`plazo`,`forma_pago`,`iva`,`descuento`,`total`)
	VALUES (id_proveedor1,id_usuario2,fecha_creacion3,'SI',plazo5,forma_pago6,iva7,descuento8,total9);
	
	SET valor =(SELECT `id_cabecera_nota_pedidos` FROM `cabecera_nota_pedidos` WHERE `id_proveedor`=id_proveedor1 AND `id_usuario`=id_usuario2 AND
	`fecha_creacion`=fecha_creacion3 AND `estado`='SI' AND `plazo`= plazo5 AND `forma_pago`=forma_pago6 AND `iva`=iva7 AND 
	`descuento`=descuento8 AND `total`= total9);
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertarCabeceraVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertarCabeceraVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarCabeceraVentas`(
    in _num_venta varchar(70),
    in _id_cliente bigint,
    in _id_usuario BIGINT,
    in _id_sucursal bigint,
    in _tipo_pago TEXT,
    in _tipo_venta text,
    in _Subtotal_con_iva decimal(10,5),
    in _Subtotal_sin_iva decimal(10,5),
    in _iva_total decimal(10,5),
    in _descuento_total decimal(19,5),
    in _total decimal(10,5),
    in _utilidad decimal(10,5),
    in _estado varchar(10),
    out valor text
)
BEGIN
    
    declare _fecha_creacion datetime;
    set _fecha_creacion = now();
    set valor='';
    insert into `cabecera_venta`(num_venta,fecha_creacion,id_cliente, id_usuario,id_sucursal,tipo_pago,tipo_venta,Subtotal_con_iva,Subtotal_sin_iva,iva_total,descuento_total,total,utilidad,estado)
    values(_num_venta,_fecha_creacion,_id_cliente,_id_usuario,_id_sucursal,_tipo_pago,_tipo_venta,_Subtotal_con_iva,_Subtotal_sin_iva,_iva_total,_descuento_total,_total,_utilidad,_estado);
    set valor = (select id from cabecera_venta where id_usuario=_id_usuario  and num_venta = _num_venta and fecha_creacion = _fecha_creacion );
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarClientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarClientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarClientes`(
in cedula text,
in nombre text,
in apellido text,
in direccion text,
in telefono text,
in correo text,
out msg text
)
BEGIN
declare valor int;
declare fecha_reg date;
select now() into fecha_reg;
select count(Cedula) into valor from Clientes where Cedula=cedula;
 INSERT INTO Clientes 
(Cedula, Nombre, Apellido, Direccion, Fecha_reg, Estado, str_telefono, str_correo)
VALUES (cedula, nombre, apellido, direccion, fecha_reg, 'A', telefono, correo);
set msg = 'Cliente guardado con éxito!!';
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarCorreo` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarCorreo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCorreo`( 
IN tipo_correo1 INT ,
IN correo TEXT,
IN cedula1 TEXT 
)
BEGIN
INSERT INTO proveedor_mail(id_tipo_correo, mail, cedula_ruc)
VALUES ( tipo_correo1, correo,cedula1);
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarCorreoCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarCorreoCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarCorreoCliente`( 
IN cedula1 TEXT, 
IN correo TEXT,
OUT msg TEXT)
BEGIN
 
INSERT INTO Correo ( Correo, Cedula)
VALUES ( correo, cedula1);
SET msg = 'Correo guardado';
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarDetalleCompras` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarDetalleCompras` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarDetalleCompras`(in id_cabecera_compra1 bigint,in id_precio2 bigint,
in cantidad3 bigint,in precio4 decimal(10,7),in descuento5 DECIMAL(10,7),in iva6 DECIMAL(10,7),in total7 DECIMAL(10,7),in bono8 bigint)
BEGIN
	declare id_preciox bigint;
	Declare cantidadx bigint;
	declare cant bigint;
	declare cant2 bigint;
	Declare cantcomp Bigint;
	Declare id_productox bigint;
	declare cant_faltante bigint; 
	
	insert into `detalle_compra`(`id_cabecera_compra`,`id_precio`,`cantidad`,`precio`,`descuento`,`iva`,`total`,bono)
	values (id_cabecera_compra1,id_precio2,cantidad3,precio4,descuento5,iva6,total7,bono8);
	
	#set id_precio=(SELECT `id_precio` FROM `stock` WHERE `id_precio`=id_precio2);
	SELECT `id_precio` INTO  id_preciox  FROM `stock` WHERE `id_precio`=id_precio2;
	
	if(id_preciox = id_precio2)then
	SET cantidadx=(SELECT `cantidad` FROM `stock` WHERE `id_precio`=id_precio2);
	SET cant =(cantidadx + cantidad3+bono8);
	UPDATE `stock` SET `cantidad` = cant WHERE `id_precio` = id_precio2;
	else
	set cant2 = (cantidad3+bono8);
	INSERT INTO `stock`(`cantidad`,`id_precio`)VALUES(cant2,id_precio2);
	end if;
	
	SELECT pw.`id_producto` into id_productox FROM precios pw WHERE pw.`id_precio`= id_precio2;
	
	SELECT `cantidad` into cantcomp FROM `detalle_faltantes` WHERE `id_producto`= id_productox;
	
	set cant_faltante =(cantcomp-cantidad3);
	IF(cant_faltante<0)THEN 
	UPDATE `detalle_faltantes` SET `cantidad` = '0' ,`estado` ='OK' WHERE `id_producto` = id_productox;
	ELSE
	UPDATE `detalle_faltantes` SET `cantidad` =  cant_faltante,`estado` ='OK' WHERE `id_producto` = id_productox;
	END IF;
	-- "INSERT INTO `detalle_compra`(`id_cabecera_compra`,`id_precio`,`cantidad`,`precio`,`descuento`,`iva`,`total`,bono)
	-- VALUES(" + id_cab + "," + lista3.get(i).getId_precio() + "," + lista3.get(i).getCantidad().toString() + ","
        -- + lista3.get(i).getPrecio().toString() + "," + lista3.get(i).getDescuento().toString() + ","+ lista3.get(i).getIva().toString() + "," 
        -- + lista3.get(i).getTotal().toString() + "," + lista3.get(i).getBono().toString() + ");");
	
	-- id_precio = crud.buscarIDPrecioEnStock("SELECT `id_precio` FROM `stock` WHERE `id_precio`=" + lista3.get(i).getId_precio().toString());
	-- INSERT INTO `stock` (`cantidad`,`id_precio`)VALUES(" + lista3.get(i).getCantidad().toString() + "," + lista3.get(i).getId_precio().toString() + ");
	-- "SELECT `cantidad` FROM `stock` WHERE `id_precio`=" + lista3.get(i).getId_precio() + ";");
	-- UPDATE `stock` SET `cantidad` = " + cantidadx + " WHERE `id_precio` = " + lista3.get(i).getId_precio() + ";");
	
  --            System.out.println("Cantidad existente"+CantidadComp);
    --           System.out.println("Cantidad "+Integer.valueOf(lista3.get(i).getCantidad().toString()));
      --          CantidadComp = CantidadComp - Integer.valueOf(lista3.get(i).getCantidad().toString());
        --        System.out.println("Cantidad Restada de Faltantes"+CantidadComp);
          -- crud.UpdateCantidadFaltantes("UPDATE `detalle_faltantes` SET `cantidad` = " + CantidadComp + " WHERE `id_producto` = "+lista3.get(i).getId_producto()+";");
    END */$$
DELIMITER ;

/* Procedure structure for procedure `InsertarDetalleVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `InsertarDetalleVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarDetalleVentas`(
    in _id_cabecera_venta BIGINT,
    in _id_control BIGINT,
    in _precio decimal(10,7),
    in _cantidad bigint,
    in _iva decimal(10,7),
    in _descuento decimal(10,7),
    out valor text
)
BEGIN
    set valor='';
    insert into `detalle_venta`(id_cabecera_venta,id_control,precio,cantidad,iva,descuento)
    values(_id_cabecera_venta,_id_control,_precio,_cantidad,_iva,_descuento);
    set valor = (select id from detalle_venta where id_cabecera_venta =_id_cabecera_venta  and id_control = _id_control and cantidad = _cantidad);
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarLab` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarLab` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarLab`(in ruc1 text, in nombre1 text, in direccion1 text, in telefono1 text,
in fecha1 date, in imagen1 text, in correo1 text, out valor text)
BEGIN
if(ruc1 =''
or nombre1 = ''
or direccion1 = ''
or telefono1 = ''
or fecha1 = ''
or imagen1 = ''
or correo1= '') then
set valor = 'Datos incorrectos !';
else 
insert into laboratorio (RUC, Nombre, Direccion, Telefono, Fecha, Imagen, Correo)
values (ruc1, nombre1, direccion1, telefono1, fecha1, imagen1, correo1);
set valor = 'Laboratorio guardado..';
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarMarcaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarMarcaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarMarcaProducto`(IN nombre1 VARCHAR(80), OUT valor1 TEXT)
BEGIN
	DECLARE nr INT;
	IF (nombre1='') THEN
	SET valor1 ='campos invalidos';
	ELSE
	SET nr = (SELECT validarMarcaProducto(nombre1));
	IF(nr<1) THEN 
	INSERT INTO marcas (`nombre`,estado) VALUES (nombre1,'A');
	SET valor1 ='exito';
	ELSE
	SET valor1 ='ya existe';
	END IF;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarMedidaProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarMedidaProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarMedidaProducto`(IN nombre_medida1 VARCHAR(80), OUT valor1 TEXT)
BEGIN
	DECLARE nr INT;
    
	IF (nombre_medida1='') THEN
	SET valor1 ='campos invalidos';
	ELSE
	SET nr = (SELECT validarMedidaProducto(nombre_medida1));
	IF(nr<1) THEN 
	INSERT INTO medidas (`nombre_medida`,estado) VALUES (nombre_medida1,'A');
	SET valor1 ='exito';
	ELSE
	SET valor1 ='ya existe';
	END IF;
	END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarProveedor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarProveedor`(IN id_proveedor_clase1 BIGINT,IN cedula2 VARCHAR(15),
IN entidad3 VARCHAR(100), IN representante4 VARCHAR(70), IN direccion5 VARCHAR(100),IN fecha6 DATE,IN telefono7 VARCHAR(70),IN correo8 VARCHAR(70),IN imagen TEXT, OUT valor TEXT)
BEGIN
DECLARE cons INT;
SELECT COUNT(cedula_ruc) INTO cons FROM proveedor WHERE cedula_ruc = cedula2;
IF(cons = 0 ) THEN
INSERT INTO proveedor(`id_proveedor_clase`,`cedula_ruc`,`entidad`,`representante`,`direccion`,`fecha_registro`,`estado`,`telefono`,`correo`,`direccionImagen`)VALUES(id_proveedor_clase1,cedula2
,entidad3,representante4,direccion5,fecha6,'A',telefono7,correo8,imagen);
SET valor = 'Proveedor guardado con exito';
ELSE 
SET valor = NULL;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarTelefono` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarTelefono` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarTelefono`(
IN id_Tipo_Telefono1 INT,
IN numero TEXT,
IN cedula1 TEXT)
BEGIN
INSERT INTO proveedor_telefono( id_tipo_telefono,telefono, cedula_ruc)
VALUES ( id_Tipo_Telefono1, numero, cedula1);
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarTelefonoCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarTelefonoCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarTelefonoCliente`(
IN cedula1 TEXT,
IN id_Tipo_Telefono1 INT,
IN numero TEXT,
OUT msg TEXT)
BEGIN
INSERT INTO Telefono ( id_Tipo_Telefono,Numero, Cedula)
VALUES ( id_Tipo_Telefono1, numero, cedula1);
SET msg = 'Telefono guardado!!';
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertarTipoProducto` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertarTipoProducto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertarTipoProducto`(in nombre1 varchar(80), out valor1 text)
BEGIN
	declare nr int;
	if (nombre1='') then
	set valor1 ='campos invalidos';
	else
	set nr = (SELECT validarTipoProducto(nombre1));
	if(nr<1) then 
	insert into tipo (`nombre`,`estado`) values (nombre1,'A');
	set valor1 ='exito';
	else
	set valor1 ='ya existe';
	end if;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `Insertar_Categoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `Insertar_Categoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Categoria`(
in nombre1 text,out salida text)
BEGIN
declare v int;
set v=(SELECT validarCategoriaProducto(nombre1));
	if(v<1) then 
    insert into categoria (nombre,estado,fecha_creacion)VALUES (nombre1,'A',now());
	set salida = 'DATO INSERTADO';
	else
	set salida ='DATO EXISTENTE';
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertar_fecha_caducidad` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertar_fecha_caducidad` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_fecha_caducidad`(in fecha_cad date,in cod_det bigint,out valor text)
BEGIN
  UPDATE detalle_nota_pedidos SET fecha_caducidad = fecha_cad WHERE id_detalle_nota_pedidos=cod_det;
  set valor = 'exito';
END */$$
DELIMITER ;

/* Procedure structure for procedure `insertar_iva` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertar_iva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_iva`(IN iva1 DOUBLE, IN id_usuario1 INT, OUT msg TEXT)
BEGIN
	update iva set est = 'I';
	INSERT INTO iva(iva,fecha,id_usuario,est)VALUES(iva1,NOW(),id_usuario1,'A');
    SET msg = 'Valor Agregado';
END */$$
DELIMITER ;

/* Procedure structure for procedure `Insertar_Kardex` */

/*!50003 DROP PROCEDURE IF EXISTS  `Insertar_Kardex` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Kardex`(IN op BIGINT,
IN id_producto1 BIGINT,IN id_cabecera1 BIGINT,IN id_detalle1 BIGINT,IN id_precio1 BIGINT,
IN cantidad1 BIGINT,IN total1 DOUBLE(7,2),OUT valor TEXT)
BEGIN	
SET valor='';
IF op=1 THEN 
-- KARDEX COMPRA --
INSERT INTO kardex (id_producto,id_cabecera_compra,id_detalle_compra,id_precio,cantidad,total)
VALUES (id_producto1,id_cabecera1,id_detalle1,id_precio1,cantidad1,total1);
SET valor='COMPRA REALIZADA';
END IF;
IF op=2 THEN
-- KARDEX VENTA --
INSERT INTO kardex (id_producto,id_cabecera_venta,id_detalle_venta,id_precio,cantidad,total) 
VALUES (id_producto1,id_cabecera1,id_detalle1,id_precio1,cantidad1,total1);
SET valor='VENTA REALIZADA';
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Insertar_Presentaciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `Insertar_Presentaciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Presentaciones`(
in nombre1 text,IN usuario1 VARCHAR(15) ,out salida text)
BEGIN
declare v int;
set v=(SELECT validarPresentacionesProducto(nombre1));
	if(v<1) then 
    insert into presentaciones(nombre,estado,usuarioCreacion,fechaCreacion)VALUES (nombre1,'A',usuario1,now());
	set salida = 'DATO INSERTADO';
	else
	set salida ='DATO EXISTENTE';
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Insertar_Tipo` */

/*!50003 DROP PROCEDURE IF EXISTS  `Insertar_Tipo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Tipo`(in nombre_f text, out salida text)
BEGIN
	declare nra int;
    declare esta_f char(1);
    
    set esta_f = 'A';
    
	if (nombre_f='') then
	set salida ='INSERTE DATOS';
	else
	set nra = (SELECT validarTipoProducto(nombre_f));
	if(nra<1) then 
	insert into tipo (`nombre`, `estado`) values (nombre_f, esta_f);
	set salida ='DATO INGRESADO';
	else
	set salida ='DATO EXISTENTE';
	end if;
	end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `libreTransaccion` */

/*!50003 DROP PROCEDURE IF EXISTS  `libreTransaccion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `libreTransaccion`(IN consu text)
BEGIN
    SET @query = CONCAT(consu);
    PREPARE statement FROM @query;       -- Preparar query.
    EXECUTE statement;                   -- Ejecutar query.
    DEALLOCATE PREPARE statement;        -- Eliminar query alojado en memoria.
END */$$
DELIMITER ;

/* Procedure structure for procedure `listaComboLocalidadr` */

/*!50003 DROP PROCEDURE IF EXISTS  `listaComboLocalidadr` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listaComboLocalidadr`()
BEGIN
	SELECT `id_localidad_guayas`,`localidad` FROM `fc_localidad_guayas` ORDER BY `localidad` ASC;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listarClientes` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarClientes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarClientes`()
BEGIN
select * from Clientes order by Nombre;
END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarClientesVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarClientesVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarClientesVentas`(
IN op INT
)
BEGIN
    IF op=1 THEN 
        SELECT clientes.id_Clientes AS  Codigo,clientes.Cedula AS Cedula,clientes.Nombre AS Nombre, clientes.Apellido AS Apellido, clientes.Direccion AS Direccion,
        clientes.str_telefono AS Telefono, clientes.str_correo AS Correo 
        from clientes 
        where clientes.Estado = 'A';
    
    end IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarComboCategoria` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarComboCategoria` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarComboCategoria`()
BEGIN
SELECT id_categoria,nombre FROM categoria where estado='A' ORDER BY nombre;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarComboIva` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarComboIva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarComboIva`()
BEGIN
    SELECT `id_iva`,`iva`,`fecha`,`id_usuario`,`est` FROM `iva` WHERE est = 'A';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listarComboMarcaPro` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarComboMarcaPro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarComboMarcaPro`()
BEGIN
	SELECT `id_marcas`,`nombre` FROM marcas WHERE estado = 'A' ORDER BY nombre;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listarComboMedidaPro` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarComboMedidaPro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarComboMedidaPro`()
BEGIN
	SELECT `id_medidas`,`nombre_medida` FROM `medidas` WHERE estado = 'A'ORDER BY nombre_medida ;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listarComboPresentaciones` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarComboPresentaciones` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarComboPresentaciones`()
BEGIN
SELECT idPresentaciones,nombre FROM presentaciones where estado='A' ORDER BY nombre;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarComboTipoPro` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarComboTipoPro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarComboTipoPro`()
BEGIN
	SELECT `id_tipo`,`nombre` FROM `tipo` where estado='A' order by nombre;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listarCorreo` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarCorreo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarCorreo`(in cedula1 text)
BEGIN
select * from Correo where Cedula = cedula1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarFaltantes` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarFaltantes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarFaltantes`(in op int,in id_cabecera_faltantes1 bigint)
BEGIN
if op= 1 then
select df.id_detalle_faltantes,t.id_tipo,t.nombre as nombre_tipo,df.id_producto,p.nombre as nombre_producto ,df.cantidad,
df.estado,m.id_marcas,m.nombre as marca
from detalle_faltantes df
join productos p on  p.id_productos= df.id_producto
join tipo t on t.id_tipo=p.id_tipo
JOIN marcas m on m.id_marcas=p.id_marcas
where df.estado= 'NO';
end if ;
if op= 2 then
select df.id_detalle_faltantes,df.id_cabecera_faltantes,t.id_tipo,t.nombre as nombre_tipo,df.id_producto,p.nombre as nombre_producto ,df.cantidad,
df.estado,m.id_marcas,m.nombre as marca
from detalle_faltantes df
join productos p on  p.id_productos= df.id_producto
join tipo t on t.id_tipo=p.id_tipo
JOIN marcas m on m.id_marcas=p.id_marcas
where df.id_cabecera_faltantes= id_cabecera_faltantes1;
end if ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarfaltantesEnNota` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarfaltantesEnNota` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarfaltantesEnNota`(IN op INT)
BEGIN
IF op= 1 THEN
SELECT DISTINCT df.id_detalle_faltantes,pr.id_precio,df.id_producto,p.nombre AS producto,m.id_marcas,m.nombre AS marca,
p.id_presentacion,pre.nombre AS presentacion, p.id_categoria,ca.nombre AS categoria,
p.id_medidas,me.nombre_medida AS medida
,t.id_tipo,t.nombre AS tipo ,df.cantidad,df.estado,pr.precio_compra AS precio,p.iva AS IVA
FROM detalle_faltantes df
JOIN productos p ON  p.id_productos= df.id_producto
JOIN tipo t ON t.id_tipo=p.id_tipo
JOIN marcas m ON m.id_marcas=p.id_marcas
JOIN categoria ca ON ca.id_categoria = p.id_categoria
JOIN presentaciones pre ON pre.idPresentaciones= p.id_presentacion
JOIN medidas me ON me.id_medidas = p.id_medidas
JOIN precios pr ON pr.id_producto = p.id_productos
WHERE df.estado= 'TR' AND p.`estado`='A' AND pr.`estado`='A' AND m.`estado`='A' AND t.`estado`='A' 
AND ca.`estado`='A' AND pre.`estado`='A' AND me.`estado`='A'
GROUP BY df.id_detalle_faltantes
ORDER BY df.id_detalle_faltantes;
END IF ;
IF op= 2 THEN
SELECT df.id_detalle_faltantes,pr.id_precio,df.id_producto,p.nombre AS producto,m.id_marcas,m.nombre AS marca,
p.id_presentacion,pre.nombre AS presentacion, p.id_categoria,ca.nombre AS categoria,
p.id_medidas,me.nombre_medida AS medida
,t.id_tipo,t.nombre AS tipo ,df.cantidad,df.estado,pr.precio_compra AS precio,p.iva AS IVA
FROM detalle_faltantes df
JOIN productos p ON  p.id_productos= df.id_producto
JOIN tipo t ON t.id_tipo=p.id_tipo
JOIN marcas m ON m.id_marcas=p.id_marcas
JOIN categoria ca ON ca.id_categoria = p.id_categoria
JOIN presentaciones pre ON pre.idPresentaciones= p.id_presentacion
JOIN medidas me ON me.id_medidas = p.id_medidas
JOIN precios pr ON pr.id_producto = p.id_productos
ORDER BY df.id_detalle_faltantes;
END IF ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarJoinProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarJoinProductos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarJoinProductos`(in op int)
BEGIN
if op >0 then
SELECT df.id_detalle_faltantes,df.fecha_registro,df.cantidad,df.estado,m.id_marcas,m.nombre as MARCA,
p.id_productos,p.nombre,p.descripcion
FROM productos p
JOIN detalle_faltantes  df ON df.id_producto=p.id_productos
join marcas m ON m.id_marcas=p.id_marcas
where df.estado = 'NO';
else
SELECT df.id_detalle_faltantes,df.fecha_registro,df.cantidad,df.estado,m.id_marcas,m.nombre AS MARCA,
p.id_productos,p.nombre,p.descripcion
FROM productos p
JOIN detalle_faltantes  df ON df.id_producto=p.id_productos
join marcas m ON m.id_marcas=p.id_marcas;
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarJoinProductosFaltantes` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarJoinProductosFaltantes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarJoinProductosFaltantes`(in op int)
BEGIN
if op >0 then
SELECT df.id_detalle_faltantes,df.fecha_registro,df.cantidad,df.estado,m.id_marcas,m.nombre as MARCA,
p.id_productos,p.nombre,p.descripcion
FROM productos p
JOIN detalle_faltantes  df ON df.id_producto=p.id_productos
join marcas m ON m.id_marcas=p.id_marcas
where df.estado = 'NO'AND pr.estado='A';
else
SELECT df.id_detalle_faltantes,df.fecha_registro,df.cantidad,df.estado,m.id_marcas,m.nombre AS MARCA,
p.id_productos,p.nombre,p.descripcion
FROM productos p
JOIN detalle_faltantes  df ON df.id_producto=p.id_productos
join marcas m ON m.id_marcas=p.id_marcas;
end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarLaboratorio` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarLaboratorio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarLaboratorio`()
BEGIN
select * from laboratorio order by Nombre;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarPoductosCompras` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarPoductosCompras` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarPoductosCompras`(IN op INT)
BEGIN
    IF op=1 THEN
    
SELECT p.`id_productos`,p.`codigo_barras`,p.`nombre`,p.`descripcion`,p.`fecha_registro`,p.`peso`,p.`id_tipo`,
t.`nombre`AS tipo,p.`id_medidas`,m.`nombre_medida` AS medida,p.`id_presentacion`,pr.`nombre`AS presentacion,
p.`id_categoria`,ca.`nombre`AS categoria ,
p.`id_marcas`,ma.`nombre` AS marca, p.id_usuario, p.iva , p.cantidad_minima,p.`receta`,p.`unidades`
FROM `productos` p
JOIN `tipo` t ON t.`id_tipo`= p.`id_tipo` 
JOIN `medidas` m ON m.`id_medidas`= p.`id_medidas`
JOIN `categoria` ca ON ca.`id_categoria`= p.`id_categoria`
JOIN `presentaciones` pr ON pr.`idPresentaciones`= p.`id_presentacion`
JOIN `marcas` ma ON ma.`id_marcas`= p.`id_marcas`
WHERE p.`estado`='A';

      END IF;
     IF op=2 THEN
     
SELECT p.`id_productos`,p.`codigo_barras`,p.`nombre`,p.`descripcion`,p.`fecha_registro`,p.`peso`,p.`id_tipo`,
t.`nombre`AS tipo,p.`id_medidas`,m.`nombre_medida` AS medida,p.`id_presentacion`,pr.`nombre`AS presentacion,
p.`id_categoria`,ca.`nombre`AS categoria ,
p.`id_marcas`,ma.`nombre` AS marca, p.id_usuario, p.iva , p.cantidad_minima,p.`receta`,p.`unidades`
FROM `productos` p
JOIN `tipo` t ON t.`id_tipo`= p.`id_tipo` 
JOIN `medidas` m ON m.`id_medidas`= p.`id_medidas`
JOIN `categoria` ca ON ca.`id_categoria`= p.`id_categoria`
JOIN `presentaciones` pr ON pr.`idPresentaciones`= p.`id_presentacion`
JOIN `marcas` ma ON ma.`id_marcas`= p.`id_marcas`
WHERE p.`estado`='I';
      
      END IF;
      if op=3 then 
      
SELECT p.`id_productos`,p.`nombre`,p.`descripcion`,p.`fecha_registro`,p.`peso`,p.`id_tipo`,
t.`nombre`AS tipo,p.`id_medidas`,m.`nombre_medida` AS medida,
p.`id_presentacion`,pre.`nombre`AS presentacion,
p.`id_categoria`,ca.`nombre`AS categoria   ,p.`id_marcas`,ma.`nombre` AS marca, p.id_usuario,
 p.iva ,pr.`precio_compra`, p.cantidad_minima,s.`cantidad`,s.`id_stock`
FROM `productos` p
JOIN `tipo` t ON t.`id_tipo`= p.`id_tipo` 
JOIN `medidas` m ON m.`id_medidas`= p.`id_medidas`
JOIN `categoria` ca ON ca.`id_categoria`= p.`id_categoria`
JOIN `presentaciones` pre ON pre.`idPresentaciones`= p.`id_presentacion`
JOIN `marcas` ma ON ma.`id_marcas`= p.`id_marcas`
JOIN `precios` pr ON  pr.`id_producto`=p.`id_productos`
JOIN `stock` s ON s.`id_precio`= pr.`id_precio`
WHERE p.`estado`='A'
ORDER BY p.`id_productos`;
      
      end if;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarPrecioNotaPedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarPrecioNotaPedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarPrecioNotaPedido`(in op int,in id_producto1 bigint)
BEGIN
    select pre.id_precio,p.nombre,p.descripcion,pre.id_producto,pre.precio_compra,pre.estado as estado_precio
    ,p.id_productos,p.fecha_registro,p.peso
    ,p.id_tipo,p.id_medidas,p.id_presentacion,p.id_marcas,p.estado as estado_producto,p.iva
    ,pre.fecha_registro as fecha_RegistroPrecio
    from precios pre
    inner join productos p on p.id_productos = pre.id_producto
    where id_producto = id_producto1 and pre.estado = 'A';
    END */$$
DELIMITER ;

/* Procedure structure for procedure `listarProductosStock` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarProductosStock` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProductosStock`(in op bigint)
BEGIN
    if(op=1)then
	SELECT DISTINCT(pro.`id_productos`),pro.`nombre`,pro.`descripcion`,s.`id_precio`,s.`id_stock`,s.`cantidad` FROM  `precios` pre 
	JOIN `productos` pro ON pro.`id_productos`= pre.`id_producto`
	JOIN `stock` s  ON s.`id_precio`= pre.`id_precio`
	WHERE pre.`estado` ='A' AND pro.`estado`='A'
	ORDER BY pro.`id_productos` ASC;
    end if;
    
    if(op=2)then
    SELECT DISTINCT(pro.`id_productos`),pro.`nombre`,pro.`descripcion`,s.`id_precio`,
    s.`id_stock`,tp.`nombre` AS tipo ,mp.`nombre_medida`AS medida,pr.`nombre`AS presentacion ,
    mrp.`nombre`AS marca,s.`cantidad` FROM  `precios` pre 
	JOIN `productos` pro ON pro.`id_productos`= pre.`id_producto`
	JOIN `stock` s  ON s.`id_precio`= pre.`id_precio`
	JOIN `tipo` tp ON tp.`id_tipo`= pro.`id_tipo`
	JOIN `medidas` mp ON mp.`id_medidas`= pro.`id_medidas`
	JOIN `presentaciones` pr ON pr.`idPresentaciones` = pro.`id_presentacion`
	JOIN `marcas` mrp ON mrp.`id_marcas`=pro.`id_marcas`
	WHERE pre.`estado` ='A' AND pro.`estado`='A'
	ORDER BY pro.`id_productos` ASC;
     end if;
     
     IF(op=3)THEN
	SELECT pro.`id_productos`,pro.`nombre`,pro.`descripcion`,pre.`id_precio`,
    pre.`precio_compra`,pre.`precio_venta`,s.`id_stock`,tp.`nombre` AS tipo ,
    mp.`nombre_medida`AS medida,pr.`nombre`AS presentacion ,
    mrp.`nombre`AS marca,s.`cantidad` FROM  `precios` pre 
	JOIN `productos` pro ON pro.`id_productos`= pre.`id_producto`
	JOIN `stock` s  ON s.`id_precio`= pre.`id_precio`
	JOIN `tipo` tp ON tp.`id_tipo`= pro.`id_tipo`
	JOIN `medidas` mp ON mp.`id_medidas`= pro.`id_medidas`
	JOIN `presentaciones` pr ON pr.`idPresentaciones` = pro.`id_presentacion`
	JOIN `marcas` mrp ON mrp.`id_marcas`=pro.`id_marcas`
	WHERE pre.`estado` ='A' AND pro.`estado`='A' AND s.`cantidad`>0
	ORDER BY pro.`nombre` ASC;
     END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarProductosVentas` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarProductosVentas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarProductosVentas`(
IN op INT
)
BEGIN
    IF op=1 THEN
		SELECT  precios.id_precio AS 'Control', productos.id_productos AS 'Codigo', productos.nombre AS 'Nombre del Producto', productos.descripcion AS 'Descripcion', tipo.nombre AS 'Tipo', 
        medidas.nombre_medida AS 'Medida',   categoria.nombre AS 'Categoria', presentaciones.nombre AS 'Presentaciones',
        marcas.nombre AS 'Marca', stock.cantidad AS 'Stock', 
        productos.iva AS 'Iva', precios.precio_venta  AS 'Precio de Venta', precios.`precio_compra` AS 'Precio de Compra'
        FROM precios 
        INNER JOIN productos ON  precios.id_producto = productos.id_productos 
        INNER JOIN categoria ON categoria.id_categoria = productos.id_categoria 
        INNER JOIN tipo ON tipo.id_tipo = productos.id_tipo 
        INNER JOIN medidas ON medidas.id_medidas = productos.id_medidas
        INNER JOIN presentaciones ON presentaciones.idPresentaciones = productos.id_presentacion
        INNER JOIN marcas ON marcas.id_marcas = productos.id_marcas
        INNER JOIN stock ON stock.id_precio = precios.id_precio
        WHERE precios.estado = 'A'
        ORDER BY `productos`.`nombre`  ASC;
   
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarProveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarProveedor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarProveedor`(IN op BIGINT)
BEGIN
IF (op=1)THEN
SELECT p.`id_proveedor`,p.`id_proveedor_clase`,pc.`clase`,p.`cedula_ruc`,p.`entidad`,p.`representante`,p.`direccion`,p.`fecha_registro`,p.`estado`,
p.`telefono`,p.`correo`,p.`direccionImagen`
FROM proveedor p 
JOIN `proveedor_clase` pc ON pc.`id_proclase`=p.`id_proveedor_clase`
WHERE p.`estado` = 'A';
END IF;
IF (op=2)THEN
SELECT p.`id_proveedor`,p.`id_proveedor_clase`,pc.`clase`,p.`cedula_ruc`,p.`entidad`,p.`representante`,p.`direccion`,p.`fecha_registro`,p.`estado`,
p.`telefono`,p.`correo`,p.`direccionImagen`
FROM proveedor p 
JOIN `proveedor_clase` pc ON pc.`id_proclase`=p.`id_proveedor_clase`
WHERE p.`estado` = 'I';
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarPuntoVenta` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarPuntoVenta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarPuntoVenta`()
BEGIN
	SELECT pv.id_punto_venta, pv.nombre, lg.localidad, pv.direccion,  pv.observacion FROM fc_localidad_guayas lg, fc_punto_venta pv WHERE lg.id_localidad_guayas= pv.id_localidad_guayas;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarRegistroDeNotas` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarRegistroDeNotas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarRegistroDeNotas`(IN op INT)
BEGIN
IF op=1 THEN
SELECT cnp.`id_cabecera_nota_pedidos`,cnp.`id_proveedor`,p.`entidad` AS proveedor,p.`correo`,p.`id_proveedor_clase`,pc.`clase`,
p.`direccion`,p.`cedula_ruc`,p.`representante`,p.`telefono`,cnp.`fecha_creacion`,cnp.`estado`,cnp.`iva`,cnp.`descuento`,cnp.`total`
,cnp.`forma_pago`,cnp.`plazo`
FROM `cabecera_nota_pedidos` cnp
JOIN `proveedor` p ON p.`id_proveedor`= cnp.`id_proveedor`
JOIN `proveedor_clase` pc ON pc.`id_proclase`= p.`id_proveedor_clase`
WHERE cnp.estado= "SI";
END IF;
IF op=2 THEN
SELECT cnp.`id_cabecera_nota_pedidos`,cnp.`id_proveedor`,p.`entidad` AS proveedor,p.`correo`,p.`id_proveedor_clase`,pc.`clase`,
p.`direccion`,p.`cedula_ruc`,p.`representante`,p.`telefono`,cnp.`fecha_creacion`,cnp.`estado`,cnp.`iva`,cnp.`descuento`,cnp.`total`
,cnp.`forma_pago`,cnp.`plazo`
FROM `cabecera_nota_pedidos` cnp
JOIN `proveedor` p ON p.`id_proveedor`= cnp.`id_proveedor`
JOIN `proveedor_clase` pc ON pc.`id_proclase`= p.`id_proveedor_clase`
WHERE cnp.estado= "NO";
END IF;
IF op=3 THEN
SELECT DISTINCT(cnp.id_cabecera_nota_pedidos),cnp.id_proveedor ,p.entidad AS proveedor,p.correo,p.id_proveedor_clase,cp.clase
,p.direccion,p.cedula_ruc,p.representante,p.telefono,cnp.fecha_creacion,cnp.estado,cnp.iva,cnp.descuento,cnp.total,cnp.`plazo`,cnp.`forma_pago`
FROM `detalle_nota_pedidos` dnp
JOIN `cabecera_nota_pedidos` cnp ON cnp.`id_cabecera_nota_pedidos`=dnp.`id_cabecera_nota_pedidos`
JOIN `proveedor` p ON p.`id_proveedor`=cnp.`id_proveedor`
JOIN `proveedor_clase` cp ON cp.`id_proclase`=p.`id_proveedor_clase`
WHERE cnp.estado= "SI"
ORDER BY cnp.`fecha_creacion`;
END IF;
IF op=4 THEN
SELECT cnp.`id_cabecera_nota_pedidos`,cnp.`id_proveedor`,p.`entidad` AS proveedor,p.`correo`,p.`id_proveedor_clase`,pc.`clase`,
p.`direccion`,p.`cedula_ruc`,p.`representante`,p.`telefono`,cnp.`fecha_creacion`,cnp.`estado`,cnp.`iva`,cnp.`descuento`,cnp.`total`
,cnp.`forma_pago`,cnp.`plazo`
FROM `cabecera_nota_pedidos` cnp
JOIN `proveedor` p ON p.`id_proveedor`= cnp.`id_proveedor`
JOIN `proveedor_clase` pc ON pc.`id_proclase`= p.`id_proveedor_clase`
WHERE cnp.estado= "EF";
END IF;
IF op=5 THEN
SELECT cnp.`id_cabecera_nota_pedidos`,cnp.`id_proveedor`,p.`entidad` AS proveedor,p.`correo`,p.`id_proveedor_clase`,pc.`clase`,
p.`direccion`,p.`cedula_ruc`,p.`representante`,p.`telefono`,cnp.`fecha_creacion`,cnp.`estado`,cnp.`iva`,cnp.`descuento`,cnp.`total`
,cnp.`forma_pago`,cnp.`plazo`
FROM `cabecera_nota_pedidos` cnp
JOIN `proveedor` p ON p.`id_proveedor`= cnp.`id_proveedor`
JOIN `proveedor_clase` pc ON pc.`id_proclase`= p.`id_proveedor_clase`
WHERE cnp.estado= "D";
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarRegistroDetalleNotaPedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarRegistroDetalleNotaPedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarRegistroDetalleNotaPedido`(IN op INT,in id text)
BEGIN
  IF op=1 THEN
SELECT dnp.`id_detalle_nota_pedidos`,dnp.`id_precio`,pre.`id_producto`,dnp.`bono`,
pro.`nombre` AS producto,pro.`id_marcas`,m.`nombre` AS marca,pro.`id_tipo`,t.`nombre` AS tipo,
pro.`id_presentacion`,pr.`nombre`AS presentacion,
pro.`id_categoria`,ca.`nombre`AS categoria,
pro.`id_medidas`,me.`nombre_medida` AS medida,
dnp.`id_cabecera_nota_pedidos`,dnp.`cantidad`,dnp.`precio`,dnp.`descuento`,dnp.`iva`,dnp.`total`
FROM `detalle_nota_pedidos` dnp
JOIN `cabecera_nota_pedidos` cnp ON cnp.`id_cabecera_nota_pedidos`= dnp.`id_cabecera_nota_pedidos`
JOIN `precios` pre ON pre.`id_precio` = dnp.`id_precio`
JOIN `productos` pro ON pro.`id_productos`= pre.`id_producto`
JOIN `marcas` m ON m.`id_marcas` = pro.`id_marcas`
JOIN `tipo` t ON t.`id_tipo` = pro.`id_tipo`
JOIN `categoria` ca ON ca.`id_categoria` = pro.`id_categoria`
JOIN `presentaciones` pr ON pr.`idPresentaciones`= pro.`id_presentacion`
JOIN `medidas` me ON me.`id_medidas`= pro.`id_medidas`
WHERE dnp.`id_cabecera_nota_pedidos`= id
ORDER BY dnp.`id_cabecera_nota_pedidos`;
END IF;
IF op=2 THEN
SELECT dnp.`id_detalle_nota_pedidos`,dnp.`id_precio`,pre.`id_producto`,dnp.`bono`,
pro.`nombre` as producto,pro.`id_marcas`,m.`nombre` AS marca,pro.`id_tipo`,t.`nombre` AS tipo,
pro.`id_presentacion`,pr.`nombre`AS presentacion,
pro.`id_categoria`,ca.`nombre`AS categoria,
pro.`id_medidas`,me.`nombre_medida` AS medida,
dnp.`id_cabecera_nota_pedidos`,dnp.`cantidad`,dnp.`precio`,dnp.`descuento`,dnp.`iva`,dnp.`total`
FROM `detalle_nota_pedidos` dnp
JOIN `precios` pre ON pre.`id_precio` = dnp.`id_precio`
JOIN `productos` pro ON pro.`id_productos`= pre.`id_producto`
JOIN `marcas` m ON m.`id_marcas` = pro.`id_marcas`
JOIN `tipo` t ON t.`id_tipo` = pro.`id_tipo`
JOIN `categoria` ca ON ca.`id_categoria` = pro.`id_categoria`
JOIN `presentaciones` pr ON pr.`idPresentaciones`= pro.`id_presentacion`
JOIN `medidas` me ON me.`id_medidas`= pro.`id_medidas`
ORDER BY dnp.`id_cabecera_nota_pedidos`;
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarRegistroDetalleVenta` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarRegistroDetalleVenta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarRegistroDetalleVenta`(
IN idCab BIGINT
)
BEGIN
SELECT `detalle_venta`.`id`, `detalle_venta`.`id_cabecera_venta` AS 'id_cabecera',`detalle_venta`.`id_control`,`productos`.`id_productos` AS 'Codigo' ,`productos`.`nombre` AS 'Detalle', 
`detalle_venta`.`cantidad` AS 'Cantidad',
ROUND (detalle_venta.`precio`,2 )AS 'Precio', 
ROUND ((`detalle_venta`.`cantidad` * `detalle_venta`.`precio`),2)AS 'Subtotal',
ROUND (`detalle_venta`.`descuento`,2) AS 'Descuento',
ROUND (`detalle_venta`.`iva`,2) AS 'Iva',
ROUND ((( `detalle_venta`.`precio` * `detalle_venta`.`cantidad`) + `detalle_venta`.`iva` - `detalle_venta`.`descuento` ),2) AS 'Total'
FROM detalle_venta INNER JOIN `precios`
ON
`detalle_venta`.`id_control` = `precios`.`id_precio` INNER JOIN `productos`
ON
`productos`.`id_productos` = `precios`.`id_producto`
WHERE `detalle_venta`.`id_cabecera_venta`= idCab;
END */$$
DELIMITER ;

/* Procedure structure for procedure `ListarRegistroVenta` */

/*!50003 DROP PROCEDURE IF EXISTS  `ListarRegistroVenta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `ListarRegistroVenta`(
IN op INT
)
BEGIN
	IF op=1 THEN 
SELECT `cabecera_venta`.`id`,`cabecera_venta`.`num_venta`,`sucursal`.`nombre` AS 'Sucursal',`sucursal`.`ruc`,`sucursal`.`direccion`, `sucursal`.`telefono`,
CONCAT (`clientes`.`Nombre`," ",`clientes`.`Apellido`)AS 'Cliente',
`clientes`.`Cedula` AS 'Cedula_cliente',
CONCAT (`fc_usuario`.`nombres`," ",`fc_usuario`.`apellidos`)AS 'Usuario', 
cabecera_venta.`fecha_creacion` AS 'Fecha',
`cabecera_venta`.`tipo_pago`,
`cabecera_venta`.`tipo_venta`,
ROUND (`cabecera_venta`.`subtotal_con_iva`,2) AS 'Subtotal_con_iva',
ROUND (cabecera_venta.`subtotal_sin_iva`,2)AS 'Subtotal_sin_iva',
ROUND ((`cabecera_venta`.`subtotal_con_iva` + cabecera_venta.`subtotal_sin_iva`),2)  AS 'Subtotal' , 
ROUND (cabecera_venta.`iva_total`,2) AS 'Iva',
ROUND (cabecera_venta.`descuento_total`,2) AS 'Descuento',
ROUND (cabecera_venta.`total`,2)AS 'Total',
ROUND (`cabecera_venta`.`utilidad`,2) AS 'Utilidad',
(`cabecera_venta`.`estado`) AS 'Estado'
FROM `cabecera_venta` INNER JOIN `clientes` 
ON
cabecera_venta.`id_cliente` = `clientes`.`id_Clientes` INNER JOIN `sucursal`
ON
cabecera_venta.`id_sucursal` = `sucursal`.`id_sucursal` INNER JOIN `fc_session`
ON 
`fc_session`.`id_sesion` = `cabecera_venta`.`id_usuario` INNER JOIN `fc_usuario`
ON 
`fc_session`.`id_usuario` = `fc_usuario`.`id_usuario`;
	END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `listarTelefono` */

/*!50003 DROP PROCEDURE IF EXISTS  `listarTelefono` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `listarTelefono`(in cedula1 text)
BEGIN
select * from Telefono where Cedula = cedula1;
END */$$
DELIMITER ;

/* Procedure structure for procedure `llamarIVAactual` */

/*!50003 DROP PROCEDURE IF EXISTS  `llamarIVAactual` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `llamarIVAactual`(OUT valor TEXT)
BEGIN
	SET valor = (SELECT `iva` FROM`iva` WHERE `est`='A');
    END */$$
DELIMITER ;

/* Procedure structure for procedure `modificarProductos` */

/*!50003 DROP PROCEDURE IF EXISTS  `modificarProductos` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarProductos`(in nombre1 VARCHAR(45),IN descripcion1 VARCHAR(80),IN peso1 DOUBLE(7,2),
    IN id_tipo1 BIGINT(20),IN id_medidas1 BIGINT(20), IN id_categoria1 BIGINT(20),IN id_presentacion1 BIGINT(20) ,
    IN id_marcas1 BIGINT(20),IN id_productos1 BIGINT(20),
    IN id_usuario1 BIGINT, IN iva1 VARCHAR(2), IN cantidad_minima1 BIGINT,in receta1 text,in unidade1 bigint, OUT valor TEXT)
BEGIN
    IF (nombre1='' OR descripcion1='' OR peso1='' OR id_tipo1='' OR id_medidas1='' OR id_categoria1='' OR id_presentacion1=''
    OR id_marcas1='' OR id_usuario1='' OR iva1='' OR cantidad_minima1='')THEN
    SET valor = 'campos invalidos';
    ELSE 
	UPDATE productos SET nombre = nombre1,descripcion = descripcion1,peso=peso1 ,id_tipo= id_tipo1,`id_medidas`= id_medidas1,
    `id_categoria`=id_categoria1,`id_presentacion`=id_presentacion1  ,`id_marcas`=id_marcas1,
    `id_usuario`=id_usuario1,`iva`=iva1,`cantidad_minima`=cantidad_minima1 ,`receta`= receta1 ,`unidades` = unidade1
    WHERE id_productos =id_productos1;
    SET valor = 'Producto actualizado';
    END IF;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `mostrar_iva` */

/*!50003 DROP PROCEDURE IF EXISTS  `mostrar_iva` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_iva`()
BEGIN
SELECT * FROM iva WHERE est = 'A';
END */$$
DELIMITER ;

/* Procedure structure for procedure `mostrar_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `mostrar_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mostrar_usuario`()
BEGIN
SELECT `fc_session`.`id_sesion`, `fc_usuario`.`fecha_registro`, `fc_usuario`.`cedula`, `fc_usuario`.`apellidos`, `fc_usuario`.`nombres`, 
`fc_usuario`.`direccion`, `fc_usuario`.`telefono`, `fc_usuario`.`convencional`, `fc_usuario`.`correo`, `fc_rol`.`cargo`, 
`fc_genero`.`genero`, `fc_discapacidad`.`discapacidad`, `fc_porcentaje_discapacidad`.`porcentaje`, `fc_session`.`estado`, `fc_session`.`observacion` 
FROM `fc_usuario` INNER JOIN `fc_session` ON `fc_usuario`.`id_usuario` = `fc_session`.`id_usuario` 
INNER JOIN `fc_rol` ON `fc_rol`.`id_rol` = `fc_session`.`id_rol` 
INNER JOIN `fc_genero` ON `fc_genero`.`id_genero` = `fc_usuario`.`id_genero` 
INNER JOIN `fc_discapacidad` ON `fc_discapacidad`.`id_discapacidad` = `fc_usuario`.`id_discapacidad` 
INNER JOIN `fc_porcentaje_discapacidad` ON `fc_porcentaje_discapacidad`.`id_porcentaje_discapacidad` = `fc_usuario`.`id_porcentaje_discapacidad`;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `nuevo_punto_venta` */

/*!50003 DROP PROCEDURE IF EXISTS  `nuevo_punto_venta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevo_punto_venta`(nombre_localidad1 TEXT,nombre_local1 TEXT,  direccion1 TEXT,dir_ip1 TEXT, OUT salida TEXT)
BEGIN
DECLARE id_localidad1 BIGINT;
DECLARE valor INT;
SELECT COUNT(nombre)INTO valor FROM fc_punto_venta WHERE nombre=nombre_local1;
SELECT id_localidad_guayas INTO id_localidad1 FROM fc_localidad_guayas WHERE localidad = nombre_localidad1;
IF(nombre_localidad1='Elija una opcion...')THEN
SET salida='Porfavor elija una opcion';
ELSEIF(valor = 0)THEN
INSERT INTO fc_punto_venta(id_localidad_guayas,nombre,  direccion, ip_publica,observacion, estado) 
                    VALUES(id_localidad1,    nombre_local1,  direccion1, dir_ip1,  '', 'A');
SET salida='Nuevo punto de venta ingresado';
ELSE SET salida='El punto de venta ya existe';
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `nuevo_usuario` */

/*!50003 DROP PROCEDURE IF EXISTS  `nuevo_usuario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `nuevo_usuario`(IN nombre_punto_venta1 TEXT, IN nombre_rol1 TEXT,IN  cedula1 TEXT,IN nombre1 TEXT,IN apellido1 TEXT,IN telefono1 TEXT,IN correo1 TEXT, IN password1 TEXT,IN password2 TEXT,IN ruta_imagen1 TEXT,IN id_usuario1 BIGINT,IN ip_equipo1 TEXT,IN ip_publica1 TEXT,IN usuario_equipo1 TEXT,IN dir_ip_completa1 TEXT /*,out salida text*/)
BEGIN
DECLARE salida TEXT;
DECLARE id_punto_venta1 BIGINT;
DECLARE fecha_registro1 DATE;
DECLARE id_rol1 BIGINT;
DECLARE valor INT;
DECLARE email INT;
DECLARE id_usuario2 BIGINT;
DECLARE rol_usuario BIGINT;
SELECT NOW() INTO fecha_registro1;
SELECT id_punto_venta INTO id_punto_venta1 FROM fc_punto_vental WHERE nombre=nombre_punto_venta1;
SELECT id_rol INTO id_rol1 FROM fc_rol WHERE nombre=nombre_rol1;
SELECT COUNT(correo) INTO email FROM fc_usuario WHERE correo=correo1;
SELECT COUNT(cedula) INTO valor FROM fc_usuario WHERE cedula=cedula1;
SELECT id_rol INTO rol_usuario FROM fc_usuario WHERE id_usuario=id_usuario1;
IF(rol_usuario != 1)THEN 
SET salida='No puedes ingresar usuarios porque no eres administrador';
ELSEIF(password1 != password2)THEN
SET salida='Contraseña incorrecta';
ELSEIF (valor=0 AND email=0)THEN
INSERT INTO fc_usuario( id_rol, cedula, nombre, apellido,telefono, correo, PASSWORD,ruta_imagen, fecha_registro, id_usuario_registro, estado, ip_equipo, ip_publica, usuario_equipo, dir_ip_completa) VALUES( id_rol1, cedula1, nombre1, apellido1, telefono1, correo1, password1,ruta_imagen1, fecha_registro1, id_usuario1,'A',ip_equipo1, ip_publica1,usuario_equipo1, dir_ip_completa1  );
SELECT MAX(id_usuario)INTO id_usuario2 FROM fc_usuario;
INSERT INTO `fc_usuario_punto_venta`(id_usuario, id_punto_venta) VALUES(id_usuario2, id_punto_venta1);
SET salida='Nuevo usuario ingresado'; 
ELSE 
SET salida='Usuario ya existente';
END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `Tipo_Producto` */

/*!50003 DROP PROCEDURE IF EXISTS  `Tipo_Producto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `Tipo_Producto`()
BEGIN
select tipo.id_tipo, tipo.nombre from moduloprueba.tipo where estado = 'A' order by tipo.id_tipo;
END */$$
DELIMITER ;

/* Procedure structure for procedure `universal_sentences` */

/*!50003 DROP PROCEDURE IF EXISTS  `universal_sentences` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `universal_sentences`(IN consu TEXT)
BEGIN
    SET @query = CONCAT(consu);
    PREPARE statement FROM @query;       -- Preparar query.
    EXECUTE statement;                   -- Ejecutar query.
    DEALLOCATE PREPARE statement;        -- Eliminar query alojado en memoria.
    END */$$
DELIMITER ;

/*Table structure for table `faltantes_previo` */

DROP TABLE IF EXISTS `faltantes_previo`;

/*!50001 DROP VIEW IF EXISTS `faltantes_previo` */;
/*!50001 DROP TABLE IF EXISTS `faltantes_previo` */;

/*!50001 CREATE TABLE  `faltantes_previo`(
 `id_productos` bigint(20) ,
 `marca` text ,
 `nombre` varchar(45) ,
 `descripcion` varchar(80) ,
 `cantidad_minima` bigint(20) ,
 `total` decimal(41,0) 
)*/;

/*View structure for view faltantes_previo */

/*!50001 DROP TABLE IF EXISTS `faltantes_previo` */;
/*!50001 DROP VIEW IF EXISTS `faltantes_previo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `faltantes_previo` AS select `pr`.`id_productos` AS `id_productos`,`mr`.`nombre` AS `marca`,`pr`.`nombre` AS `nombre`,`pr`.`descripcion` AS `descripcion`,`pr`.`cantidad_minima` AS `cantidad_minima`,sum(`s`.`cantidad`) AS `total` from (((`stock` `s` join `precios` `p` on(`s`.`id_precio` = `p`.`id_precio`)) join `productos` `pr` on(`p`.`id_producto` = `pr`.`id_productos`)) join `marcas` `mr` on(`mr`.`id_marcas` = `pr`.`id_marcas`)) group by `pr`.`id_productos`,`mr`.`nombre`,`pr`.`nombre` order by `mr`.`nombre` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
