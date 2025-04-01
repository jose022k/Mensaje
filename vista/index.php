<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookends</title>
    <link rel="stylesheet" href="../css/estilo.css">
</head>
<body>
<header>
        <div class="logo">
            <img src="../imagenes/logo1.svg" alt="Logo" style="width: 200px">
        </div>
        <div class="user-actions">
            <button onclick="location.href='registro.php'">Registro</button>
            <button onclick="location.href='login.php'">Iniciar Sesión</button>
        </div>
    </header>

    <main>
        <section>
            <h2 class="Titulo">LIBROS MÁS ALQUILADOS</h2>
            <div class="libros-container">
              
                <div class="libro">
                    <img src="../imagenes/libro1.jpg" alt="Libro 1">
                    <p>Algebra de Baldor</p>
                </div>
                <div class="libro">
                    <img src="../imagenes/libro2.jpg" alt="Libro 2">
                    <p>Adiós a las armas </p>
                </div>
                <div class="libro">
                    <img src="../imagenes/libro3.jpg" alt="Libro 3">
                    <p>El principito</p>
                </div>
                <div class="libro">
                    <img src="../imagenes/libro4.jpg" alt="Libro 4">
                    <p>El hoobit</p>
                </div>
                <div class="libro">
                    <img src="../imagenes/libro5.jpg" alt="Libro 5">
                    <p>7 hábitos de la gente altamente efectiva</p>
                </div>
                <div class="libro">
                    <img src="../imagenes/libro6.jpg" alt="Libro 6">
                    <p>Harry Potter y la piedra filosofal</p>
                </div>
                <div class="libro">
                    <img src="../imagenes/libro7.jpg" alt="Libro 7">
                    <p>La ilíada</p>
                </div>
                <div class="libro">
                    <img src="../imagenes/libro8.jpg" alt="Libro 8">
                    <p>La  divina comedia</p>
                </div>
                <div class="libro">
                    <img src="../imagenes/libro9.jpg" alt="Libro 9">
                    <p>La peste</p>
                </div>
                <div class="libro">
                    <img src="../imagenes/libro10.jpg" alt="Libro 10">
                    <p>It</p>
                </div>
                <!-- Agregar más libros -->
            </div>
        </section>

        <section>
            <h2 class="Titulo2">CREADORES</h2>
            <div class="creadores-container">
                <!-- Contenido estático de los creadores -->
                <div class="creador">
                    <img src="../imagenes/creador1.jpg" alt="Creador 1">
                    <p>José Palma</p>
                </div>
                <div class="creador">
                    <img src="../imagenes/creador2.png" alt="Creador 2">
                    <p>Víctor Guerrero</p>
                </div>
                <div class="creador">
                    <img src="../imagenes/creador3.jpg" alt="Creador 3">
                    <p>Nilson Noriega</p>
                </div>
                <div class="creador">
                    <img src="../imagenes/creador4.jpg" alt="Creador 4">
                    <p>Samuel Sánchez</p>
                </div>
            </div>
        </section>
    </main>

    <footer>
    <h3 class="titulo3">Sobre Bookends</h3>
        <p>En Bookends podrá alquilar los libros de la biblioteca de su preferencia, puede verificar la cantidad disponible de los mismos, visualizarlos por genero o autor, ver el costo del alquiler y dejar comentario.</p>
    </footer>

    <script src="../js/scripts.js"></script>
</body>
</html>