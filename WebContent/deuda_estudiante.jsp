<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="page-inner">
    <div class="row">
        <div class="col-md-12">
           <h2>Registro de Deudas</h2>
           <br/>   
           <h5> <i class="fa fa-pencil" aria-hidden="true"></i> Consulta tus deudas</h5>

       </div>
   </div>
   <!-- /. ROW  -->
   <hr />

   <div class="row" >
    <div class="col-md-12">
        <!-- Advanced Tables -->
        <div class="panel panel-default">
            <div class="panel-heading">
                <i class="fa fa-list-alt" aria-hidden="true"></i> Deudas
            </div>
            <div class="panel-body">
                <div class="table-responsive" style="height: 600px;">
                
                <jsp:useBean id="RdeudaDao" class="model.DeudaDao" scope="request">
                        </jsp:useBean>
                
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr>
                                <th>Fecha de la deuda</th>
                                <th>Nombre del elemento</th>
                                <th>Tipo de deuda</th>
                                <th>Estado</th>
                            </tr>
                        </thead>
                        <tbody>

<c:set var="valu" scope="session" value="${sessionScope.userName}"></c:set>
<c:set var="deuda" value="${RdeudaDao.list()}"></c:set>
                        <c:if  test="${deuda.size()==0}">
                        <tr >
                        <td>No Existen Deudas</td>
                        <td>No Existen Deudas</td>
                        <td>No Existen Deudas</td>
                        <td>No Existen Deudas</td>
                        
                        </tr>
                        </c:if>
								<c:if test="${deuda.size()!=0}">
									<c:forEach var="deu" items="${RdeudaDao.list()}">
									<c:if test="${deu.getPrestamo().getPersona().getCodigo()==valu}">
										<tr class="even gradeC">
											<td><c:out
													value="${deu.getFecha().getYear()}/${deu.getFecha().getMonth()}/${deu.getFecha().getDate()}" /></td>
											<td><c:out
													value="${deu.getPrestamo().getElementodeportivo().getNombre()}" /></td>
											<td><c:out value="${deu.getDescripcion()}" /></td>
											<c:if test="${deu.getEstado()==1}">
												<td>Deuda Activa</td>
											</c:if>
											<c:if test="${deu.getEstado()==0}">

												<td>Deuda saldada</td>
											</c:if>
										</tr>
										</c:if>
									</c:forEach>
								</c:if>


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
</div>


