<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

     <!-- Bootstrap Core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/css/main.css" rel="stylesheet">
    
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

</head>


<body background="/resources/gfx/Final2.png"/>


<div class= "container">    <!-- ROW -->
        <div class= "rowMajor">
            <div class="col-md-11">Portal do Utente</div>
        </div>
</div>


<div  class="exame">
		<p id="texto2">Consulte abaixo os seus Exames MÃ©dicos</p>

        <table id="tabela_exames">

            <tr id = "texto_tab">
                <td>NOME</td>
                <td>DOSE</td> 
                <td>INDICAÇÕES</td>
                <td>Apagar</td>
            </tr>

            <tr id = "texto_tab">
                <td>NOME</td>
                <td>DOSE</td> 
                <td>INDICAÇÕES</td> 
                <td><button id= "botao_tab">Apagar</button></td>
            </tr>

        <tr id ="texto_tab">
            <td>NOME</td>
            <td>DOSE</td> 
            <td>INCICAÇÕES</td> 
            <td><button id="botao_tab">Apagar</button></td>
        </tr>

        </table>
      
</div>



</body>



</html>