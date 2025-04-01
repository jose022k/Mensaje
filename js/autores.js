document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('.buscador');
    const input = form.querySelector('input[name="buscar"]');
    const autoresContainer = document.getElementById('autoresContainer');

    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const query = input.value.trim().toLowerCase();
        if (query === '') return;

       
        autoresContainer.querySelectorAll('.highlight').forEach(span => {
            const parent = span.parentNode;
            parent.replaceChild(document.createTextNode(span.textContent), span);
            parent.normalize();
        });

        const scrollbarMarkers = document.querySelector('.scrollbar-markers');
        if (scrollbarMarkers) {
            scrollbarMarkers.remove();
        }

     
        const matches = [];
        autoresContainer.querySelectorAll('h3').forEach(h3 => {
            const text = h3.textContent;
            const lowerText = text.toLowerCase();
            if (lowerText.includes(query)) {
                const index = lowerText.indexOf(query);
                const highlightedText = text.substring(0, index) +
                    `<span class="highlight">${text.substring(index, index + query.length)}</span>` +
                    text.substring(index + query.length);
                h3.innerHTML = highlightedText;
                matches.push(h3);
            }
        });

      
        if (matches.length > 0) {
            const markersContainer = document.createElement('div');
            markersContainer.className = 'scrollbar-markers';

            matches.forEach((match, index) => {
                const marker = document.createElement('div');
                marker.className = 'scrollbar-marker';
                marker.style.top = `${(match.offsetTop / autoresContainer.scrollHeight) * 100}%`;
                marker.addEventListener('click', () => {
                    match.scrollIntoView({ behavior: 'smooth', block: 'center' });
                });
                markersContainer.appendChild(marker);
            });

            document.body.appendChild(markersContainer);
        }
    });
});
