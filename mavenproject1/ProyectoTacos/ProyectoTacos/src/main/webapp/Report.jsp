<%-- 
    Document   : Report
    Created on : 7/06/2020, 09:30:27 PM
    Author     : sandr
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingredientes</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
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
        <div style="width: 70rem; display: block; margin: auto; margin-top: 60px;">
            <div class="card-body">
                <form>
                    <div class="row">
                        <div class="form-group col s-10">
                            <select class="form-control" id="exampleFormControlSelect1">
                                <option disabled="">Opciones de Reportes</option>
                              <option>Reporte Ventas</option>
                              <option>Reporte Usuarios</option>
                              <option>Reporte Ingredientes</option>
                            </select>
                        </div>
                        <div class="col s2">
                            <button type="submit" class="btn btn-primary mb-2">Buscar</button>
                        </div>
                    </div>
                </form>
                <br />
                <div>
                    <div>
                        <img src="https://www.pngitem.com/pimgs/m/24-247250_grafico-graficas-de-barras-png-transparent-png.png" class="img-fluid" alt="Responsive image">
                    </div>
                    <br />
                    <div>
                        <button type="submit" class="btn btn-primary mb-2">Generar PDF</button>
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

