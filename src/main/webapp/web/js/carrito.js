var carrito = null;

function cargarCarrito() {
	if (carrito === null) { // Si no hemos cargado todavía el carrito
		// Cargamos el carrito almacenado
		carrito = JSON.parse(localStorage.getItem("mi-carrito-almacenado"));
		if (carrito === null) { // Si no existía carrito almacenado
			carrito = []; // Creamos un vector vacío
		}
	}
}

function guardarCarrito() {
	localStorage.setItem("mi-carrito-almacenado", JSON.stringify(carrito));
}


function addCarrito(producto) {

	cargarCarrito();
	let encontrado = false;

	if (carrito.length == 0) {
		if (producto.existencias > 0) {
			if (parseInt(document.getElementById(producto.codigo).value) <= producto.existencias) {
				producto.cantidad = parseInt(document.getElementById(producto.codigo).value);
				carrito.push(producto);
				alert("Producto añadido al carrito.");
				guardarCarrito();
				MostrarCarrito();
			}
			else {
				alert("No hay suficientes existencias de este producto");
			}
		}
	}
	else {
		for (let i = 0; i < carrito.length; i++) {
			// Si el producto está en el carrito, se suman las cantidades
			if (carrito[i].codigo == producto.codigo) {
				encontrado = true;
				if (carrito[i].cantidad + parseInt(document.getElementById(producto.codigo).value) <= producto.existencias) {
					carrito[i].cantidad = parseInt(carrito[i].cantidad) + parseInt(document.getElementById(producto.codigo).value);
					alert("Producto modificado en el carrito");
				} else {
					alert("No hay suficientes existencias de este producto");
				}
				guardarCarrito();
				MostrarCarrito();
				break;
			}
		}
		// Si el producto no está en el carrito, agregarlo
		if (!encontrado) {
			if (producto.existencias > 0) {
				if (parseInt(document.getElementById(producto.codigo).value) <= producto.existencias) {
					producto.cantidad = parseInt(document.getElementById(producto.codigo).value);
					carrito.push(producto);
					alert("Producto añadido al carrito.");
					guardarCarrito();
					MostrarCarrito();
				} else {
					alert("No hay suficientes existencias de este producto");
				}
			}
		}
	}

}

function borrarProducto(codigo) {
	cargarCarrito();
	for (let i = 0; i < carrito.length; i++) {
		if (carrito[i].codigo === codigo) {
			carrito.splice(i, 1);
			guardarCarrito();
			MostrarCarrito();
			return true;
		}
	}
	return false;
}

function modificarCantidad(codigo) {
	cargarCarrito();
	let cant = parseInt(prompt("Introduce cantidad:"));
	if (!isNaN(cant)) {
		for (let i = 0; i < carrito.length; i++) {
			if (carrito[i].codigo == codigo) {
				if (cant <= 0) {
					carrito.splice(i, 1);
					guardarCarrito();
					MostrarCarrito();
					alert("Producto eliminado del carrito");
				} else {
					if (cant <= carrito[i].existencias && carrito[i].existencias > 0) {
						carrito[i].cantidad = cant;
						guardarCarrito();
						MostrarCarrito();
						alert("Unidades modificada");
					}
					else {
						alert("No hay existencias disponibles de este producto");
					}
				}
				break;
			}
		}
	} else {
		alert("Por favor, introduce un número entero válido.");
	}


}
function MostrarCarrito() {
	cargarCarrito();
	let carritoContainer = document.getElementById("carrito-container");
	carritoContainer.innerHTML = "";
	carrito.forEach(function (producto) {
		var productoDiv = document.createElement("li");
		let productoA = document.createElement("a");
		productoA.classList.add("dropdown-item");
		productoDiv.appendChild(productoA);

		productoA.innerHTML = `${producto.descripcion} ${producto.precio}€ ${producto.cantidad}x
            <button id="butcar" onclick="modificarCantidad(${producto.codigo})">M</button>
            <button id="butcar" onclick="borrarProducto(${producto.codigo})">X</button>
			<button id="butcar" onclick="vaciarCarrito()">O</button>
        `;

		carritoContainer.appendChild(productoDiv);
	});
	if (carrito.length > 0) {
		var productoDivCompra = document.createElement("li");
		let productoACompra = document.createElement("a");

		productoACompra.classList.add("dropdown-item");
		productoDivCompra.appendChild(productoACompra);

		productoACompra.innerHTML = `
			<button type="submit" id="butcarcompra" class="btn btn-outline-warning" onclick="EnviarCarrito('../recogercarrito.html',carrito)">Tramitar Compra</button>  
			`;

		carritoContainer.appendChild(productoDivCompra);
	}

}

function Ticket() {
	cargarCarrito();
}

function vaciarCarrito() {
	cargarCarrito();
	carrito = [];
	guardarCarrito();
	MostrarCarrito();

}
function invokeScript(divid) {
	var scriptObj = divid.getElementsByTagName("SCRIPT");
	var len = scriptObj.length;
	for (var i = 0; i < len; i++) {
		var scriptText = scriptObj[i].text;
		var scriptFile = scriptObj[i].src
		var scriptTag = document.createElement("SCRIPT");
		if ((scriptFile != null) && (scriptFile != "")) {
			scriptTag.src = scriptFile;
		}
		scriptTag.text = scriptText;
		if (!document.getElementsByTagName("HEAD")[0]) {
			document.createElement("HEAD").appendChild(scriptTag)
		}
		else {
			document.getElementsByTagName("HEAD")[0].appendChild(scriptTag);
		}
	}
}

function nuevaConexion() {
	var xmlhttp = false;
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	}
	catch (e) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		catch (E) {
			xmlhttp = false;
		}
	}
	if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
		xmlhttp = new XMLHttpRequest();
	}
	return xmlhttp;
}

function EnviarCarrito(url, valores) {
	conexion = nuevaConexion();
	conexion.open("POST", url, true);
	conexion.onreadystatechange = function () {
		if (conexion.readyState == 4) { // Completo
			if (conexion.status == 200) { // Correcto
				window.location.href = './resguardo.jsp';
			}
		}
	}
	conexion.setRequestHeader('Content-Type', 'application/json; charset=utf-8');
	conexion.send(JSON.stringify(valores));
	
}