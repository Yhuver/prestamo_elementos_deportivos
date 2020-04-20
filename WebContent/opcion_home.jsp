<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Opcion</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
   <script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>  
   <script>
      $(document).ready(function()
      {
    	  $("#mostrarmodal").modal({backdrop: 'static', keyboard: false})
      });
    </script>
</head>
<body>



<c:set var="alerta" scope="application" value="${applicationScope.persona}"/> 	
      	
      	
    <c:if test="${alerta==null}"> 
 	<c:redirect url="index.jsp"></c:redirect>
	</c:if>
	<c:if test="${fn:indexOf(alerta, 'usuario')!=-1}">
		<c:redirect url="perfil_estudiante.jsp"></c:redirect>
	</c:if>
	<c:if test="${fn:indexOf(alerta, 'administrador')!=-1}"> 
 	<c:redirect url="perfil_admin.jsp"></c:redirect>
	</c:if>
	
	

   <div class="modal fade" id="mostrarmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLabel">Bienvenido</h3>
      </div>
      <div class="modal-body">
        Elije la opción como quieres iniciar.
      </div>
      <div class="modal-footer">
        <form action="OpcionController" method="post">
        <button type="submit" value="si" name="administrador"  class="btn btn-primary">Administrador</button>
        <button type="submit" value="si" name="usuario" class="btn btn-primary">Usuario</button>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>