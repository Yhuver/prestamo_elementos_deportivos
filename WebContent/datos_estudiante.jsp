 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 
 <div id="page-inner" >
                <div class="row">
                    <div class="col-md-12">
                     <center><h2>Mi Perfil</h2></center>   
                   
                    </div>
                </div>
                 <!-- /. ROW  -->
                <hr>
                <img src="https://dl.dropboxusercontent.com/s/t709elljk46irgj/perfil.png?dl=0" class="user-image img-responsive"/>
					
                 <hr />
                 
                 
                 <jsp:useBean id="Pdao" class="model.PersonaDao" scope="request">
                 </jsp:useBean>
                 <c:set var="al" scope="session" value="${sessionScope.userName}"/> 
                 
                 <c:set var="p" value="${Pdao.find(al)}"/>
                 
<%--              <hr >
                <p id="cont-perfil" class="text-left">Nombres: <c:out value="${p.getNombre()}"></c:out></p>
                <p id="cont-perfil" class="text-left">Apellidos: <c:out value="${p.getApellido()}"></c:out></p>
                <p id="cont-perfil" class="text-left">Codigo : <c:out value="${p.getCodigo()}"></c:out></p>
                <p id="cont-perfil" class="text-left">Estado: <c:out value="${p.getEstado()}"></c:out></p>
                 <hr /> --%>
<hr >
<table class="table table-hover table-striped table-condensed table-bordered">   
				<tbody>
                         <tr>
                            <th>Codigo</th>
                            <td><c:out value="${p.getCodigo()}"></c:out></td>
                        </tr>
                        <tr>
                            <th>Nombres</th>
                            <td> <c:out value="${p.getNombre()}"></c:out></td>
                        </tr>
                        <tr>
                            <th>Apellidos</th>
                            <td><c:out value="${p.getApellido()}"></c:out></td>
                        </tr>

                        <tr>
                            <th>Estado</th>
                            <td><c:out value="${p.getEstado()}"></c:out></td>
                        </tr>
                                 
                    </tbody>
</table>
<hr />
               
            </div>