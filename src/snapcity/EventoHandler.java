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

// TODO java doc

@Path("/evento")
public class EventoHandler   {
	
	// TODO remover atributos de classe e coloca-los nos metodos
	
	DaoEvento daoEventos = new DaoEvento();
	Evento modelEventos = new Evento();
	Usuario usuario = new Usuario();
	
	/**
	 * Retorna todos os eventos em formato json
	 * @return
	 */
	@GET
	@Produces(MediaType.APPLICATION_JSON)
	public Response getEvento() {
		
		// TODO getEventos
		
		List<Evento> evento = daoEventos.mostrarEvento();
		
		
		JSONArray json = new JSONArray();
		
			for (Evento e : evento) {
				 json.put(DaoEvento.toJson(e));
			}
			
		
			
		return Response.ok().entity(json.toString()).build();
		
		
	}
	
	/**
	 * Grava eventos recebendo dados em formato json
	 * @param jsonString
	 * @return
	 */
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public Response postEvento(String jsonString) {
		
		// TODO renomear para insereEvento
		
		// TODO remover system e renomear jsonString para evento
		
		System.err.println(jsonString);
		Evento evento = daoEventos.fromJson(jsonString);
		 daoEventos.insereEvento(evento);
		 // TODO remover entity
		return Response.ok().entity("Cadastro Efetuado com Sucesso!").build();
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
		// TODO java doc
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
		System.out.println(id);
		daoEventos.excluiEvento(id);
		// TODO entity remover
		return Response.ok().entity("Evento de numero " +id+ " foi removido").build();
    }
	
	
	/**
	 * Atualiza Evento
	 * @param jsonString
	 * @return
	 */
	@PUT
	@Consumes(MediaType.APPLICATION_JSON)
	public Response putUsuario(String jsonString){
		// TODO renomear para atualizaEvento
		Evento evento = daoEventos.fromJson(jsonString);
		daoEventos.atualizaEvento(evento);
		return Response.ok().build();
	}
	
	@POST
    @Path("/delete")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response excluievento(String jsonString) {
		DaoUsuario dao = new DaoUsuario();
		Usuario usuario = new Usuario();
		JSONObject obj = new JSONObject(jsonString);
		Integer id = obj.getInt("id");
		usuario.setId(id);;
		System.out.println(usuario);
		System.out.println(id);
        dao.excluiUsuario(id);
        return Response.ok().build();
    }

}