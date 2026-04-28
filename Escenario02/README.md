# 🌌 Deep-Space Agency: Protocolo de Catalogación Exoplanetaria

Este repositorio contiene la solución técnica para el inventario de la **Deep-Space Agency**, transformando datos estructurados XML en una interfaz web dinámica mediante **XQuery** y **BaseX**.

## 🛠️ Explicación de las Consultas (Lógica de Negocio)

Para cumplir con el pliego de condiciones, se han implementado tres filtros lógicos mediante XQuery, pensados para la toma de decisiones en la misión:

### 1. Zona de Habitabilidad Oro
* **Objetivo:** Identificar planetas candidatos para la vida.
* **Lógica:** Se ha aplicado un filtro de rango sobre el nodo `TemperaturaMedia`. La consulta selecciona exclusivamente aquellos planetas con valores entre **10°C y 35°C**.
* **Resultado:** Solo los planetas con condiciones térmicas estables aparecen en esta sección de la web.

### 2. Ranking de Oxígeno y Proximidad
* **Objetivo:** Priorizar misiones de exploración tripulada.
* **Lógica:** Primero, filtramos los planetas cuya secuencia de `Atmosfera/Componente` contenga el valor **"Oxígeno"**. Segundo, aplicamos una ordenación (`order by`) ascendente basada en `DistanciaAniosLuz`.
* **Resultado:** Un ranking visual de los planetas más cercanos que permitirían la respiración humana.

### 3. Generador de Fichas de Navegación
* **Objetivo:** Automatizar la creación de metadatos técnicos para los pilotos.
* **Lógica:** He utilizado un bucle `for` que recorre todo el inventario. Para cada planeta, el script extrae el `Codigo` como identificador de coordenadas y utiliza la función `count()` para calcular cuántos componentes gaseosos hay en su atmósfera.
* **Resultado:** Una galería completa de tarjetas de datos con la complejidad atmosférica de cada mundo.

---

## 🚀 Instrucciones de Despliegue

1.  **Entorno:** Instalar y abrir **BaseX GUI**.
2.  **Archivos:** Asegurarse de que `exoplanetas.xml` y `exoplanetas.xsd` estén en la misma carpeta que el script.
3.  **Ejecución:** Abrir el archivo `taller2.xq` en BaseX y pulsar el botón **Play** (triángulo verde).
4.  **Salida:** El sistema generará automáticamente un archivo `index.html` en la raíz de la carpeta.

## 📐 Pureza Técnica
* **HTML5:** Uso de etiquetas semánticas (`<main>`, `<section>`, `<article>`) para evitar la "divitis".
* **CSS3:** Maquetación basada en **CSS Grid** y variables nativas, sin librerías externas ni frameworks.
* **Validación:** El sistema requiere que el XML cumpla estrictamente con el esquema XSD proporcionado.

---
**Desarrollado para:** UD06 - Sistemas de Información Dinámicos
**Sede:** Porvenir - Viapol
