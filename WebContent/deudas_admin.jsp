<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        
<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	 $('button').click(function(event){
	     var id = event.target.value;
	     
	     $.ajax({
	         type:'POST',
	         data: {id:id},
	         url:'EliminarDeuda',
	         success: function(result){
	             /*  $('#'+result+'-eliminar').remove(); */
	              $("#page-wrapper").load("deudas_admin.jsp");  
	              alert("Deuda Eliminada");
	            }

	        });
	    }); 
	 });
 
 </script> 

<div id="page-inner" >
    <div class="row">
        <div class="col-md-12">
           <h2>Registro de Deudas</h2>
           <br/> 
            
           <h5> <i class="fa fa-pencil" aria-hidden="true"></i> Consulta el registro de deudas</h5>

       </div>
   </div>
   <!-- /. ROW  -->
   <hr />

   <div class="row" >
    <div class="col-md-12">
    
    <div class="input-group"> <span class="input-group-addon">Buscar</span>
        <input id="filtrar" type="text" class="form-control" placeholder="Ingresa El Codigo A Buscar">
      </div>
      
      <br>
    
        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-list-alt" aria-hidden="true"></i> Deudas
            </div>
            <div class="panel-body">
                <div class="table-responsive" style="height: 600px;">
                <jsp:useBean id="deudasDao" class="model.DeudaDao" scope="request">
                        </jsp:useBean>
                
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example" >
                        <thead>
                            <tr>
                                <th>Fecha de la deuda</th>
                                <th>Codigo</th>
                                <th>Nombre del elemento</th>
                                <th>Tipo de deuda</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        
                        
                        <tbody>
                        
                        <c:if  test="${deudasDao.list().size()==0}">
                        <tr >
                        <td>No Ha Solicitado Elementos</td>
                        <td>No Ha Solicitado Elementos</td>
                        <td>No Ha Solicitado Elementos</td>
                        <td>No Ha Solicitado Elementos</td>
                        <td>No Ha Solicitado Elementos</td>
                        </tr>
                        </c:if>
                        
                        <c:forEach var="deuda" items="${deudasDao.list()}">
                         
                        
                        
                            <tr class="odd gradeX">
                                <td><c:out value="${deuda.getFecha().getYear()}/${deuda.getFecha().getMonth()}/${deuda.getFecha().getDate()} ---- Hora: ${deuda.getFecha().getHours()}:${deuda.getFecha().getMinutes() }"/></td>
                                <td><c:out value="${deuda.getPrestamo().getPersona().getCodigo()}"/></td>
                                <td><c:out value="${deuda.getPrestamo().getElementodeportivo().getNombre()}"/></td>
                                <td><c:out value="${deuda.getDescripcion()}"/></td>
                                <td><button name="deuda" class="btn btn-primary" type="submit" id="Saldar" value="${deuda.getIdDeuda()}"><i class="fa fa-dot-circle-o"></i> Saldar</button></td>

                            </tr>
                            
                       
                        
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


<!-- /. PAGE WRAPPER  -->

<script type="text/javascript">
         document.querySelector("#filtrar").onkeyup = function(){
             $TableFilter("#dataTables-example", this.value);
         }
         
         $TableFilter = function(id, value){
             var rows = document.querySelectorAll(id + ' tbody tr');
             
             for(var i = 0; i < rows.length; i++){
                 var showRow = false;
                 
                 var row = rows[i];
                 row.style.display = 'none';
                 
                 for(var x = 0; x < row.childElementCount; x++){
                     if(row.children[x].textContent.toLowerCase().indexOf(value.toLowerCase().trim()) > -1){
                         showRow = true;
                         break;
                     }
                 }
                 
                 if(showRow){
                     row.style.display = null;
                 }
             }
         }
          
        </script>

</div>


