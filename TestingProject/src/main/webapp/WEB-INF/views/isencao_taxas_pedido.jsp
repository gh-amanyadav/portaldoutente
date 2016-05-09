<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        
<!DOCTYPE html>
<html lang="pt">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Portal do Utente</title>

    <!-- Bootstrap Core CSS -->
    <link href=<c:url value="/resources/css/bootstrap.min.css" ></c:url> rel="stylesheet">

    <!-- Custom CSS -->
    <link href=<c:url value="/resources/css/main.css" ></c:url> rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>


<body background=<c:url value="/resources/gfx/Final2.png"/> />

<div class= "container">   
        
            <div class="col-lg-12"> 
                <div class= "rowMajor">
					<div class="col-md-11">Portal do Utente</div>
					<div class="col-md-1" id="entrar">Entrar</div>
				</div>
            
            </div>
			
	<div class="col-lg-12" id="caixaGig">  <!--  -->
	
		<div id="wrapper">

			<!-- Sidebar -->
			<div id="sidebar-wrapper">
				<ul class="barra">
						
					<li>
						<a href="#mar">Marcação de Consultas</a>
					</li>
					<li>
						<a href="#">Marcações Confirmadas</a>
					</li>
					<li>
						<a href="#">Renovar Receita</a>
					</li>
					<li>
						<a href="#">Medições</a>
					</li>
					<li>
						<a href="#">Agregado Familiar</a>
					</li>
					<li>
						<a href="#">Pedido de Isenção</a>
					</li>
				</ul>
			</div>
			<!-- /#sidebar-wrapper -->
		
		
				<!-- Page Content -->
				<div id="page-content-wrapper">
					<div class="container-fluid">
						
							<div class="col-lg-12">
							   <h1>Pedido de Isenção de Taxas Moderadoras</h1>
								<div class="row" id = "caixaReceita">
									
		
										<p>Introduza o seu número de Identificação de Segurança Social:</p> <br><br>
										
										<form action="/verificarIsencao" method="post" >
										<input id="codigo" type="text" name="segsoc">
										<input id = "botao_conf" type="submit"/>
										</form>
										
								
							</div>
								<!-- Link: https://servicos.min-saude.pt/utente/Info/Portal/Features
								Consulte a legislação em vigor:
								
								Procede à primeira alteração ao Decreto-Lei n.º 113/2011, de 29 de novembro, que regula o acesso às prestações do Serviço Nacional de Saúde por parte dos utentes no que respeita ao regime das taxas moderadoras e à aplicação de regimes especiais de benefícios (desempregado)
   
								Estabelece os critérios de verificação da condição de insuficiência económica dos utentes para efeitos de isenção de taxas moderadoras e de outros encargos de que dependa o acesso às prestações de saúde do Serviço Nacional de Saúde (SNS)
								
								Regula o acesso às prestações do Serviço Nacional de Saúde por parte dos utentes no que respeita ao regime das taxas moderadoras e à aplicação de regimes especiais de benefícios

								-->
							</div>
					
					</div>
				</div>
				<!-- /#page-content-wrapper -->

				
		</div>
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>

</body>



</html>
