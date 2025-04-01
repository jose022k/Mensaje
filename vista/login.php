<?php include "header_login_registro_admin.php" ?>

    <main>
        <div class="registro-container">
            <div class="login-imagen">
                <img src="../imagenes/logo_login.png" alt="Logo del login" class="login-logo">
                <h2 class="titulo_login">Iniciar Sesión</h2>
            </div>
            <form class="registro-form" action="../controlador/login_controlador.php" method="POST" onsubmit="return validarInicioSesion()">
                <label for="usuario">Usuario:</label>
                <input type="text" id="usuario" name="usuario" class="input-field" required>

                <label for="contrasena">Contraseña:</label>
                <input type="password" id="contrasena" name="contrasena" class="input-field" required>

                <button type="submit" class="registro-button">Acceder</button>
            </form>
        </div>
    </main>
    

    <div id="modal-error" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p id="modal-message-error">Usuario o contraseña incorrectos</p>
            <button id="modal-button-error">Aceptar</button>
        </div>
    </div>

<div id="modal-success" class="modal" style="display:none;">
    <div class="modal-content">
        <span class="close">&times;</span>
        <p id="modal-message-success">Inicio de sesión exitoso</p>
    </div>
</div>

    <script src="../js/scripts.js"></script>
</body>
</html>
