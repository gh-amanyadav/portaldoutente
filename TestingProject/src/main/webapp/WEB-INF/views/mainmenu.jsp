<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt">

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta charset="utf-8">

    <title>Portal do Utente</title>

    <!-- Bootstrap Core CSS -->
    <link href=<c:url value="/resources/css/bootstrap.min.css" ></c:url> rel="stylesheet">

    <!-- Custom CSS -->
    <link href=<c:url value="/resources/css/main.css" ></c:url> rel="stylesheet">
    
    	<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,100' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>


<body background=<c:url value="/resources/gfx/Final2.png"/> />

<div id="guardiao"></div>
<div class= "container">   
        
            <div class="col-lg-12"> 
                <div class= "rowMajor">
                	<div id="divisento"></div>
						<div class="col-md-6"><a id = "PortalDoUtente" href="/" style="text-decoration:none; color: white; font-weight:100">Portal do Utente</a></div>
						<div class="col-md-6" id="entrar" style="text-align: right;">${username}</div>
				</div>
            
            </div>
		<nav>
          <ul>
            <li id="login">
              <a id="login-trigger" href="#">
                Opções <span>▼</span>
              </a>
              <div id="login-content">
                <a button href= "/perfil/dados" id = "aaa">Ver Perfil</button></a><br>
                <a button href= "/perfil/verPrivacidades" id = "aaa">Privacidade das Medições</button></a><br>
                <a button href= "/logout" id ="aaa">Logout</button></a>
              </div>                      
            </li>
          </ul>
        </nav>
	<div class="col-lg-12" id="caixaGig">  <!--  -->
	
		<div id="wrapper">

			<!-- Sidebar -->
						<div id="sidebar-wrapper">
				<ul class="barra">
						
					<li id="consulta">
						<a href="/calendario/view">Marcação de Consultas</a>
					</li>
					<li id="medicacao2">
						<a href="/medicacao/view">Registar Medicação</a>
					</li>
					<li id="medicao">
						<a href="/medicoes">Medições</a>
					</li>
					<li id="isencao">
						<a href="/isencao">Pedido de Isenção</a>
					</li>
					<li id="upload">
						<a href="/upload">Submeter Exames</a>
					</li>
				</ul>
			</div>
			<!-- /#sidebar-wrapper -->
		
		
				<!-- Page Content -->
				<div id="page-content-wrapper">
					<div class="container-fluid">
							<div class="col-lg-12">
								<h1>Bem vindo ao Portal Do Utente</h1>
								<p id="mudartexto">Escolha uma opção para começar</p>
							</div>
					</div>
				</div>
				<!-- /#page-content-wrapper -->

				
		</div>
    </div>
    <!-- /#wrapper -->

   <!-- jQuery -->
   <!-- <script src="js/jquery.js">  </script> -->
    <script src='<c:url value="/resources/js/jquery.js"></c:url>'></script>

    <!-- Bootstrap Core JavaScript -->
    <!-- <script src="js/bootstrap.min.js"></script> -->
    <script src='<c:url value="/resources/js/bootstrap.min.js"></c:url>'></script>

    <!-- Menu Toggle Script -->
    <script>
    $(document).ready(function(){
    	var textos={'consulta':'Aqui marcam-se, desmarcam-se e consultam-se as consultas',
    				'medicacao2':'Aqui regista-se e consulta-se a medicação e pede-se novas receitas',
    				'medicao':'Aqui registam-se e consultam-se as medições',
    				'cirurgia':'Aqui marcam-se e consultam-se as cirurgias',
    				'isencao':'Aqui pede-se a isenção de taxas moderadoras',
    				'upload':'Aqui submetem-se e consultam-se exames médicos'};
    	
    	$( "li" )
    	  .mouseenter(function() {
    		  var showID = $(this).attr("ID");
    	    $("#mudartexto").text(textos[$(this).attr("id")]);
    	  })
    	  
		  $('#login-trigger').click(function(){
		    $(this).next('#login-content').slideToggle();
		    $(this).toggleClass('active');          
		    
		    if ($(this).hasClass('active')) $(this).find('span').html('&#x25B2;')
		      else $(this).find('span').html('&#x25BC;')
		    })
	});
    </script>
    <script>
    
    path="https://" + window.location.host + "/";
	warning=null;
	pathWindow = window.location.href;
	lastThing = pathWindow.split("/")[3];
	if (lastThing=="isento") {
		$("#divisento").append('<div class="alert alert-danger fade in" role="alert" style="margin-top: 3%;">Isencao a ser Processada</div>');
	}
	
	paramOne =  '<%=(String) request.getAttribute("sessionMode")%>';
	console.log(paramOne);
	if ( paramOne == "guardian") {
		$("#guardiao").append('<div class="alert alert-danger fade in" role="alert" style="margin-top: 3%;">Modo Guardiao!</div>');
		
	}
	
    </script>

</body>



</html>
