class Pie extends HTMLElement {
    constructor() {
        super()
        this.innerHTML =
            `
        <link rel="stylesheet" type="text/css" href="./css/stylefooter.css">
        <div>
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
        <link rel="stylesheet" type="text/css" href="./css/stylemenu.css">
        <header>
        <nav class ="navbar navbar-expand-md">
        <div class="container-fluid row">
            <a class="navbar-brand" href="#./index.html">Alegría Sonora <img src="../web/img/as.png" width="40" height="40"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarExampleDefaut">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarExampleDefaut" >
                <!--"me-auto" para que salga el despegable a la derecha-->
                <form class="d-flex col-sm-3" id="search">
                    <input type="text" class="form-control" placeholder="Busca artistas, vinilos, álbumes y más... ">
                
                </form>
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" id="miActivo" href="./index.php">Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./productos.php">Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./pedidos.php">Pedidos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./mensajes.php">Mensajes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="./usuario.php">Usuario</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
        </header>   
      `
    }
}
window.customElements.define('mi-menu', Menu);