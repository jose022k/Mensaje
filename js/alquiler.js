document.addEventListener('DOMContentLoaded', () => {
    const apartarBtn = document.getElementById('apartarBtn');
    const imagenesLibros = document.querySelectorAll('.libro1 img');
    const modalAlquiler = document.getElementById('modal_alquiler');
    const closeBtn = modalAlquiler ? modalAlquiler.querySelector('.close') : null;
    const aceptarBtn = document.getElementById('aceptarBtn');
    const totalCostoElement = document.getElementById('total-costo');
    const totalLibrosElement = document.getElementById('total-libros');

    let seleccionados = [];
    let listo = false;

    function toggleSeleccionLibros(activado) {
        imagenesLibros.forEach(imagen => {
            imagen.style.pointerEvents = activado ? 'auto' : 'none';
        });
    }

    if (apartarBtn) {
        apartarBtn.addEventListener('click', () => {
            if (!listo) {
                listo = true;
                apartarBtn.textContent = 'Listo';
                toggleSeleccionLibros(true);
            } else {
                if (seleccionados.length > 0) {
                    if (modalAlquiler) modalAlquiler.style.display = 'block';
                    actualizarModal();
                } else {
                    console.log('No hay libros seleccionados');
                }
                listo = false;
                apartarBtn.textContent = 'Apartar';
                toggleSeleccionLibros(false);
            }
        });
    }

    imagenesLibros.forEach(imagen => {
        imagen.addEventListener('click', () => {
            if (listo) {
                const tituloLibro = imagen.nextElementSibling.textContent;
                if (!seleccionados.includes(tituloLibro)) {
                    imagen.classList.add('seleccionado');
                    seleccionados.push(tituloLibro);
                } else {
                    imagen.classList.remove('seleccionado');
                    seleccionados = seleccionados.filter(titulo => titulo !== tituloLibro);
                }
                if (seleccionados.length === 0) {
                    listo = false;
                    apartarBtn.textContent = 'Apartar';
                    toggleSeleccionLibros(false);
                }
                actualizarModal();
            }
        });
    });

    if (closeBtn) {
        closeBtn.addEventListener('click', () => {
            if (modalAlquiler) modalAlquiler.style.display = 'none';
        });
    }

    window.addEventListener('click', (event) => {
        if (event.target === modalAlquiler) {
            modalAlquiler.style.display = 'none';
        }
    });

    async function obtenerCostoLibro(titulo) {
        return fetch(`../controlador/obtener_costo.php?titulo=${encodeURIComponent(titulo)}`)
            .then(response => response.json())
            .then(data => data.costo);
    }

    function convertDurationToString(duration) {
        return `${duration} días`;
    }

    async function actualizarModal() {
        const tbody = document.getElementById('tabla-libros');
        if (!tbody) {
            console.error("No se encontró el elemento 'tabla-libros'");
            return;
        }
        tbody.innerHTML = '';
        let totalCosto = 0;
        let totalLibros = 0;

        for (const titulo of seleccionados) {
            const costo = await obtenerCostoLibro(titulo);
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${titulo}</td>
                <td data-titulo="${titulo}" data-costo="${costo}">${costo}</td>
                <td>
                    <input type="number" class="cantidad" data-titulo="${titulo}" value="1" min="1" max="5">
                </td>
                <td>
                    <input type="number" class="duracion" data-titulo="${titulo}" value="2" min="2">
                </td>
            `;
            tbody.appendChild(row);

            const cantidadInput = row.querySelector(`.cantidad[data-titulo="${titulo}"]`);
            cantidadInput.addEventListener('input', actualizarTotales);

            totalCosto += parseFloat(costo);
            totalLibros += 1;
        }

        actualizarTotales();

        function actualizarTotales() {
            totalCosto = 0;
            totalLibros = 0;

            seleccionados.forEach(titulo => {
                const cantidad = parseInt(document.querySelector(`.cantidad[data-titulo="${titulo}"]`).value);
                const costo = parseFloat(document.querySelector(`td[data-titulo="${titulo}"]`).getAttribute('data-costo'));

                totalLibros += cantidad;
                totalCosto += costo * cantidad;
            });

            if (totalCostoElement) {
                totalCostoElement.textContent = `${totalCosto.toFixed(2)} Bs`;
            } else {
                console.error("No se encontró el elemento 'total-costo'");
            }

            if (totalLibrosElement) {
                totalLibrosElement.textContent = totalLibros;
            } else {
                console.error("No se encontró el elemento 'total-libros'");
            }
        }
    }

    if (aceptarBtn) {
        aceptarBtn.addEventListener('click', async () => {
            const alquileres = seleccionados.map(titulo => {
                const cantidad = parseInt(document.querySelector(`.cantidad[data-titulo="${titulo}"]`).value);
                const duracion = parseInt(document.querySelector(`.duracion[data-titulo="${titulo}"]`).value);
                const costo = parseFloat(document.querySelector(`td[data-titulo="${titulo}"]`).getAttribute('data-costo'));
                const duracionString = convertDurationToString(duracion);
                return { titulo, cantidad, duracion: duracionString, costo };
            });

            console.log('Datos enviados al servidor:', { alquileres });

            fetch('../controlador/guardar_alquiler.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ alquileres: alquileres })
            })
            .then(response => response.json())
            .then(data => {
                console.log('Respuesta del servidor:', data);
                if (data && data.success) {
                    alert('Alquiler guardado exitosamente');
                    if (modalAlquiler) modalAlquiler.style.display = 'none';
                    seleccionados = [];
                    toggleSeleccionLibros(false);
                    apartarBtn.textContent = 'Apartar';
                    imagenesLibros.forEach(imagen => imagen.classList.remove('seleccionado'));

                    // Enviar datos al modal de dashboard
                    enviarDatosDashboard(alquileres);
                } else {
                    throw new Error('Error al guardar el alquiler');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('Error al guardar el alquiler');
            });
        });
    }

    async function enviarDatosDashboard(alquileres) {
        const modalDashboard = document.getElementById('modal-the-bookends');
        const tablaLibrosDashboard = document.getElementById('tabla-libros-dashboard');
        const cantidadLibros = document.getElementById('cantidadLibros');
        const totalContainer = document.getElementById('total-container');

        if (modalDashboard && tablaLibrosDashboard && cantidadLibros && totalContainer) {
            let totalLibros = 0;
            let totalCosto = 0;

            tablaLibrosDashboard.innerHTML = ''; 

            alquileres.forEach(({ titulo, cantidad, duracion, costo }) => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${titulo}</td>
                    <td>${costo}</td>
                    <td>${cantidad}</td>
                    <td>${duracion}</td>
                    <td><button class="cancelarLibro" data-titulo="${titulo}" style="background-color: black; color: white;">Cancelar libro</button></td>
                `;
                tablaLibrosDashboard.appendChild(row);
                totalLibros += cantidad;
                totalCosto += costo * cantidad;
            });

            cantidadLibros.textContent = totalLibros;
            totalContainer.innerHTML = `Total costo: ${totalCosto.toFixed(2)} Bs`;

            // Mostrar el modal de dashboard
            modalDashboard.style.display = 'block';
        }
    }
});