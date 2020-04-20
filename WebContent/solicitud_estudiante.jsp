
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
<script type="text/javascript">



 $(document).ready(function(){
 $('#listaD1').change(function(event){
     var fullname = $('#listaD1').val();
     $.ajax({
         type:'POST',
         data: {fullname:fullname},
         url:'DiasSolicitudController',
         success: function(result){
             $('#listaD2').html(result);
            }

        });
    }); 
 });
 
 $(document).ready(function(){
	 $('#listaD2').change(function(event){
	     var id = $('#listaD1').val();
	     var fecha= $('#listaD2').val();
	     $.ajax({
	         type:'POST',
	         data: {id:id, fecha:fecha},
	         url:'HorasSolicitudController',
	         success: function(result){
	             $('#listaD3').html(result);
	            }

	        });
	    }); 
	 });
 
 $(document).ready(function(){
	 $('#boton').click(function(){
	     var id1 = $('#listaD1').val();
	     var fecha1= $('#listaD2').val();
	     var hora=$('#listaD3').val();
	     $.ajax({
	         type:'POST',
	         data: {id1:id1, fecha1:fecha1, hora:hora},
	         url:'SolicitarElementoController',
	         success: function(result){
	             $('#aler').html(result);
	             $('#listaD1').val('defecto');
	             $('#listaD2').html('<option selected>Sin Opciones</option>');
	             $('#listaD3').html('<option selected>Sin Opciones</option>');
	            }

	        });
	    }); 
	 });
 
</script> 




            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                      <h2> <i class="fa fa-hand-peace-o" aria-hidden="true"></i> SOLICITUD</h2>
                     <br/> 
                        <h5><i class="fa fa-futbol-o" aria-hidden="true"></i> Formulario para solicitudes de elementos deportivos</h5> </div>   

                </div>
                  <hr/>
                  <br/>

                <center><div class="media">
                  
                  
                    <div >
                    
                    <jsp:useBean id="listaelem" class="model.ElementodeportivoDao">
                    </jsp:useBean>
						
						
						
                        <label for="inputState">Seleccione el elemento deportivo: </label></br></br>
                       <select id="listaD1" class="form-control">
                       <option selected value="defecto">No Ha Seleccionado Ninguna Opcion</option>
                       
                        <c:forEach var="lista1" items="${listaelem.list()}">
                        <option ><c:out value="${lista1.getIdElemento()}-${lista1.getNombre()}"/></option>
                        </c:forEach>
                        
                      </select></br>


                      <label for="inputState"><i class="fa fa-calendar" aria-hidden="true"></i> Solicitar Elemento para el día:</label></br></br>
                      <select id="listaD2" class="form-control">
                        <option selected>Sin Opciones</option>
                      </select></br>

                   
                      <!-- Campo de entrada de fecha -->
                    


                      <!-- Campo de entrada de hora -->
                      <label for="inputState"><i class="fa fa-clock-o" aria-hidden="true"></i> Estas son las horas en las que el elemento esta disponible:</label></br></br>
                      <select id="listaD3" class="form-control">
                        <option selected>Sin Opciones</option>
                        
                        
                      </select></br>
                      

                       <button id="boton" class="btn btn-primary">Solicitar Prestamo</button></>

                    </div>
                    </br></br>
                    
                   <div id="aler">
                   
                   </div>
                    

              </center>
              
              
              
            
                </div>
                
                
            
    </div>
         