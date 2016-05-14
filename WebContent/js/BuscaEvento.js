 function carregarItens(){
    	
    	var itens = "", url = "http://localhost:8080/snapcity/rest/usuarios/evento/{id}";
    	
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
    				    itens += "<td>" + retorno[i].longitude + "</td>";
    				    itens += "<td>" + retorno[i].latitude + "</td>";
    				    itens += "<td>" + retorno[i].descricao + "</td>";
    				    itens += "<td>" + retorno[i].datahora + "</td>";
 //    				    itens += "<td>" + retorno[i].Empresa + "</td>";
//    				    itens += "<td>" + retorno[i].Setor + "</td>";
    				    itens += "</tr>";
    			    }
    			    //Preencher a Tabela
    			    $("#minhaTabela tbody").html(itens);
    			    
    			    //Limpar Status de Carregando
    			    $("h2").html("Carregado");
    		    }
    	    }
    	    
        });
        
    }