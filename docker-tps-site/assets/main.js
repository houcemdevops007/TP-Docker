document.addEventListener('DOMContentLoaded', () => {
    // Add copy buttons to sequence blocks
    const preBlocks = document.querySelectorAll('pre');
    
    preBlocks.forEach((pre) => {
        const button = document.createElement('button');
        button.className = 'copy-btn';
        button.textContent = 'Copier';
        
        button.addEventListener('click', async () => {
            const code = pre.querySelector('code');
            const textToCopy = code ? code.innerText : pre.innerText;
            
            try {
                await navigator.clipboard.writeText(textToCopy);
                button.textContent = 'Copié !';
                button.style.color = '#3fb950';
                button.style.borderColor = '#3fb950';
                
                setTimeout(() => {
                    button.textContent = 'Copier';
                    button.style.color = '';
                    button.style.borderColor = '';
                }, 2000);
            } catch (err) {
                console.error('Failed to copy text: ', err);
                button.textContent = 'Erreur';
            }
        });
        
        pre.appendChild(button);
    });
});
