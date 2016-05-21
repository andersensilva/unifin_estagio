 function carregarItensBusca1(){
	 	
	 	var id = localStorage.getItem('id')
    	var itens = "", url = "http://localhost:2020/snapcity/rest/usuarios/"+id+"/evento";
    	
    	//Capturar Dados Usando Método AJAX do jQuery
        $.ajax({
    	    url: url,
    	    cache: false,
    	    dataType: "json",
    	    beforeSend: function() {
    		    $("h2").html("Carregando..."); //Carregando
    	    },
    	    error: function() {
    		    $("h2").html("Há algum problema com a fonte de dados");
    	    },
    	    success: function(retorno) {
    		    if(retorno[0].erro){
    			    $("h2").html(retorno[0].erro);
    		    }
    		    else{
    			    //Laço para criar linhas da tabela
    			    for(var i = 0; i<retorno.length; i++){
    				    itens += "<tr>";
    				    itens += "<td>" + retorno[i].id + "</td>";
    				    itens += '<td><img height="100" width="100" SRC="'+retorno[i].foto+'"></td>'
    				    itens += "<td>" + retorno[i].longitude + "</td>";
    				    itens += "<td>" + retorno[i].latitude + "</td>";
    				    itens += "<td>" + retorno[i].descricao + "</td>";
    				    itens += "<td>" + retorno[i].datacriacao + "</td>";
 //    				    itens += "<td>" + retorno[i].Empresa + "</td>";
//    				    itens += "<td>" + retorno[i].Setor + "</td>";
    				    itens += "</tr>";
    			    }
    			    //Preencher a Tabela
    			    $("#minhaTabelaBusca1 tbody").html(itens);
    			    
    			    //Limpar Status de Carregando
    			    $("h2").html("Carregado");
    		    }
    	    }
    	    
        });
        
    } 



function carregarItensBusca(){
	 	var mostra = new Object();
	 	mostra.id = $('#id5').val();
    	var itens = "", url = "http://localhost:2020/snapcity/rest/usuarios/"+mostra.id+"/evento";
    	
    	//Capturar Dados Usando Método AJAX do jQuery
        $.ajax({
    	    url: url,
    	    cache: false,
    	    dataType: "json",
    	    beforeSend: function() {
    		    $("h2").html("Carregando..."); //Carregando
    	    },
    	    error: function() {
    		    $("h2").html("Há algum problema com a fonte de dados");
    	    },
    	    success: function(retorno) {
    		    if(retorno[0].erro){
    			    $("h2").html(retorno[0].erro);
    		    }
    		    else{
    			    //Laço para criar linhas da tabela
    			    for(var i = 0; i<retorno.length; i++){
    				    itens += "<tr>";
    				    itens += "<td>" + retorno[i].id + "</td>";
    				    itens += '<td><img height="100" width="100" SRC="'+retorno[i].foto+'"></td>'
    				    itens += "<td>" + retorno[i].longitude + "</td>";
    				    itens += "<td>" + retorno[i].latitude + "</td>";
    				    itens += "<td>" + retorno[i].descricao + "</td>";
    				    itens += "<td>" + retorno[i].datacriacao + "</td>";
 //    				    itens += "<td>" + retorno[i].Empresa + "</td>";
//    				    itens += "<td>" + retorno[i].Setor + "</td>";
    				    itens += "</tr>";
    			    }
    			    //Preencher a Tabela
    			    $("#minhaTabelaBusca tbody").html(itens);
    			    
    			    //Limpar Status de Carregando
    			    $("h2").html("Carregado");
    		    }
    	    }
    	    
        });
        
    }