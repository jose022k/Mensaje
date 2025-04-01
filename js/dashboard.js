document.addEventListener('DOMContentLoaded', () => {
    const theBookendsBtn = document.getElementById('theBookendsBtn');
    const modalTheBookends = document.getElementById('modal-the-bookends');
    const closeModalBtn = document.querySelector('#modal-the-bookends .close');

    
    comprobarSesion();

    // Función para abrir el modal y obtener los alquileres al hacer clic en el botón "The Bookend"
    theBookendsBtn.addEventListener('click', () => {
        modalTheBookends.style.display = 'block';
        obtenerAlquileres(); 
    });

    closeModalBtn.addEventListener('click', () => {
        modalTheBookends.style.display = 'none';
    });
});

function comprobarSesion() {
    fetch('../controlador/login_controlador.php?action=checkSession')
        .then(response => response.json())
        .then(data => {
            if (!data.loggedIn) {
                window.location.href = 'login.php'; 
            }
        })
        .catch(error => console.error('Error al comprobar la sesión:', error));
}

function obtenerAlquileres() {
    fetch('../controlador/alquiler_controlador.php?action=getAlquileres')
        .then(response => {
            if (response.ok) {
                return response.json(); 
            } else {
                throw new Error('Error al obtener los alquileres');
            }
        })
        .then(data => {
            if (data.success) {
                actualizarModalDashboard(data.alquileres);
                iniciarContador();
            } else {
                console.error('Error:', data.message);
            }
        })
        .catch(error => {
            console.error('Error:', error.message);
           
        });
}

function cancelarLibro(titulo) {
    fetch('../controlador/alquiler_controlador.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: `action=cancelarAlquiler&titulo=${encodeURIComponent(titulo)}`
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error('Error al cancelar el alquiler');
        }
    })
    .then(data => {
        if (data.success) {
            obtenerAlquileres(); 
        } else {
            throw new Error(data.message);
        }
    })
    .catch(error => {
        console.error('Error:', error.message);
        
    });
}

function actualizarModalDashboard(alquileres) {
    const tbody = document.getElementById('tabla-libros-dashboard');
    tbody.innerHTML = '';
    let totalCosto = 0;
    let cantidadLibros = 0;

    alquileres.forEach(({ titulo, cantidad, duracion, costo }) => {
        const row = document.createElement('tr');
        row.innerHTML = `
        <td>${titulo}</td>
        <td>${costo}</td>
        <td>${cantidad}</td>
        <td>${duracion}</td>
        <td><button class="cancelarLibro" data-titulo="${titulo}" style="background-color: black; color: white;">X</button></td>
        `;
        tbody.appendChild(row);
        totalCosto += costo * cantidad;
        cantidadLibros += parseInt(cantidad); 
    });

    document.getElementById('cantidadLibros').textContent = cantidadLibros;

    if (alquileres.length > 0) {
        document.getElementById('tiempoRestanteContainer').style.display = 'block';
        iniciarContador(); // Inicia el contador si hay alquileres
    } else {
        document.getElementById('tiempoRestanteContainer').style.display = 'none';
        clearInterval(intervalo); // Limpia el intervalo si no hay alquileres
        localStorage.removeItem('tiempoRestante');
    }

    
    document.getElementById('tabla-libros-dashboard').addEventListener('click', event => {
        if (event.target.classList.contains('cancelarLibro')) {
            const titulo = event.target.dataset.titulo;
            cancelarLibro(titulo);
        }
    });

  
    const cancelarLibrosButtons = document.querySelectorAll('.cancelarLibro');
    cancelarLibrosButtons.forEach(button => {
        button.addEventListener('mouseover', () => {
            button.style.backgroundColor = 'red';
            button.textContent = 'Cancelar libro';
        });

        button.addEventListener('mouseout', () => {
            button.style.backgroundColor = 'black';
            button.textContent = 'X';
        });
    });
}

let intervalo;

function iniciarContador() {
    let tiempoRestante = localStorage.getItem('tiempoRestante') || 48 * 3600;
    tiempoRestante = parseInt(tiempoRestante);
    const reloj = document.getElementById('reloj');

    function actualizarReloj() {
        const horas = Math.floor(tiempoRestante / 3600);
        const minutos = Math.floor((tiempoRestante % 3600) / 60);
        const segundos = tiempoRestante % 60;

        reloj.textContent = `${horas.toString().padStart(2, '0')}:${minutos.toString().padStart(2, '0')}:${segundos.toString().padStart(2, '0')}`;
        tiempoRestante--;
        localStorage.setItem('tiempoRestante', tiempoRestante);

        if (tiempoRestante < 0) {
            clearInterval(intervalo);
            reloj.textContent = 'Tiempo expirado';
        }
    }

    clearInterval(intervalo); // Limpiar cualquier intervalo existente
    intervalo = setInterval(actualizarReloj, 1000); // Establecer un nuevo intervalo
    actualizarReloj(); // Actualizar el reloj inicialmente
}
