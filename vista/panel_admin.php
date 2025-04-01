<?php include "header_login_registro_admin.php" ?>
   
<div class="container">
        <aside class="sidebar">
            <div class="sidebar-header">
                <h2>Control del Administrador</h2>
            </div>
        </aside>
        
        <main class="main-content" id="main-content">
            <div class="button-container">
                <button id="usuarios-btn">Usuarios</button>
                <button id="alquileres-btn">Alquileres</button>
                <button id="libros-btn">Libros</button>
            </div>
            <div id="content-area">
                <div id="usuarios-section" class="section hidden">
                    <table id="usuarios-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Apellido</th>
                                <th>Direccion</th>
                                <th>Usuario</th>
                                <th>Contraseña</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Aquí se cargarán los usuarios -->
                        </tbody>
                    </table>
                </div>
                
                <div id="alquileres-section" class="section hidden">
                    <table id="alquileres-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Cantidad Libro</th>
                                <th>Título Libro</th>
                                <th>Duración</th>
                                <th>Costo Libro</th>
                                <th>User ID</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Aquí se cargarán los alquileres -->
                        </tbody>
                    </table>
                </div>
                
                <div id="libros-section" class="section hidden">
                    <table id="libros-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Título</th>
                                <th>Autor</th>
                                <th>Género</th>
                                <th>Costo</th>
                                <th>Año Lanzamiento</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Aquí se cargarán los libros -->
                        </tbody>
                    </table>
                    <form id="agregar-libro-form">
                            <input type="text" id="titulo" placeholder="Título" required>
                             <input type="text" id="autor" placeholder="Autor" required>
                            <input type="text" id="genero" placeholder="Género" required>
                            <input type="text" id="costo" placeholder="Costo" required>
                            <input type="text" id="año_lanzamiento" placeholder="Año de Lanzamiento" required>
                                <button type="button" id="agregar-libro-btn">Agregar Libro</button>
                    </form>


                </div>
            </div> <!-- Cierre de #content-area -->
        </main>
    </div>

    <script src="../js/admin.js"></script>
</body>
</html>
