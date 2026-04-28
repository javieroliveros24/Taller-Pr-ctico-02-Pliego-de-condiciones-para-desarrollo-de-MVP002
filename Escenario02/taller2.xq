(: 1. Declaración obligatoria para manejo de archivos[cite: 51]:)
declare namespace file = "http://expath.org/ns/file";

(: 2. Configuración de rutas automáticas para evitar errores de escritura[cite: 52, 57]:)
declare variable $dir := file:parent(static-base-uri());
declare variable $xml := doc($dir || "exoplanetas.xml");
declare variable $output := $dir || "index.html";

(: 3. Lógica de extracción (Consultas de Negocio) [cite: 34, 40]:)
let $habitables := $xml//Exoplaneta[TemperaturaMedia >= 10 and TemperaturaMedia <= 35]
let $oxigeno := (
  for $p in $xml//Exoplaneta[Atmosfera/Componente = 'Oxígeno']
  order by xs:decimal($p/DistanciaAniosLuz) ascending
  return $p
)

(: 4. Construcción del HTML Semántico y CSS Vanilla[cite: 25, 81, 93]:)
let $html := 
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <title>Deep-Space Agency | Inventario</title>
    <style>
        /* Reset y Variables [cite: 98, 108] */
        * {{ margin: 0; padding: 0; box-sizing: border-box; }}
        :root {{ 
            --bg: #0b0d17; --card: #161b22; 
            --oro: #f1c40f; --azul: #4f9cf9; --texto: #e6edf3; 
        }}
        body {{ background: var(--bg); color: var(--texto); font-family: 'Segoe UI', sans-serif; line-height: 1.6; }}
        header {{ padding: 3rem; text-align: center; border-bottom: 2px solid var(--oro); background: var(--card); }}
        h1 {{ color: var(--oro); letter-spacing: 2px; text-transform: uppercase; }}
        
        main {{ padding: 2rem; max-width: 1200px; margin: auto; }}
        section {{ margin-bottom: 4rem; }}
        h2 {{ margin-bottom: 1.5rem; color: var(--azul); border-left: 5px solid var(--azul); padding-left: 15px; }}
        
        /* Layout con Grid [cite: 106] */
        .galeria {{ display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 25px; }}
        article {{ background: var(--card); padding: 1.5rem; border: 1px solid #30363d; border-radius: 10px; transition: 0.3s; }}
        article:hover {{ border-color: var(--oro); transform: translateY(-5px); }}
        h3 {{ color: var(--oro); margin-bottom: 0.8rem; }}
        ul {{ list-style: none; font-size: 0.9rem; margin-top: 10px; opacity: 0.8; }}
        
        footer {{ text-align: center; padding: 2.5rem; background: #0d1117; border-top: 1px solid #30363d; font-size: 0.85rem; }}
    </style>
</head>
<body>
    <header>
        <h1>DEEP-SPACE AGENCY</h1>
        <p>Protocolo de Catalogación Exoplanetaria</p>
    </header>
    
    <main>
        <section>
            <h2>Zona de Habitabilidad Oro (10°C - 35°C)</h2>
            <div class="galeria">
                {for $p in $habitables return 
                <article>
                    <h3>{$p/NombreComun/text()}</h3>
                    <p><strong>Temperatura:</strong> {$p/TemperaturaMedia/text()}°C</p>
                    <p><strong>Identificador:</strong> {$p/Codigo/text()}</p>
                </article>}
            </div>
        </section>

        <section>
            <h2>Ranking Oxígeno (Más cercanos)</h2>
            <div class="galeria">
                {for $p in $oxigeno return 
                <article>
                    <h3>{$p/NombreComun/text()}</h3>
                    <p><strong>Distancia:</strong> {$p/DistanciaAniosLuz/text()} Años Luz</p>
                    <p><strong>Atmósfera:</strong> {string-join($p/Atmosfera/Componente, ' + ')}</p>
                </article>}
            </div>
        </section>

        <section>
            <h2>Fichas de Navegación del Sistema</h2>
            <div class="galeria">
                {for $p in $xml//Exoplaneta return 
                <article>
                    <h3>NAV-DATA: {$p/NombreComun/text()}</h3>
                    <ul>
                        <li><strong>Referencia:</strong> {$p/Codigo/text()}</li>
                        <li><strong>Gases:</strong> {count($p/Atmosfera/Componente)} detectados</li>
                    </ul>
                </article>}
            </div>
        </section>
    </main>
    
    <footer>
        <p>MVP "Sistemas de Información Dinámicos" | Sede Porvenir - Viapol [cite: 29]</p>
        <p>Pureza Técnica: HTML5 / CSS3 / XQuery [cite: 25]</p>
    </footer>
</body>
</html>

(: 5. Serialización profesional HTML5[cite: 61, 65, 74, 76, 77]:)
return file:write($output, $html, map {
    "method": "html",
    "version": "5.0",
    "indent": "yes",
    "omit-xml-declaration": "yes",
    "encoding": "UTF-8"
})