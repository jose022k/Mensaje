document.addEventListener('DOMContentLoaded', () => {
    console.log('DOMContentLoaded event fired');

    const usuariosBtn = document.getElementById('usuarios-btn');
    const alquileresBtn = document.getElementById('alquileres-btn');
    const librosBtn = document.getElementById('libros-btn');

    const usuariosSection = document.getElementById('usuarios-section');
    const alquileresSection = document.getElementById('alquileres-section');
    const librosSection = document.getElementById('libros-section');

    console.log('Buttons and sections retrieved:', usuariosBtn, alquileresBtn, librosBtn, usuariosSection, alquileresSection, librosSection);

    function toggleSection(section) {
        console.log('Toggling sections...');
        if (!section.classList.contains('hidden')) {
            section.classList.add('hidden');
        } else {
            usuariosSection.classList.add('hidden');
            alquileresSection.classList.add('hidden');
            librosSection.classList.add('hidden');
            section.classList.remove('hidden');
        }
    }
    function fetchData(url, callback) {
        fetch(url)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Error en la respuesta del servidor');
                }
                return response.json();
            })
            .then(data => {
                callback(data);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });
    }

    function fetchUsuarios() {
        console.log('Fetching usuarios...');
        fetchData('../controlador/admin/usuarios.php?action=leer', fetchUsuariosCallback);
    }

    function fetchAlquileres() {
        console.log('Fetching alquileres...');
        fetchData('../controlador/admin/alquileres.php?action=leer', fetchAlquileresCallback);
    }

    function fetchLibros() {
        console.log('Fetching libros...');
        fetchData('../controlador/admin/libros.php?action=leer', fetchLibrosCallback);
    }

    function fetchUsuariosCallback(usuarios) {
        console.log('Usuarios recibidos:', usuarios);
        const usuariosTableBody = document.getElementById('usuarios-table').querySelector('tbody');
        usuariosTableBody.innerHTML = '';
        usuarios.forEach(usuario => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${usuario.id}</td>
                <td>${usuario.nombre}</td>
                <td>${usuario.apellido}</td>
                <td>${usuario.direccion}</td>
                <td>${usuario.usuario}</td>
                <td>${usuario.contrasena}</td>
                <td>
                    <button class="delete-btn" data-id="${usuario.id}" data-type="usuario">Eliminar</button>
                </td>
            `;
            usuariosTableBody.appendChild(row);
        });
        activateDeleteButtons('delete-btn', 'usuario'); 
    }
    

    function fetchAlquileresCallback(alquileres) {
        console.log('Alquileres recibidos:', alquileres);
        const alquileresTableBody = document.getElementById('alquileres-table').querySelector('tbody');
        alquileresTableBody.innerHTML = '';
        alquileres.forEach(alquiler => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${alquiler.id}</td>
                <td>${alquiler.cantidad_libro}</td>
                <td>${alquiler.titulo_libro}</td>
                <td>${alquiler.duracion}</td>
                <td>${alquiler.costo_libro}</td>
                <td>${alquiler.user_id}</td>
                <td>
                    <button class="delete-btn" data-id="${alquiler.id}" data-type="alquiler">Eliminar</button>
                </td>
            `;
            alquileresTableBody.appendChild(row);
        });
        activateDeleteButtons('delete-btn', 'alquiler'); 
    }
    

    function fetchLibrosCallback(libros) {
        console.log('Libros recibidos:', libros);
        const librosTableBody = document.getElementById('libros-table').querySelector('tbody');
        librosTableBody.innerHTML = '';
        libros.forEach(libro => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${libro.id}</td>
                <td contenteditable="true">${libro.titulo}</td>
                <td contenteditable="true">${libro.autor}</td>
                <td contenteditable="true">${libro.genero}</td>
                <td contenteditable="true">${libro.costo}</td>
                <td contenteditable="true">${libro.año_lanzamiento}</td>
                <td>
                    <button class="delete-btn" data-id="${libro.id}" data-type="libro">Eliminar</button>
                    <button class="edit-btn" data-id="${libro.id}" data-type="libro">Modificar</button>
                </td>
            `;
            librosTableBody.appendChild(row);
        });
        activateDeleteButtons('delete-btn', 'libro');
        activateEditButtons('edit-btn', 'libro'); 
    }
    

    function addLibro(titulo, autor, genero, costo, año_lanzamiento) {
        console.log('Adding libro...');
        fetch('../controlador/admin/libros.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ titulo, autor, genero, costo, año_lanzamiento })
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Error al agregar el libro');
            }
            return response.json();
        })
        .then(data => {
            console.log('Libro agregado:', data);
            fetchLibros();
        })
        .catch(error => {
            console.error('Error adding libro:', error);
        });
    }

    function activateDeleteButtons(className, type) {
        const deleteButtons = document.querySelectorAll(`.${className}[data-type="${type}"]`);
        deleteButtons.forEach(button => {
            button.addEventListener('click', () => {
                const id = button.getAttribute('data-id');
                deleteItem(id, type);
            });
        });
    }

    function deleteItem(id, type) {
        console.log(`Deleting ${type} with ID ${id}`);
        let controller;
        if (type === 'usuario') {
            controller = 'usuarios.php';
        } else if (type === 'alquiler') {
            controller = 'alquileres.php';
        } else if (type === 'libro') {
            controller = 'libros.php';
        }
        fetch(`../controlador/admin/${controller}?action=eliminar`, { 
            method: 'DELETE',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ id: id })
        })
       .then(response => {
            if (!response.ok) {
                throw new Error(`Error eliminando ${type}`);
            }
            return response.json();
        })
       .then(data => {
            console.log(`${type} eliminado:`, data);
            // Eliminar la fila de la tabla
            const row = document.querySelector(`[data-id="${id}"]`);
            row.parentNode.removeChild(row);
            
            if (type === 'usuario') {
                fetchUsuarios(); 
            } else if (type === 'alquiler') {
                fetchAlquileres();
            } else if (type === 'libro') {
                fetchLibros();
            }
        })
       .catch(error => {
            console.error(`Error eliminando ${type}:`, error);
        });
    }
    
    function activateEditButtons(className, type) {
        const editButtons = document.querySelectorAll(`.${className}[data-type="${type}"]`);
        editButtons.forEach(button => {
            button.addEventListener('click', () => {
                const id = button.getAttribute('data-id');
                const rowData = button.parentNode.parentNode.querySelectorAll('td[contenteditable="true"]');
                const newData = Array.from(rowData).map(data => data.textContent.trim());
                
                const updatedData = {
                    id: id, 
                    titulo: newData[0],
                    autor: newData[1],
                    genero: newData[2],
                    costo: newData[3],
                    año_lanzamiento: newData[4]
                };
                updateItem(id, type, updatedData);
            });
        });
    }
    
    function updateItem(id, type, newData) {
        console.log(`Updating ${type} with ID ${id}`);
        fetch(`../controlador/admin/${type}s.php?action=actualizar&id=${id}`, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(newData)
        })
        .then(response => {
            if (!response.ok) {
                throw new Error(`Error actualizando ${type}`);
            }
            return response.json();
        })
        .then(data => {
            console.log(`${type} actualizado:`, data);
            if (type === 'libro') {
                fetchLibros();
            }
        })
        .catch(error => {
            console.error(`Error actualizando ${type}:`, error);
        });
    }

    usuariosBtn.addEventListener('click', () => {
        console.log('Usuarios button clicked');
        toggleSection(usuariosSection);
        if (!usuariosSection.classList.contains('hidden')) {
            fetchUsuarios();
        }
    });

    alquileresBtn.addEventListener('click', () => {
        console.log('Alquileres button clicked');
        toggleSection(alquileresSection);
        if (!alquileresSection.classList.contains('hidden')) {
            fetchAlquileres();
        }
    });

    librosBtn.addEventListener('click', () => {
        console.log('Libros button clicked');
        toggleSection(librosSection);
        if (!librosSection.classList.contains('hidden')) {
            fetchLibros();
        }
    });

    document.getElementById('agregar-libro-btn').addEventListener('click', () => {
        const titulo = document.getElementById('titulo').value.trim();
        const autor = document.getElementById('autor').value.trim();
        const genero = document.getElementById('genero').value.trim();
        const costo = document.getElementById('costo').value.trim();
        const año_lanzamiento = document.getElementById('año_lanzamiento').value.trim();

        if (titulo && autor && genero && costo && año_lanzamiento) {
            addLibro(titulo, autor, genero, costo, año_lanzamiento);
        } else {
            console.error('Todos los campos son obligatorios');
        }
    });
});
