class Pie extends HTMLElement {
    constructor() {
        super()
        this.innerHTML =
            `
        <link rel="stylesheet" type="text/css" href="css/stylefooter.css">
        <div row>
            <footer class="footer">&copy; 2024 - Autor/a - Información de redes sociales</footer>    
        </div>
        `

    }
}
window.customElements.define('mi-pie', Pie);

class Menu extends HTMLElement {
    constructor() {
        super()
        this.innerHTML = `
        <link rel="stylesheet" type="text/css" href="css/stylemenu.css">
        <script src="./js/carrito.js"></script>
        <header>
        <nav class ="navbar navbar-expand-md ">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Alegría Sonora <img src="./img/as.png" width="40" height="40"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarExampleDefaut">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarExampleDefaut">
                <!--"me-auto" para que salga el despegable a la derecha-->
                <form class="d-flex col-sm-3" id="search">
                    <input type="text" class="form-control" placeholder="Busca artistas, vinilos, álbumes y más... ">
                
                </form>
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" id="miActivo" href="./tienda.jsp">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./empresa.jsp">Empresa</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./contacto.jsp">Contacto</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./productos.jsp">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./usuario.jsp">Usuario</a>
                    </li>
                </ul>
                <div class="navbar-nav dropstart">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5M3.14 5l1.25 5h8.22l1.25-5zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0m9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2m-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0"/>
                        </svg>
                    </a>
                    <ul class="dropdown-menu" id="carrito-container">
                    
                    </ul>
                </div>
            </div>
        </div>
    </nav>
        </header>   
      `
    }
}
window.customElements.define('mi-menu', Menu);