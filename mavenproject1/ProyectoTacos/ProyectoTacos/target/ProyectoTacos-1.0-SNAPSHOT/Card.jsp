<%-- 
    Document   : Card
    Created on : 7/06/2020, 09:15:06 PM
    Author     : sandr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingredientes</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script>
        window.onload = function () {
            // Variables
            let baseDeDatos = [
                {
                    id: 1,
                    nombre: 'milanesa',
                    precio: 22,
                    imagen: 'https://img.chilango.com/2018/07/tacos-el-papi-7-1.jpg'
                },
                {
                    id: 2,
                    nombre: 'pechuga',
                    precio: 18,
                    imagen: 'https://img.chilango.com/2018/07/tacos-el-papi-5-1.jpg'
                },
                {
                    id: 4,
                    nombre: 'campechano',
                    precio: 18,
                    imagen: 'https://lh3.googleusercontent.com/p/AF1QipM6Fk8tQANoVxME3k8ofzyNhRJbXq-GHFRIUy8_=w600-k'
                },
                {
                id: 5,
                    nombre: 'arrachera',
                    precio: 28,
                    imagen: 'https://www.aquien.mx/wp-content/uploads/2019/05/taco-4-1-1024x732.jpg'
                },
                {
                id: 6,
                    nombre: 'enchilada',
                    precio: 23,
                    imagen: 'https://blog.tacoguru.com/wp-content/uploads/2018/08/Template-Blog-No-Carrusel-29-520x400.png'
                },
                {
                id: 7,
                    nombre: 'queso gratinado',
                    precio: 3,
                    imagen: 'https://img.gruporeforma.com/imagenes/960x640/3/158/2157522.jpg'
              }

            ]
            let $items = document.querySelector('#items');
            let carrito = [];
            let total = 0;
            let $carrito = document.querySelector('#carrito');
            let $total = document.querySelector('#total');
            // Funciones
            function renderItems () {
                for (let info of baseDeDatos) {
                    // Estructura
                    let miNodo = document.createElement('div');
                    miNodo.classList.add('card', 'col-sm-4');
                    // Body
                    let miNodoCardBody = document.createElement('div');
                    miNodoCardBody.classList.add('card-body');
                    // Titulo
                    let miNodoTitle = document.createElement('h5');
                    miNodoTitle.classList.add('card-title');
                    miNodoTitle.textContent = info['nombre'];
                    // Imagen
                    let miNodoImagen = document.createElement('img');
                    miNodoImagen.classList.add('img-fluid');
                    miNodoImagen.setAttribute('src', info['imagen']);
                    // Precio
                    let miNodoPrecio = document.createElement('p');
                    miNodoPrecio.classList.add('card-text');
                    miNodoPrecio.textContent = info['precio'] + '$';
                    // Boton 
                    let miNodoBoton = document.createElement('button');
                    miNodoBoton.classList.add('btn', 'btn-primary');
                    miNodoBoton.textContent = '+';
                    miNodoBoton.setAttribute('marcador', info['id']);
                    miNodoBoton.addEventListener('click', anyadirCarrito);
                    // Insertamos
                    miNodoCardBody.appendChild(miNodoImagen);
                    miNodoCardBody.appendChild(miNodoTitle);
                    miNodoCardBody.appendChild(miNodoPrecio);
                    miNodoCardBody.appendChild(miNodoBoton);
                    miNodo.appendChild(miNodoCardBody);
                    $items.appendChild(miNodo);
                }
            }

            function anyadirCarrito () {
                // Anyadimos el Nodo a nuestro carrito
                carrito.push(this.getAttribute('marcador'))
                // Calculo el total
                calcularTotal();
                // Renderizamos el carrito 
                renderizarCarrito();
            }

            function renderizarCarrito () {
                // Vaciamos todo el html
                $carrito.textContent = '';
                // Quitamos los duplicados
                let carritoSinDuplicados = [...new Set(carrito)];
                // Generamos los Nodos a partir de carrito
                carritoSinDuplicados.forEach(function (item, indice) {
                    // Obtenemos el item que necesitamos de la variable base de datos
                    let miItem = baseDeDatos.filter(function(itemBaseDatos) {
                        return itemBaseDatos['id'] == item;
                    });
                    // Cuenta el número de veces que se repite el producto
                    let numeroUnidadesItem = carrito.reduce(function (total, itemId) {
                        return itemId === item ? total += 1 : total;
                    }, 0);
                    // Creamos el nodo del item del carrito
                    let miNodo = document.createElement('li');
                    miNodo.classList.add('list-group-item', 'text-right', 'mx-2');
                    miNodo.textContent = `${numeroUnidadesItem} x ${miItem[0]['nombre']} - ${miItem[0]['precio']}$`;
                    // Boton de borrar
                    let miBoton = document.createElement('button');
                    miBoton.classList.add('btn', 'btn-danger', 'mx-5');
                    miBoton.textContent = 'X';
                    miBoton.style.marginLeft = '1rem';
                    miBoton.setAttribute('item', item);
                    miBoton.addEventListener('click', borrarItemCarrito);
                    // Mezclamos nodos
                    miNodo.appendChild(miBoton);
                    $carrito.appendChild(miNodo);
                })
            }

            function borrarItemCarrito () {
                console.log()
                // Obtenemos el producto ID que hay en el boton pulsado
                let id = this.getAttribute('item');
                // Borramos todos los productos
                carrito = carrito.filter(function (carritoId) {
                    return carritoId !== id;
                });
                // volvemos a renderizar
                renderizarCarrito();
                // Calculamos de nuevo el precio
                calcularTotal();
            }

            function calcularTotal () {
                // Limpiamos precio anterior
                total = 0;
                // Recorremos el array del carrito
                for (let item of carrito) {
                    // De cada elemento obtenemos su precio
                    let miItem = baseDeDatos.filter(function(itemBaseDatos) {
                        return itemBaseDatos['id'] == item;
                    });
                    total = total + miItem[0]['precio'];
                }
                // Formateamos el total para que solo tenga dos decimales
                let totalDosDecimales = total.toFixed(2);
                // Renderizamos el precio en el HTML
                $total.textContent = totalDosDecimales;
            }
            // Eventos

            // Inicio
            renderItems();
        } 
    </script>
    
    </head>
    <body>
        <!--START: navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">
              <img src="https://images.vexels.com/media/users/3/185298/isolated/lists/37711cb132f6d8ae8a584033104babfe-taco-icono-taco.png" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
            </a>
            <div class="collapse navbar-collapse" id="navbarText">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Users.jsp">Usuarios</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Menu.jsp">Ingredientes</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Report.jsp">Reportes</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="Card.jsp">Tienda</a>
                </li>
              </ul>
                <span class="navbar-text">
                    <a>Cerrar Seción</a>
                </span>
            </div>
         </nav>
        <!--END: navbar-->

        <div class="container" style="margin-top: 40px; margin-bottom: 40px">
            <div id="lower">
                <input type="checkbox"><label class="check" for="checkbox">limon</label>
                <input type="checkbox"><label class="check" for="checkbox">pepinos</label>
                <input type="checkbox"><label class="check" for="checkbox">jicama</label>
                <input type="checkbox"><label class="check" for="checkbox">papas</label>
                <input type="checkbox"><label class="check" for="checkbox">nopales</label>
                <input type="checkbox"><label class="check" for="checkbox">pico de gallo</label>
                <input type="checkbox"><label class="check" for="checkbox">piña</label>
                <div class="row">
                    <!-- Elementos generados a partir del JSON -->
                    <main id="items" class="col-sm-8 row"></main>
                    <!-- Carrito -->
                    <aside class="col-sm-4">
                        <h2>Carrito</h2>
                        <!-- Elementos del carrito -->
                        <ul id="carrito" class="list-group"></ul>
                        <hr>
                        <!-- Precio total -->
                        <p class="text-right">Total:$ <span id="total"></mexico>$pesos;</p>
                        <!-- Submit Button -->
                        <input type="submit" value="continuar"> 
                        <!-- Submit Button -->
                        <input type="submit" value="cancelar">       
                    </aside>
                </div>
            </div>
        </div>
        
        
        </div>
        <!--START: script-->        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <!--END: script-->
    </body>
</html>
