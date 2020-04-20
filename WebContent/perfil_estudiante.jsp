<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>UFPS P.D</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

     <!-- FONTAWESOME STYLES-->
  
        <!-- CUSTOM STYLES-->
    <link href="css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
	<script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
</head>
<body>


<c:set var="alerta" scope="application" value="${applicationScope.persona}"/> 	
      	
      	
    <c:if test="${alerta==null}">
 	<c:redirect url="index.jsp"></c:redirect>
	</c:if>  	
	<c:if test="${fn:indexOf(alerta, 'administrador')!=-1}"> 
 	<c:redirect url="perfil_admin.jsp"></c:redirect>
	</c:if>
	<c:if test="${fn:indexOf(alerta, 'opcion')!=-1}"> 
 	<c:redirect url="opcion_home.jsp"></c:redirect>
	</c:if>

   
        <!-- <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="background-color:#202020;margin-bottom: 0">
            <div class="navbar-header" style="background-color: #202020">
                <a class="navbar-brand" href="login.html">UFPS</a> 
            </div> 
            
            </nav>-->
            
            <div id="main-header_a">
          <a id="logo-header" href="#">
            <center><span class="site-name">UFPS</span></center>
            <span class="site-desc">Ingenieria de Sistemas / Programacion Web</span>
        </a> <!-- / #logo-header -->
   </div>
  
  
           
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="https://dl.dropboxusercontent.com/s/t709elljk46irgj/perfil.png?dl=0" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a class="sel" href="#" data-selection="datos_estudiante"><img id="iconos" src="https://dl.dropboxusercontent.com/s/t709elljk46irgj/perfil.png?dl=0"></i>Perfil</a>
                    </li>
					          <li  >
                        <a  class="sel" href="#" data-selection="solicitud_estudiante"><img id="iconos" src="https://dl.dropboxusercontent.com/s/q8ocy2os5vguu6l/solicitud.png?dl=0" > Solicitud </a>
                       
                    </li>	
                      <li  >
                        <a class="sel" href="#" data-selection="registros_estudiante"><i class="fa fa-table fa-3x"></i> Registro de Solicitudes</a>
                    </li> 

                    <li  >
                        <a class="sel" href="#" data-selection="deuda_estudiante"><i class="fa fa-list-ol fa-3x" aria-hidden="true"></i> Registro de deudas</a>
                    </li> 
					
                    <li>
                         
                       <a onclick="document.formulario1.submit()"><i class="fa fa-power-off fa-3x" ></i> Salir</a>
                      
                    </li> 
                     
                    <footer>UFPS Prestamos Deportivos - 2018 Universidad Francisco de Paula Santander</footer>                  
                        
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->

        <div id="page-wrapper" >
                     <!-- /. PAGE INNER  -->
            </div>

         <!-- /. PAGE WRAPPER  -->
        </div>
  <footer id="footer">
  
  <center>
     
    <p>

      &copy; UFPS Prestamos Deportivos - Universidad Francisco de Paula Santander<br>

      2018
    </p>

  </center>
    <hr class="hr_f"> 
  </footer>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="js/custom.js"></script>
    <script src="https://use.fontawesome.com/4a0c8877dc.js"></script>
    <script type="text/javascript" src="js/funct.js">
    </script>
    
  <script>
      $( window ).on( "load", function() {
         $("#page-wrapper").load("datos_estudiante.jsp");    
    });        
  </script>
 
 <form action="FinalizarController" method="post" name="formulario1"></form>
 
 
 
 
</body>
</html>
