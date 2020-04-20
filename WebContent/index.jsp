<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="css/estilosLogin.css">

    <title>UFPS P.D</title>
  </head>

  <body background="https://dl.dropboxusercontent.com/s/wym8gkwdaepydre/3.jpg?dl=0"  >
    
	 
			
    
   <c:set var="alerta" scope="application" value="${applicationScope.persona}"/> 	
      	
	<c:if test="${alerta=='usuario'}">
		<c:redirect url="perfil_estudiante.jsp"></c:redirect>
	</c:if>
	<c:if test="${alerta=='administrador'}"> 
 	<c:redirect url="perfil_admin.jsp"></c:redirect>
	</c:if>
	<c:if test="${alerta=='opcion'}"> 
 	<c:redirect url="opcion_home.jsp"></c:redirect>
	</c:if>
	
  <div class="container">

    <div id="log" class="col-md-4">
      <div slot="content" class="au-target" au-target-id="46">

    <div class="col-xs-12 text-center">
      <img id="logo" class="ufps-logo-sign" src="https://dl.dropboxusercontent.com/s/qxh03ntptgz9bef/logo-transparent.png?dl=0" alt="">
    </div>

    <div class="col-xs-10 col-xs-offset-1 text-center">

      <h1>Iniciar Sesión</h1>
      
    

	
	
      <form class="text-left ufps-form-sign au-target" au-target-id="47"  method="post" action="LoginController">
        <div class="form-group">
          <label id="textos" for="codigo">Codigo</label>
          <input type="text" class="form-control ufps-sign-input au-target" id="codigo" name="codigo" placeholder="Codigo" au-target-id="48" maxlength="7" required>
        </div>

        <div class="form-group">
          <label id="textos"  for="documento">Documento</label>
          <input type="text" class="form-control ufps-sign-input au-target" id=documento name="documento" placeholder="Documento" au-target-id="49" maxlength="10" required>
        </div>

        <div class="form-group">
          <label id="textos" for="contraseña">Contraseña</label>
          <input type="password" class="form-control ufps-sign-input au-target" id="contraseña" name="contraseña" placeholder="Contraseña" au-target-id="49" required>
        </div>

       <br> <center><button type="type="submit"" class="btn btn-outline-light">Ingresar</button></center>

      </form>

      <div id="clave">
        <center><a id="textos" route-href="route: recovery-password" class="au-target" au-target-id="52" href="#">¿Olvidaste tu contraseña?</a></center><br>
      </div>
    </div>
  </div><!--slot-->


      <div class="col-sm-12 text-center ufps-sign-about hidden-xs">
        
        <footer id="textos">
        
          UFPS Prestamos Deportivos     - 2018 Universidad Francisco de Paula Santander
        </footer>
      </div>
    </div>
  </div>

  </body>
</html>