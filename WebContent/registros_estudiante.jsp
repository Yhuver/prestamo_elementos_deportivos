<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>


<script type="text/javascript">

$(document).ready(function(){
	 $('button').click(function(event){
	     var id2 = event.target.value;;
	     $.ajax({
	         type:'POST',
	         data: {id2:id2},
	         url:'AnularSolicitudController',
	         success: function(result){
	             /*  $('#'+result+'-eliminar').remove(); */
	              $("#page-wrapper").load("registros_estudiante.jsp");  
	              alert("Solicitud Cancelada Con Exito");
	            }

	        });
	    }); 
	 });
 
 </script> 

 
 



<div id="page-inner">
    <div class="row">
        <div class="col-md-12">
           <h2>Registro de Solicitudes</h2>
           <br/>   
           <h5> <i class="fa fa-pencil" aria-hidden="true"></i> Consulta y Modifica tus solicitudes mas recientes</h5>

       </div>
   </div>
   <!-- /. ROW  -->
   <hr />

   <div class="row" >
    <div class="col-md-12">
        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-list-alt" aria-hidden="true"></i> Solicitudes
            </div>
            <div class="panel-body">
                <div class="table-responsive" style="height: 600px;">
                
                <jsp:useBean id="RprestamoDao" class="model.PrestamoDao" scope="request">
                        </jsp:useBean>
                
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example" style="overflow:auto;">
                        <thead>
                            <tr>
                                <th>Fecha de solicitud</th>
                                <th>Nombre del elemento</th>
                                <th>Fecha de creacion</th>
                                <th>Estado</th>
                                <th>Opciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        
                        
                        <c:set var="val" scope="session" value="${sessionScope.userName}"></c:set>
                        
                        <c:if  test="${RprestamoDao.list().size()==0}">
                        <tr >
                        <td>No Ha Solicitado Elementos</td>
                        <td>No Ha Solicitado Elementos</td>
                        <td>No Ha Solicitado Elementos</td>
                        <td>No Ha Solicitado Elementos</td>
                        <td>No Ha Solicitado Elementos</td>
                        </tr>
                        </c:if>
                        
                        
                        <c:forEach var="prestamo" items="${RprestamoDao.list()}">
                        
                        
                        <c:if test="${prestamo.getPersona().getCodigo()==val}">
              	
				<tr class="odd gradeA" id="${prestamo.getIdPrestamo()}-eliminar">
				<td><c:out value="${prestamo.getFechaInicio().getYear()}/${prestamo.getFechaInicio().getMonth()}/${prestamo.getFechaInicio().getDate()}-Hora: ${prestamo.getFechaInicio().getHours()}"/></td>
				<td><c:out value="${prestamo.getElementodeportivo().getNombre()}"/></td>
				<td><c:out value="${prestamo.getFechaSolicitud().getYear()}/${prestamo.getFechaSolicitud().getMonth()}/${prestamo.getFechaSolicitud().getDate()}"/></td>
				<td><c:out value="${prestamo.getEstado()}"/></td>
				
				<c:if test="${prestamo.getEstado()=='Solicitado'}">
				
				<td><input type="hidden" name="anular_solicitud" value="f2" style="display:none;">
                                    <button name="prestamo.getIdPrestamo()" class="btn btn-danger btn-xs" type="submit" id="anular" value="${prestamo.getIdPrestamo()}" ><i class="fa fa-times"></i> Anular</button>
                                    <label id="anular_alt" style="display: none;">
                                        <i class="fa fa-spinner fa-spin"></i> Anulando
                                    </label></td>
				</c:if>
				
				<c:if test="${prestamo.getEstado()!='Solicitado'}">
				<td><p class="label label-default">Sin opciones disponibles</p></td>
				</c:if>
				</tr>
				
				
				
				
				
				</c:if>
				<c:if test="${prestamo==null}"></c:if>
				</c:forEach>
                        
                        
                            

                 </tbody>
             </table>
         </div>

     </div>
 </div>
 <!--End Advanced Tables -->
</div>
</div>
<!-- /. ROW  -->
<div class="row">
   <!-- /. PAGE INNER  -->
</div>

<!-- /. PAGE WRAPPER  -->
</div>



