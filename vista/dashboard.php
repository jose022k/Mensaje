<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="stylesheet" href="../css/estilo.css">
</head>
<body>
<header>
    <div>
 
    <a href="dashboard.php">
        <img src="../imagenes/logo1.svg" alt="Logo" style="width: 200px">
    </a>
    </header>
    <div id="modal-confirmar" class="modal">
        <div class="modal-content1">
            <span class="close2">&times;</span>
            <p id="modal-message-confirmar">¿Seguro que deseas cerrar sesión?</p>
            <button id="modal-button-si1">Sí</button>
            <button id="modal-button-no1">No</button>
        </div>
    </div>

  
    <button id="cerrarSesionBtn" class="cerrar_sesion">
        <img src="../imagenes/logo_cerrar_sesion.png" alt="Cerrar sesión" class="logout-icon">
        Cerrar sesión
    </button>
    <button id="autoresBtn" class="boton_autores">
        <img src="../imagenes/autores.png" alt="" class="autores_logo">
        Autores 
    </button>
    <button id="generosBtn" class="boton_generos">
        <img src="../imagenes/logo_generos.png" alt="" class="generos_logo">
        Géneros 
    </button>
    <div id="modal_gene" class="modal_generos">
    <div class="modal-content2">
    <span class="close3">&times;</span>
    <div class="boton-container">
        
        <button class="modal-button">Autoayuda</button>
        <button class="modal-button">Ciencia ficción </button>
        <button class="modal-button">Cuento de hadas </button>
        <button class="modal-button">Cuento de horror </button>
        <button class="modal-button">Cuento corto </button>
        <button class="modal-button">Cuento filosófico</button>
        <button class="modal-button">Diario </button>
        <button class="modal-button">Desarrollo personal</button>
        <button class="modal-button">Ensayo filosófico  </button>
        <button class="modal-button">Fantasía</button>
        <button class="modal-button">Ficción sobrenatural </button>
        <button class="modal-button">Literatura de viajes </button>
        <button class="modal-button">Novela </button>
        <button class="modal-button">Novela de aventuras </button>
        <button class="modal-button">Novela corta </button>
        <button class="modal-button">Novela de ficción   </button>
        <button class="modal-button">Novela de misterio </button>
        <button class="modal-button">Novela filosófica </button>
        <button class="modal-button">Novela gótica </button>
        <button class="modal-button">Novela histórica  </button>
        <button class="modal-button">Novela pastoril </button>
        <button class="modal-button">Poesía</button>
        <button class="modal-button">Realismo mágico </button>
        <button class="modal-button">Suspenso </button>
        <button class="modal-button">Texto educativo </button>
        <button class="modal-button">Tragedia </button>
        <button class="modal-button">Filosofía   </button>
    
    </div>
</div>
</div>
    
    <button id="theBookendsBtn" class="cerrar_sesion">
    <img src="../imagenes/logo_the_bookends.png" alt="The Bookend" class="logo_the_bookends">
    The Bookend
</button>

<main>
        <section>

            <div class="contenedor-info">
            <h2 class="centrado">Biblioteca "EL UNIVERSO DEL LIBRO"</h2>
             <p class="centrado2" style="font-style: italic;">Leer te lleva a lugares increíbles</p>
                <p><strong>Ubicación:</strong> Chacao, Caracas.</p>
                <p><strong>Número Telefónico:</strong> 0212-0564512.</p>
                <p><strong>Horario:</strong> De lunes a viernes 9:30 am a 5pm.</p>
                <div class="reputacion">
                <h2>Reputación</h2>
          
                <img src="../imagenes/estrella.png" alt="Estrella" class="estrella">
                <img src="../imagenes/estrella.png" alt="Estrella" class="estrella">
                <img src="../imagenes/estrella.png" alt="Estrella" class="estrella">
                <img src="../imagenes/estrella.png" alt="Estrella" class="estrella">
                <img src="../imagenes/estrella.png" alt="Estrella" class="estrella">
            </div>
        
        </div>

        <div class="imagen-izquierda">
          
            <img src="../imagenes/biblioteca.png" alt="Imagen">
        </div>
            <div class="imagen-derecha">
            <img src="../imagenes/libros.png" alt="Imagen">
            </div>
         
             <button class="boton-libros" onclick="window.location.href='libros_UDL.php'">Libros</button>
        </section>
 <section>
  
<div class="contenedor-imagen-texto">
    <img src="../imagenes/proximamente.png" alt="Imagen">
    <p>Próximamente más bibliotecas</p>
</div>
</div>
<!-- Ventana modal para The Bookend -->
<div id="modal-the-bookends" class="modal" style="display:none;">
    <div class="modal-content-the-bookends">
        <span class="close">&times;</span>
        <h2>The Bookend</h2>
        <div style="max-height: 300px; overflow-y: auto;">
            <table>
                <thead>
                    <tr>
                        <th>Título</th>
                        <th>Costo</th>
                        <th>Cantidad</th>
                        <th>Duración/Días</th>
                        <th>Acciones</th>
                
                    </tr>
                </thead>
                <tbody id="tabla-libros-dashboard">
                </tbody>
            </table>
        </div>
        <div id="total-container">
        </div>
        <div id="tiempoRestanteContainer">
            <p>Tiempo para pagar el alquiler: <span id="reloj">48:00:00  </span></p> 
        </div>
        <p>Total de libros: <span id="cantidadLibros">0</span></p>
    </div>
</div>

        </section>
        </main>
        <footer>
        <h3 class="titulo3" id="tituloConsejo">Consejo:</h3>
        <p id="mensajeConsejo">Recuerde siempre estar al tanto de sus libros alquilados y del tiempo que le queda para ir a retirarlos.</p>
    </footer>

        <script src="../js/scripts.js"></script> 
        <script src="../js/dashboard.js"></script> 
        
    
     
</body>

</html>