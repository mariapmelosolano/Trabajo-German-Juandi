
const formulario = document.getElementById('miFormulario');


const mensaje = document.getElementById('mensaje');


formulario.addEventListener('submit', function(event) {
    
    event.preventDefault();

    
    const nombre = document.getElementById('nombre').value;
    const correo = document.getElementById('correo').value;

    mensaje.style.display = "block";  
    mensaje.innerHTML = `¡Gracias, ${nombre}! Hemos recibido tu Correo: ${correo}.`;
   
    formulario.reset();
});