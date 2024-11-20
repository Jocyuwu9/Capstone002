CREATE TABLE `admin` (
  `id` interger PRIMARY KEY,
  `nombre` varchar(255),
  `contrasena` varchar(255),
  `soporte` varchar(255)
);

CREATE TABLE `Vendedor` (
  `vend_id` integer PRIMARY KEY,
  `vend_nom` varchar(255),
  `correo` varchar2,
  `telefono` varchar(255),
  `contrasena` varchar(255),
  `link_insta` link,
  `link_face` link
);

CREATE TABLE `Comprador` (
  `Comprador_id` integer PRIMARY KEY,
  `usuario` varchar(255),
  `correo` varchar(255)
);

CREATE TABLE `posts` (
  `id_post` integer PRIMARY KEY,
  `titulo` varchar(255),
  `descipcion` text,
  `vend_id` integer,
  `id_prod` integer,
  `Categoria` varchar(255),
  `status` varchar(255),
  `hora_publi` timestamp,
  `imagen` image
);

CREATE TABLE `producto` (
  `id_prod` interger PRIMARY KEY,
  `nombre` varchar(255),
  `categoria` varchar(255),
  `stock` interger,
  `vend_id` interger,
  `imagen` image
);

CREATE TABLE `chatbox` (
  `id_chat` integer PRIMARY KEY,
  `vend_id` interger,
  `Comprador_id` integer,
  `cuadro_text_Comprador` varchar2,
  `cuadro_text_Vendedor` varchar2
);

CREATE TABLE `Consulta_Stock` (
  `id_list` interger,
  `lista_seleccion` varchar(255)
);

ALTER TABLE `posts` ADD FOREIGN KEY (`vend_id`) REFERENCES `Vendedor` (`vend_id`);

ALTER TABLE `posts` ADD FOREIGN KEY (`id_prod`) REFERENCES `producto` (`id_prod`);

ALTER TABLE `chatbox` ADD FOREIGN KEY (`vend_id`) REFERENCES `Vendedor` (`vend_id`);

ALTER TABLE `chatbox` ADD FOREIGN KEY (`Comprador_id`) REFERENCES `Comprador` (`Comprador_id`);

ALTER TABLE `Consulta_Stock` ADD FOREIGN KEY (`lista_seleccion`) REFERENCES `chatbox` (`cuadro_text_Comprador`);

ALTER TABLE `Comprador` ADD FOREIGN KEY (`Comprador_id`) REFERENCES `admin` (`soporte`);

ALTER TABLE `Vendedor` ADD FOREIGN KEY (`vend_id`) REFERENCES `admin` (`soporte`);

ALTER TABLE `producto` ADD FOREIGN KEY (`stock`) REFERENCES `Consulta_Stock` (`lista_seleccion`);
