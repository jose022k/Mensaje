

<?php
  $generoSeleccionado = isset($_GET['genero']) ? $_GET['genero'] : '';

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Libros - UDL</title>
    <link rel="stylesheet" href="../css/estilo.css">
    <link rel="stylesheet" href="../css/estilo2.css">
    
</head>
<body style="background-color: #FEDD59;">
    <header>
        <div class="logo">
            <a href="dashboard.php">
                <img src="../imagenes/logo1.svg" alt="Logo" style="width: 200px">
            </a>
        </div>
    </header>
    <main>
        <div class="titulo_biblioteca1">
        <button id="apartarBtn">Apartar</button>
            <h1>Biblioteca EL UNIVERSO DEL LIBRO</h1>
        </div>
        <form action="#" method="GET" class="buscador">
        <input type="text" name="buscar" placeholder="Buscar libros...">
            <button type="submit">Buscar</button>
        </form>
        
        <?php
        
        $biblioteca = [
            "Autoayuda" => [
                ["El poder del ahora", "El poder del ahora.jpg"],
                ["La culpa es de la vaca", "La culpa es de la vaca.jpg"],
                ["La culpa es de la vaca 2", "La culpa es de la vaca 2.jpg"],
                ["Los cuatro acuerdos", "Los cuatro acuerdos.jpg"]
            ],
            "Ciencia ficción" => [
                ["El marciano", "El marciano.jpg"],
                ["El cuento de la criada", "El cuento de la criada.jpg"],
                ["Guerra mundial Z", "Guerra mundial Z.jpg"],
                ["Dune", "Dune.jpg"],
                ["Los juegos del hambre", "Los juegos del hambre.jpg"],
                ["Los juegos del hambre - en llamas", "Los juegos del hambre - en llamas.jpg"],
                ["Los juegos del hambre - Sinsajo", "Los juegos del hambre - Sinsajo.jpg"],
                ["Los juegos del hambre - balada pajaros cantores y serpiertes", "Los juegos del hambre - balada pajaros cantores y serpiertes.jpg"]
            ],
            "Cuento corto" => [
                ["Cuento de navidad", "Cuento de navidad.jpg"]
            ],
            "Cuento de hadas" => [
                ["Cenicienta", "Cenicienta.jpg"],
                ["Blancanieves y los siete enaninos", "Blancanieves y los siete enaninos.jpg"],
                ["La bella y la bestia", "La bella y la bestia.jpg"],
                ["La sirenita", "La sirenita.jpg"],
                ["El príncipe feliz", "El Príncipe Feliz.jpg"]
            ],
            "Cuento de horror" => [
                ["La caída de la casa Usher", "La caída de la casa Usher.jpg"],
                ["El corazón delator", "El corazón delator.jpg"],
                ["La casa del juez", "La casa del juez.png"]
            ],
            "Cuento filosófico" => [
                ["El jardín de los cerezos", "El jardín de los cerezos.jpg"],
                ["La ética del don", "La ética del don.jpg"],
                ["La loteria", "La loteria.jpg"],
                ["El principito", "El principito.jpg"]
            ],
            "Desarrollo personal" => [
                ["El arte de amar", "El arte de amar.jpg"],
                ["El monje que vendió su ferrari", "El monje que vendió su ferrari.jpg"],
                ["Hábitos atómicos", "Hábitos atómicos.jpg"],
                ["Los siete hábitos de la gente altamente efectiva", "Los siete hábitos de la gente altamente efectiva.jpg"]
            ],
            "Diario" => [
                ["Diario de Ana Frank", "Diario de Ana Frank.jpg"],
                ["Diarios", "Diarios.jpg"],
                ["Diario de Virginia Woolf", "Diario de Virginia Woolf.jpg"]
            ],
            "Ensayo filosófico" => [
                ["El mito de Sísifo", "El mito de Sísifo.jpg"],
                ["Critica de la razon pura", "Critica de la razon pura.jpg"],
                ["Así habló Zaratustra", "Así habló Zaratustra.jpg"],
                ["Discurso sobre el método", "Discurso sobre el método.jpg"]
                ],
                "Fantasía" => [
                ["Harry Potter y la piedra filosofal", "Harry Potter y la piedra filosofal.jpg"],
                ["Harry Potter y la cámara secreta", "Harry Potter y la cámara secreta.jpg"],
                ["Harry Potter y el prisionero de Azkaban", "Harry Potter y el prisionero de Azkaban.jpg"],
                ["Harry Potter y el cáliz de fuego", "Harry Potter y el cáliz de fuego.jpg"],
                ["Harry Potter y la orden del fénix", "Harry Potter y la orden del fénix.jpg"],
                ["El hobbit", "El hobbit.jpg"],
                ["La comunidad del anillo", "La comunidad del anillo.jpg"],
                ["Las dos torres", "Las dos torres.jpg"],
                ["El retorno del rey", "El retorno del rey.jpg"],
                ["Juego de tronos", "Juego de tronos.jpg"],
                ["Choque de reyes", "Choque de reyes.jpg"],
                ["Tormenta de espadas", "Tormenta de espadas.jpg"]
                ],
                "Ficción sobrenatural" => [
                ["It", "It.jpg"],
                ["El resplandor", "El resplandor.jpg"],
                ["Carrie", "Carrie.jpg"]
                ],
                "Filosofía" => [
                ["Las preguntas de la vida", "Las preguntas de la vida.jpg"],
                ["Meditaciones", "Meditaciones.jpg"],
                ["El banquete", "El banquete.jpg"],
                ["La república", "La república.png"]
                ],
                "Literatura de viajes" => [
                ["Tierra de hombres", "Tierra de hombres.jpg"],
                ["En el camino", "En el camino.jpg"],
                ["Viajes con Charlie", "Viajes con Charlie.jpg"],
                ["Comer, rezar, amar", "Comer, rezar, amar.jpg"],
                ["El peor viaje del mundo", "El peor viaje del mundo.jpg"]
                ],
                "Novela" => [
                ["Crónica de una muerte anunciada", "Crónica de una muerte anunciada.jpg"],
                ["El amor en los tiempos del cólera", "El amor en los tiempos del cólera.jpg"],
                ["Vuelo nocturno", "Vuelo nocturno.jpg"],
                ["El alquimista", "El alquimista.jpg"],
                ["Once minutos", "Once minutos.jpg"],
                ["El peregrino", "El peregrino.jpg"],
                ["El viejo y el mar", "El viejo y el mar.jpg"],
                ["Por quién doblan las campanas", "Por quién doblan las campanas.jpg"],
                ["Adiós a las armas", "Adiós a las armas.jpg"],
                ["Moby Dick", "Moby Dick.jpg"]
                ],
                "Novela corta" => [
                ["La gitanilla", "La gitanilla.jpg"],
                ["La metamorfosis", "La metamorfosis.jpg"],
                ["El extraño caso del Dr. Jekyll y Mr. Hyde", "El extraño caso del Dr. Jekyll y Mr. Hyde.jpg"],
                ["Hombres sin mujeres", "Hombres sin mujeres.jpg"]
                ],
                "Novela de aventuras" => [
                ["Don quijote de la mancha", "Don quijote de la mancha.jpg"],
                ["La isla del tesoro", "La isla del tesoro.jpg"],
                ["Robinson Crusoe", "Robinson Crusoe.jpg"],
                ["Los viajes de Gulliver", "Los viajes de Gulliver.jpg"],
                ["Veinte mil leguas de viaje submarino", "Veinte mil leguas de viaje submarino.jpg"],
                ["Las aventuras de Tom Sawyer", "Las aventuras de Tom Sawyer.jpg"]
                ],
                "Novela de ficción" => [
                ["Sentido y sensibilidad", "Sentido y sensibilidad.jpg"],
                ["Persuasión", "Persuasión.jpg"],
                ["Orgullo y prejuicio", "Orgullo y prejuicio.jpg"],
                ["Grandes esperanzas", "Grandes esperanzas.jpg"],
                ["Oliver Twist", "Oliver Twist.jpg"],
                ["Tiempos dificiles", "Tiempos dificiles.jpg"]
                ],
                "Novela de misterio" => [
                ["Asesinato en el Orient Express", "Asesinato en el Orient Express.jpg"],
                ["Muerte en el nilo", "Muerte en el nilo.jpg"],
                ["El asesinato de Roger Ackroyd", "El asesinato de Roger Ackroyd.jpg"]
                ],
                "Novela filosófica" => [
                ["El extranjero", "El extranjero.jpg"],
                ["La peste", "La peste.jpg"],
                ["El retrato de Dorian Gray", "El retrato de Dorian Gray.jpg"]
                ],
                "Novela gótica" => [
                ["Nuestra señora de parís", "Nuestra señora de parís.jpg"],
                ["Drácula", "Drácula.jpg"],
                ["La maldición de Hill House", "La maldición de Hill House.jpg"],
                ["El castillo de Otranto", "El castillo de Otranto.jpg"],
                ["El monje", "El monje.jpg"],
                ["Frankenstein", "Frankenstein.jpg"],
                ["Rebecca", "Rebecca.jpg"]
                ],
                "Novela histórica" => [
                ["Los pilares de la tierra", "Los pilares de la tierra.jpg"],
                ["La caída de los gigantes", "La caída de los gigantes.jpg"],
                ["La armadura de la luz", "La armadura de la luz.jpg"],
                ["Los miserables", "Los miserables.jpg"]
                ],
                "Novela pastoril" => [
                ["La Galatea", "La Galatea.jpg"],
                ["Los siete libros de la Diana", "Los siete libros de la Diana.jpg"],
                ["Diana enamorada", "Diana enamorada.jpg"],
                ["Arcadia", "Arcadia.jpg"]
                ],
                "Poesía" => [
                ["Divina comedia", "Divina comedia.jpg"],
                ["El cuervo", "El cuervo.jpg"],
                ["La Ilíáda", "La Ilíáda.jpg"],
                ["Odisea", "Odisea.jpg"]
                ],
                "Realismo mágico" => [
                ["Cien años de soledad", "Cien años de soledad.jpg"],
                ["La casa de los espíritus", "La casa de los espíritus.jpg"],
                ["Como agua para chocolate", "Como agua para chocolate.jpg"]
                ],
                "Suspenso" => [
                ["La chica del tren", "La chica del tren.jpg"],
                ["Perdida", "Perdida.jpg"],
                ["La isla siniestra", "La isla siniestra.jpg"]
                ],
                "Texto educativo" => [
                ["Química orgánica", "Química orgánica.jpg"],
                ["Álgebra", "Álgebra.jpg"],
                ["Calculo de una variable", "Calculo de una variable.jpg"],
                ["Diccionario básico lengua española", "Diccionario básico lengua española.jpg"],
                ["Diccionario español-francés/francés-español", "Diccionario español-francés.francés-español.jpg"],
                ["Diccionario español-ingles", "Diccionario español-ingles.jpg"],
                ["Como enseñar física cuántica a tu perro", "Como enseñar física cuántica a tu perro.jpg"],
                ["Sapiens", "Sapiens.jpg"]
                ],
                "Tragedia" => [
                ["Hamlet", "Hamlet.jpg"],
                ["Romeo y Julieta", "Romeo y Julieta.jpg"],
                ["Julio César", "Julio César.jpg"]
                ]


        ];

        $terminoBusqueda = isset($_GET['buscar']) ? $_GET['buscar'] : '';

        // Mostrar secciones solo si no se realiza una búsqueda
        if (empty($terminoBusqueda)) {
            foreach ($biblioteca as $seccion => $libros) {
                echo "<section id=\"$seccion\">";
                echo "<h2 class=\"Titulo\">$seccion</h2>";
                echo "<div class=\"libros-container1\">";
                foreach ($libros as $libro) {
                    $titulo = $libro[0];
                    $imagen = $libro[1];
                    // Mostrar solo el nombre del libro junto con su imagen
                    echo "<div class=\"libro1\" data-title=\"$titulo\">";
                    echo "<img src=\"../imagenes/$imagen\" alt=\"$titulo\">";
                    echo "<p>$titulo</p>";
                    echo "</div>";
                }
                echo "</div>";
                echo "</section>";
            }
        } else {
            // Mostrar solo resultados de búsqueda
            echo "<div class=\"libros-container1\">";
            foreach ($biblioteca as $seccion => $libros) {
                foreach ($libros as $libro) {
                    $titulo = $libro[0];
                    $imagen = $libro[1];
                    // Filtrar los libros según el término de búsqueda
                    if (stripos($titulo, $terminoBusqueda) !== false) {
                        // Mostrar solo el nombre del libro junto con su imagen
                        echo "<div class=\"libro1\" data-title=\"$titulo\">";
                        echo "<img src=\"../imagenes/$imagen\" alt=\"$titulo\">";
                        echo "<p>$titulo</p>";
                        echo "</div>";
                    }
                }
            }
            echo "</div>";
        }
        ?>
    </main>
   
    <div id="modal_alquiler" class="modal6" style="display:none;">
        <div class="modal-content-alquiler">
            <span class="close">&times;</span>
            <h2>Información</h2>
            <div style="max-height: 300px; overflow-y: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Costo</th>
                            <th>Cantidad</th>
                            <th>Duración/Días</th>
                        </tr>
                    </thead>
                    <tbody id="tabla-libros">
                    </tbody>
                </table>
            </div>
            <div id="total-container">
                <p>Total de libros: <span id="total-libros">0</span></p>
                <p>Costo total: <span id="total-costo">0.0 Bs</span></p>
                <button id="aceptarBtn">Aceptar</button>
            </div>
        </div>
    </div>




    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const genero = "<?php echo $generoSeleccionado; ?>";
            if (genero) {
                const section = document.getElementById(genero);
                if (section) {
                    section.scrollIntoView();
                }
            }
        });
    </script>
    <script src="../js/alquiler.js"></script>
</body>
</html>