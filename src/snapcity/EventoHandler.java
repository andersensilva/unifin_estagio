package snapcity;

import java.util.Iterator;
 import java.util.List;
 import java.io.*;
 
 import javax.servlet.http.HttpServlet;
 import javax.ws.rs.Consumes;
 import javax.ws.rs.DELETE;
 import javax.ws.rs.GET;
 import javax.ws.rs.POST;
 import javax.ws.rs.PUT;
 import javax.ws.rs.Path;
 import javax.ws.rs.PathParam;
 import javax.ws.rs.Produces;
 import javax.ws.rs.core.MediaType;
 import javax.ws.rs.core.Response;
 
 import org.json.JSONArray;
 import org.json.JSONObject;

import jdk.nashorn.internal.parser.JSONParser;
import snapcity.dao.DaoEvento;
 import snapcity.dao.DaoUsuario;
 import snapcity.model.Evento;
 import snapcity.model.Usuario;

 /**
  * Classe que trata o rest de evento
  * @author  Andersen Silva e Marcelo
  *
  */
@Path("/evento")
public class EventoHandler   {
	
	/**
	 * Retorna todos os eventos em formato json
	 * @return
	 */
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getEventos() {
		DaoEvento daoEventos = new DaoEvento();
		List<Evento> evento = daoEventos.buscaEventos();
		JSONArray json = new JSONArray();
			for (Evento e : evento) {
				 json.put(DaoEvento.toJson(e));
			}	
		return Response.ok().entity(json.toString()).build();	
	}
	
	/**
	 * Grava eventos recebendo dados em formato json
	 * @param evento
	 * @return
	 */
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public Response insereEvento(String evento) {
		DaoEvento daoEventos = new DaoEvento();
		Evento eventos = daoEventos.fromJson(evento);
		 daoEventos.insereEvento(eventos);
		return Response.ok().build();
		}
	
	
	/**
	 * Mostra usuário pesquisado por id
	 * @param id
	 * @return
	 */
	@GET
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response buscaEvento(@PathParam("id") int id) {
		DaoEvento daoEventos = new DaoEvento();
		Evento eventos = daoEventos.buscaEvento(id);
		JSONObject json = DaoEvento.toJson(eventos);
		return Response.ok().entity(json.toString()).build();		
	}
	
	
	/**
	 * Remove evento pelo id do evento
	 * @param id
	 * @return
	 */
	@DELETE
    @Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
    public Response delete(@PathParam("id") Integer id) {
		DaoEvento daoEventos = new DaoEvento();
		daoEventos.excluiEvento(id);
		return Response.ok().build();
    }
	
	
	/**
	 * Atualiza Evento
	 * @param jsonString
	 * @return
	 */
	@PUT
	@Consumes(MediaType.APPLICATION_JSON)
	public Response atualizaEvento(String jsonString){
		DaoEvento daoEventos = new DaoEvento();
		Evento evento = daoEventos.fromJson(jsonString);
		daoEventos.atualizaEvento(evento);
		return Response.ok().build();
	}
	
	
	/**
	 * Classe que recebe id do evento e exclui ele do banco de dados
	 * @param jsonString
	 * @return
	 */
	@POST
    @Path("/delete")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response excluievento(String jsonString) {
		DaoEvento daoEventos = new DaoEvento();
		Evento eventos = new Evento();
		JSONObject obj = new JSONObject(jsonString);
		Integer id = obj.getInt("id");
		eventos.setId(id);;
        daoEventos.excluiEvento(id);
        return Response.ok().build();
    }

}