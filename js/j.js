document.getElementById('boton-abrir').addEventListener('click', () => {
    mostrarEfecto('serpentinas-globos');
    document.getElementById('mensaje-cumple').classList.remove('oculto');
  });
  
  document.getElementById('boton-abrir-despues').addEventListener('click', () => {
    mostrarEfecto('corazones');
    document.getElementById('mensaje-noviazgo').classList.remove('oculto');
  });
  
  function mostrarEfecto(tipo) {
    const contenedor = document.querySelector('.contenedor');
  
    if (tipo === 'serpentinas-globos') {
      for (let i = 0; i < 20; i++) {
        const serpentina = document.createElement('div');
        serpentina.classList.add('serpentina');
        contenedor.appendChild(serpentina);
        
        const globo = document.createElement('div');
        globo.classList.add('globo');
        contenedor.appendChild(globo);
      }
    } else if (tipo === 'corazones') {
      for (let i = 0; i < 20; i++) {
        const corazon = document.createElement('div');
        corazon.classList.add('corazon');
        contenedor.appendChild(corazon);
      }
    }
  
    setTimeout(() => {
      const efectos = document.querySelectorAll('.serpentina, .globo, .corazon');
      efectos.forEach(efecto => efecto.remove());
    }, 3000); // Remueve los efectos después de 3 segundos
  }
  