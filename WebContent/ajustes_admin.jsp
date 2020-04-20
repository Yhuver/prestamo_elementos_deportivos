<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>


<script type="text/javascript">

$(document).ready(function(){
	 $('#lista3').change(function(event){
	     var fullname = $('#lista3').val();
	     $.ajax({
	         type:'POST',
	         data: {fullname:fullname},
	         url:'CantidadElementosController',
	         success: function(result){
	             $('#cantidad').html(result);
	            }

	        });
	    }); 
	 });


$(document).ready(function(){
	 $('#agregar').click(function(){
	     var nombre = $('#nombre').val();
	     var descripcion= $('#descripcion').val();
	     $.ajax({
	         type:'POST',
	         data: {nombre:nombre, descripcion:descripcion},
	         url:'AgregarElementoController',
	         success: function(result){
	        	 $('#nombre').val('');
	        	 $('#descripcion').val('');
	             $('#aler').html(result);
	            }

	        });
	    }); 
	 });

$(document).ready(function(){
	 $('#modificarcantidad').click(function(){
	     var id = $('#lista3').val();
	     var elem= $('#cant').val();
	     $.ajax({
	         type:'POST',
	         data: {id:id, elem:elem},
	         url:'ModificarCantidadElementosController',
	         success: function(result){
	        	 $('#cant').val('');
	        	 $('#lista3').val('0');
	             $('#aler2').html(result);
	            }

	        });
	    }); 
	 });

</script>



<div id="page-inner">
    <div class="row">
        <div class="col-md-12">
         <h2>AJUSTES</h2> 
         <br/>   
         <h5><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Modifica los ajustes de prestamos</h5>

     </div>
 </div>
 <!-- /. ROW  -->
 <hr />
 <br/>




 <div >
 
 <jsp:useBean id="listaDepor" class="model.DeporteDao">
                    </jsp:useBean>
                    
                    
                    <jsp:useBean id="listaElementos" class="model.ElementodeportivoDao">
                    </jsp:useBean>
 
 
 
    <div class="row">
     <center><div class="media">       

        <div class="col-xs-12 col-sm-6">

            <label for="inputState"><i class="fa fa-clock-o" aria-hidden="true"></i> Digite la hora de reseteo de fechas (hh:mm  am/pm): </label></br></br>
            <input id="datebox" type="time" name="hora" min="03:00"
            max="23:00" step="3600"> &nbsp; <button type="submit" class="btn btn-success"><i class="fa fa-floppy-o" aria-hidden="true"></i></button></><br/><br/>
                  <hr />
        </div>
        <div class="col-xs-12 col-sm-6">
         <label for="inputState"><i class="fa fa-calendar" aria-hidden="true"></i> Digite con cuantos dias de antelacion se puede pedir un elemento</label></br></br>
         <input type="number"  name="dias" min="1" max="5" > &nbsp; <button type="submit" class="btn btn-success"><i class="fa fa-floppy-o" aria-hidden="true"></i></button></><br/><br/>
         <hr />
        </div>
 </center>

</div>
<div class="panel panel-default">
<div id="aler">
                   
                   </div>
    <div class="panel-heading">
        <i class="fa fa-futbol-o" aria-hidden="true"></i> Agregue un nuevo elemento deportivo
    </div>
    <div class="panel-body">
        <div class="form-responsive">
              
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <label for="nombre">Nombre</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="" value="">                   
                    <!-- <div class="invalid-feedback">
                      El nombre es requerido.
                    </div>  -->

                  </div>
                  <div class="col-md-6 mb-3">
                    <label for="apellido">Descripcion</label>
                    <input type="text" class="form-control" id="descripcion" name="descripcion" placeholder="" value="">
                    
                  </div>
                </div>
                
                
                
                
    
                <div class="mb-3">
                    <br>
                 <label for="inputState">Ahora Oprima En El Boton Agregar, Para Registrar El Elemento: </label></br></br>
                       <select id="listaD" class="form-control">
                        <option selected>Sin Opciones Disponibles</option>
                         
                      </select>
                </div>
    
                <hr>
              <center>
                  <button class="btn btn-primary" id="agregar">Agregar</button>
              </center>
                
              
          </div>
    </div>

</div>
<div id="aler2">
                   
                   </div>
    <div>
        <hr>
        <div class="row">
      <center>
          <h5><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Modifica la cantidad de elementos</h5><br>
      </center>
         
        <div class="col-xs-12 col-sm-6">
            <label for="inputState">Selecciona Los Datos Requeridos: </label></br></br>
                       <select id="lista2" class="form-control">
                        <option selected>Sin Opciones Disponibles</option>
                        
                        
                      </select><br>
        </div>
       
                 <div class="col-xs-12 col-sm-6">

                          <label for="inputState">Seleccione el elemento deportivo: </label></br></br>
                       <select id="lista3" class="form-control">
                        <option selected value="0">Elija El Elemento</option>
                        <c:forEach var="elementos" items="${listaElementos.list()}">
                        <option><c:out value="${elementos.getIdElemento()}-${elementos.getNombre()}"/></option>
                        </c:forEach>
                      </select>
                 </div>
    

    </div>
     <div>
        <br>
         <center>
             <div   id="cantidad" class="label label-primary" style="font-size: 20px;">Elije El Elemento Deportivo</div>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <label for="inputState"><i class="fa fa-sort" aria-hidden="true"></i> Digite la cantidad de elementos a insertar</label>&nbsp;&nbsp;
         <input type="number" id="cant" name="dias" min="1" max="10000000" > &nbsp; <button id="modificarcantidad" class="btn btn-success"><i class="fa fa-floppy-o" aria-hidden="true"></i></button></><br/>
         </center>
        
        
     </div>
</div>
<!-- Campo de entrada de hora -->




<hr>

<!-- <div class="panel panel-default">
    <div class="panel-heading">
        <i class="fa fa-list-alt" aria-hidden="true"></i> Registro de ajustes (Se muestra todos ajustes que se han realizado)
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                <thead>
                    <tr>
                        <th>ajuste</th>
                        <th>Estado anterior</th>
                        <th>Estado actualizado</th>
                        <th>codigo del administrador</th>

                    </tr>
                </thead>
                <tbody>
                    <tr class="odd gradeX">


                    </tr>
                    <tr class="even gradeC">



                    </tr>
                    <tr class="odd gradeA">


                    </tr>
                    <tr class="even gradeA">

                    </tr>
                    <tr class="odd gradeA">

                    </tr>


                </tbody>
            </table>
        </div>

    </div>
</div> -->


</div>
