<?php include "header_login_registro_admin.php" ?>

    <main>
        <div class="registro-container">
            <div class="registro-imagen">
                <img src="../imagenes/logo_registro.png" alt="Logo del registro">
                <h2 class="titulo_registro">Registro</h2>
            </div>

            <?php
            if (isset($_GET['success']) && $_GET['success'] == '1') {
                echo '<div class="registro-success">
                        <p>¡Registro exitoso!</p>
                        <button onclick="window.location.href=\'../vista/login.php\'">Aceptar</button>
                      </div>';
            } elseif (isset($_GET['error']) && $_GET['error'] == '1') {
                echo '<div class="registro-failure">
                        <p>Hubo un error al registrar. Por favor, inténtalo de nuevo.</p>
                      </div>';
            }
            ?>

            <form class="registro-form" action="../controlador/registro_controlador.php" method="POST" onsubmit="return validarRegistro()">
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" class="input-field" required>

                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" class="input-field" required>

                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" class="input-field" required>

                <label for="usuario">Usuario:</label>
                <input type="text" id="usuario" name="usuario" class="input-field" required>

                <label for="contraseña">Contraseña:</label>
                <input type="password" id="contraseña" name="contraseña" class="input-field" required>

                <button type="submit" class="registro-button">Registrarse</button>
            </form>
        </div>
    </main>
    <script src="../js/scripts.js"></script>
</body>
</html>
