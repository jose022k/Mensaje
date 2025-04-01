// Función para validar el formulario de registro
function validarRegistro() {
    var nombre = document.getElementById("nombre").value;
    var apellido = document.getElementById("apellido").value;
    var direccion = document.getElementById("direccion").value;
    var usuario = document.getElementById("usuario").value;
    var contraseña = document.getElementById("contraseña").value;

   
    if (nombre === "" || apellido === "" || direccion === "" || usuario === "" || contraseña === "") {
        alert("Por favor completa todos los campos.");
        return false;
    }

    return true;
}


document.addEventListener("DOMContentLoaded", function() {
    var modalError = document.getElementById("modal-error");
    var modalButtonError = document.getElementById("modal-button-error");
    if (modalError) {
        var errorParam = new URLSearchParams(window.location.search).get("error");
        if (errorParam === "1") {
            modalError.style.display = "block";
        }
        modalButtonError.addEventListener("click", function() {
            modalError.style.display = "none";
        });
    }
});


function validarInicioSesion() {
    var usuario = document.getElementById("usuario").value;
    var contrasena = document.getElementById("contrasena").value;

    
    if (usuario === "" || contrasena === "") {
        alert("Por favor ingresa tu usuario y contraseña.");
        return false;
    }

    return true;
}

document.addEventListener("DOMContentLoaded", function() {
    var modalSuccess = document.getElementById("modal-success");
    if (modalSuccess) {
        var successParam = new URLSearchParams(window.location.search).get("success");
        if (successParam === "1") {
            modalSuccess.style.display = "block";
            setTimeout(function() {
                modalSuccess.style.display = "none";
                window.location.href = "dashboard.php";
            }, 3000); // 3000 milisegundos = 3 segundos
        }
    }
});


// Ventana modal para confirmar cierre de sesión
document.addEventListener("DOMContentLoaded", function() {
    var modalConfirmar = document.getElementById("modal-confirmar");
    var modalButtonSi = document.getElementById("modal-button-si1");
    var modalButtonNo = document.getElementById("modal-button-no1");
    var cerrarSesionBtn = document.getElementById("cerrarSesionBtn");

    cerrarSesionBtn.addEventListener("click", function() {
        modalConfirmar.style.display = "block";
    });

   
    modalConfirmar.querySelector(".close2").addEventListener("click", function() {
        modalConfirmar.style.display = "none";
    });

    modalButtonNo.addEventListener("click", function() {
        modalConfirmar.style.display = "none";
    });

    
    modalButtonSi.addEventListener("click", function() {
        window.location.href = "login.php";
    });

    
});






const mensajes = [
    {
        titulo: "Consejo:",
        mensaje: "Solo seleccioné los libros si los piensa leer, un libro apartado innecesariamente le impide a otro usuario poder disponer de él."
    },
    {
        titulo: "Consejo:",
        mensaje: "Revise la sección de “Autores” para conocer más sobre ellos y sus libros escritos."
    },
    {
        titulo: "Consejo:",
        mensaje: "El número telefónico de cada biblioteca es público, pero solamente debe comunicarse con ellos si presenta algún contratiempo al momento de devolver el libro."
    },
    {
        titulo: "Consejo:",
        mensaje: "Traté los libros con cuidado para que otros usuarios también puedan disfrutarlos."
    },
    {
        titulo: "Consejo:",
        mensaje: "Recuerde siempre estar al tanto de sus libros alquilados y del tiempo que le queda para ir a retirarlos."
    },
    {
        titulo: "Consejo:",
        mensaje: "Comparta su experiencia con otros y anímelos a utilizar Bookends, es rápido, sencillo y preciso."
    },
    
];

// Función para cambiar el mensaje y título cada 10 segundos
function cambiarMensaje() {
    const indiceMensaje = Math.floor(Math.random() * mensajes.length);
    document.getElementById("tituloConsejo").textContent = mensajes[indiceMensaje].titulo;
    document.getElementById("mensajeConsejo").textContent = mensajes[indiceMensaje].mensaje;
}

// Cambia el mensaje inicialmente
cambiarMensaje();

// Cambia el mensaje cada 10 segundos
setInterval(cambiarMensaje, 10000);

// Obtener la ventana modal y el botón que la abre
var modal = document.querySelector('.modal_generos');
var btn = document.querySelector('.boton_generos');

// Cuando se haga clic en el botón, mostrar la ventana modal
btn.addEventListener('click', function() {
    modal.style.display = 'block';
});

// Cuando se haga clic en el botón de cerrar, ocultar la ventana modal
var closeBtn = modal.querySelector('.close3');
closeBtn.addEventListener('click', function() {
    modal.style.display = 'none';
});

// Cuando se haga clic fuera de la ventana modal, ocultarla
window.addEventListener('click', function(event) {
    if (event.target == modal) {
        modal.style.display = 'none';
    }
});




document.getElementById('autoresBtn').addEventListener('click', function() {
    window.location.href = 'autores.php';
});


const generoButtons = document.querySelectorAll('.modal-button');
generoButtons.forEach(button => {
    button.addEventListener('click', () => {
        const genero = button.innerText.trim();
        window.location.href = `libros_UDL.php?genero=${encodeURIComponent(genero)}`;
    });
});








