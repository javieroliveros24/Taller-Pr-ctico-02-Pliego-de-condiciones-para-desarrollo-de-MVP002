# Memoria Técnica: Implementación y Personalización de ERP Odoo 17

## Introducción
Este documento detalla el trabajo realizado durante el laboratorio práctico de Odoo. El objetivo principal ha sido desplegar un entorno ERP funcional utilizando contenedores, personalizar la salida de documentos legales mediante programación QWeb (XML) y gestionar la exportación de datos para el departamento de marketing.

---

## 1. Despliegue del Sistema con Docker
Para garantizar un entorno aislado y profesional, se ha utilizado **Docker Desktop**. Se levantaron dos contenedores principales: uno para la aplicación **Odoo 17** y otro para la base de datos **PostgreSQL**.

<p align="center">
  <img src="odoo_trabajo/Captura de pantalla 2026-05-05 093319.png" alt="Contenedores Docker" width="850">
  <br><em>Panel de control de Docker donde se observa el correcto funcionamiento de la infraestructura.</em>
</p>

---

## 2. Personalización Técnica de Informes (Fase XML)
Uno de los requisitos más críticos del proyecto fue la modificación del informe de ventas (`report_saleorder_document`). La empresa requería la inclusión de una cláusula legal vinculante y avisos de protección de datos (RGPD) resaltados en color rojo.

### Localización de la Arquitectura
El primer paso consistió en entrar en el **Modo Desarrollador** de Odoo y localizar la vista técnica dentro del menú de ajustes.

<p align="center">
  <img src="odoo_trabajo/image_fa7238.png" alt="Editor XML" width="850">
  <br><em>Acceso a la arquitectura QWeb. Aquí es donde se define la estructura lógica del PDF.</em>
</p>

### Superación de Errores Críticos
Durante el proceso de edición, surgieron varios errores de validación. Estos momentos fueron clave para entender cómo Odoo valida el código en tiempo real:
* **Errores de XPath:** Conflictos al intentar heredar vistas padre que no coincidían con la estructura modificada.
* **Errores de Declaración:** Fallos al mantener etiquetas XML fuera de la primera línea de ejecución.

<p align="center">
  <img src="odoo_trabajo/image_fa6776.png" alt="Error de Validación" width="600">
  <br><em>Uno de los errores enfrentados durante la limpieza del código para evitar duplicidades en la declaración XML.</em>
</p>

---

## 3. Validación de Resultados: El Presupuesto Final
Tras depurar el código, se procedió a la generación del presupuesto `S00025`. En esta fase, se verificó que tanto los importes como los productos añadidos se reflejaran correctamente junto con el nuevo bloque legal personalizado.

<p align="center">
  <img src="odoo_trabajo/ChatGPT Image 7 may 2026, 09_20_26.png" alt="Resultado Final PDF" width="750">
  <br><em>Vista del presupuesto final. Se puede observar el texto legal en rojo integrado perfectamente en el diseño.</em>
</p>

---

## 4. Exportación y Tratamiento de Datos (Marketing)
La fase final consistió en extraer información de los clientes para su uso en campañas externas. Se configuró una exportación en formato **CSV compatible con importación**, seleccionando campos específicos como nombre, email y el nombre del país del cliente.

### Verificación en Visual Studio Code
Para asegurar que los datos no sufrieran corrupción de caracteres (especialmente con tildes o eñes), se abrió el archivo resultante en **VS Code**, confirmando la codificación **UTF-8**.

<p align="center">
  <img src="odoo_trabajo/Captura de pantalla 2026-05-05 094110.png" alt="Verificación CSV" width="850">
  <br><em>Inspección del archivo CSV. La barra inferior de VS Code confirma el formato UTF-8 requerido.</em>
</p>

---

## Conclusión
El laboratorio ha permitido entender el flujo completo de un ERP, desde la infraestructura de servidores hasta la personalización de bajo nivel. La resolución de los errores XML ha sido fundamental para comprender la rigidez y potencia del motor de informes de Odoo.

