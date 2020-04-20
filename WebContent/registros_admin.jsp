<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>        
<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	 $('button').click(function(event){
	     var cod = event.target.value;
	     var tipo = event.target.id;
	     $.ajax({
	         type:'POST',
	         data: {cod:cod, tipo:tipo},
	         url:'ValidarEstadoPrestamos',
	         success: function(result){
	             /*  $('#'+result+'-eliminar').remove(); */
	              $("#page-wrapper").load("registros_admin.jsp");  
	              alert("Tarea Exitosa");
	            }

	        });
	    }); 
	 });
 
 </script> 


            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>REGISTROS</h2> 
                     <br/>  
                        <h5><i class="fa fa-pencil" aria-hidden="true"></i> Consulta los registros de prestamos</h5>
                       
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
                            <i class="fa fa-list-alt" aria-hidden="true"></i> Registro de Prestamos
                        </div>
                        
                        
                        
                        <div class="panel-body">
                            <div class="table-responsive" style="height: 600px;">
                            
                            <jsp:useBean id="RprestamoDao" class="model.PrestamoDao" scope="request">
                        </jsp:useBean>
                        
                        
                            
                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                        <tr>
                                            <th>Fecha de Solicitud</th>
                                            <th>Hora de Solicitud</th>
                                            <th>Elemento deportivo</th>
                                            <th>codigo</th>
                                            <th>Estado</th>
                                        </tr>
                                    </thead>
                                    <tbody class="buscar">
                                    
                                    
                                    
                                    
                                    <c:if  test="${RprestamoDao.list().size()==0}">
                        <tr >
                        <td>No Se Han Solicitado Elementos</td>
                        <td>No Se Han Solicitado Elementos</td>
                        <td>No Se Han Solicitado Elementos</td>
                        <td>No Se Han Solicitado Elementos</td>
                        <td>No Se Han Solicitado Elementos</td>
                        </tr>
                        </c:if> 
                        
                        
                          <c:forEach var="prestamo" items="${RprestamoDao.list()}">
                          <c:if test="${prestamo.getEstado()=='Solicitado'}">
                          
                          <tr class="odd gradeX">
                                            <td><c:out value="${prestamo.getFechaInicio().getYear()}/${prestamo.getFechaInicio().getMonth()}/${prestamo.getFechaInicio().getDate()}"/></td>
                                            <td><c:out value="${prestamo.getFechaInicio().getHours()}"></c:out></td>
                                            <td><c:out value="${prestamo.getElementodeportivo().getNombre()}"/></td>
                                            <td><c:out value="${prestamo.getPersona().getCodigo()}"/></td>
                                            <td><button name="solicitado" class="btn btn-primary" type="submit" id="solicitado" value="${prestamo.getIdPrestamo()}"><i class="fa fa-dot-circle-o"></i> Solicitado</button></td>
                                       
                                        </tr>
                          
                          </c:if>
                          <c:if test="${prestamo.getEstado()=='Prestado'}">
                          
                          <tr class="odd gradeX">
                                            <td><c:out value="${prestamo.getFechaInicio().getYear()}/${prestamo.getFechaInicio().getMonth()}/${prestamo.getFechaInicio().getDate()}"/></td>
                                            <td><c:out value="${prestamo.getFechaInicio().getHours()}"></c:out></td>
                                            <td><c:out value="${prestamo.getElementodeportivo().getNombre()}"/></td>
                                            <td><c:out value="${prestamo.getPersona().getCodigo()}"/></td>
                                             <td><button name="prestado" class="btn btn-warning" type="submit" id="prestado" value="${prestamo.getIdPrestamo()}"><i class="fa fa-dot-circle-o"></i> Prestado</button></td>
                                       
                                        </tr>
                          
                          </c:if>
                          
                          </c:forEach>
                        
                                    
                                        <!-- <tr class="odd gradeX">
                                            <td>12/06/18</td>
                                            <td>2PM - 4PM</td>
                                            <td>Balon de futbol</td>
                                            <td>1151531</td>
                                            <td><button name="solicitar" class="btn btn-primary" type="submit" id="solicitado"><i class="fa fa-dot-circle-o"></i> Solicitado</button></td>
                                       
                                        </tr>
                                        <tr class="even gradeC">
                                            <td>12/06/18</td>
                                            <td>4PM - 6PM</td>
                                            <td>Balon de basquet</td>
                                            <td>1151533</td>
                                            <td><button name="prestado" class="btn btn-warning" type="submit" id="prestado"><i class="fa fa-dot-circle-o"></i> Prestado</button></td>

                                        
                                        </tr>
                                        <tr class="odd gradeA">
                                            <td>12/06/18</td>
                                             <td>10AM - 12PM</td>
                                            <td>Set de ajedrez</td>
                                            <td>1151534</td>
                                            <td><button name="entregado" class="btn btn-success" type="submit" id="entregado"><i class="fa fa-check"></i> Entregado</button></td>
                                           
                                        </tr>
                                        <tr class="even gradeA">
                                            <td>12/06/18</td>
                                             <td>8AM - 10AM</td>
                                            <td>Set de ajedrez</td>
                                            <td>1151530</td>
                                            <td><button name="no_entregado" class="btn btn-danger" type="submit" id="no_entregado"><i class="fa fa-times"></i> No Entregado</button></td>
                                           
                                        </tr>
                                        <tr class="odd gradeA">
                                            <td>12/06/18</td>
                                             <td>6PM - 8PM</td>
                                            <td>Set de ajedrez</td>
                                            <td>1151526</td>
                                            <td><button name="entregado" class="btn btn-success" type="submit" id="entregado"><i class="fa fa-check"></i> Entregado</button></td>
                                           
                                        </tr>
                                        <tr class="even gradeA">
                                           <td>04/06/18</td>
                                            <td>4PM - 6PM</td>
                                            <td>Set de ajedrez</td>
                                            <td>1151527</td>
                                            <td><button name="entregado" class="btn btn-success" type="submit" id="entregado"><i class="fa fa-check"></i> Entregado</button></td>
                                        </tr> -->
                                                                                                                                                            
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
  