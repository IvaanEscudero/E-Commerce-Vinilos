
document.addEventListener("DOMContentLoaded",
    function () {
        cargarCarrito();
        MostrarCarrito();
           /* let botonCantidad = document.getElementById(`carr`);
                botonCantidad.addEventListener('click', function() {
                    
                })*/
        document.getElementById('btnModificarDatos').addEventListener('click', function () {
            document.getElementById('clave').readOnly = false;
            document.getElementById('nom').readOnly = false;
            document.getElementById('ape').readOnly = false;
            document.getElementById('dom').readOnly = false;
            document.getElementById('pob').readOnly = false;
            document.getElementById('prov').readOnly = false;
            document.getElementById('cp').readOnly = false;
            document.getElementById('tel').readOnly = false;
        });
        document.getElementById('btnGuardarDatos').addEventListener('click', function () {
            document.getElementById('usu').readOnly = true;
            document.getElementById('clave').readOnly = true;
            document.getElementById('nom').readOnly = true;
            document.getElementById('ape').readOnly = true;
            document.getElementById('dom').readOnly = true;
            document.getElementById('pob').readOnly = true;
            document.getElementById('prov').readOnly = true;
            document.getElementById('cp').readOnly = true;
            document.getElementById('tel').readOnly = true;
        });
    });