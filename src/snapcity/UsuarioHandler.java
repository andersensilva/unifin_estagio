package snapcity;
import java.net.URI;
import java.util.List;

import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import org.json.JSONArray;
import org.json.JSONObject;

import com.sun.research.ws.wadl.Request;

import snapcity.dao.DaoEvento;
import snapcity.dao.DaoUsuario;
import snapcity.model.Evento;
import snapcity.model.Usuario;

/**
 * Classe que trata o rest
 * @author  Andersen Silva e Marcelo
 *
 */
@Path("/usuarios")
public class UsuarioHandler {
	
	@GET
	@Consumes(MediaType.APPLICATION_JSON)
	public Response getUsuarios() {
		DaoUsuario dao = new DaoUsuario();
		List<Usuario> usuarios = dao.mostrarUsuarios();
		JSONArray array = new JSONArray();
		for (Usuario user : usuarios)
			array.put(DaoUsuario.toJson(user));
		
		return Response.ok().entity(array.toString()).build();
				
	}
	
	
	@GET
	@Path("/{id}/evento")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response buscaEventosUsuario(@PathParam("id") Integer id) {
		DaoUsuario dao = new DaoUsuario();
		Usuario u = dao.buscaUsuario(id);
		List<Evento> evento = dao.buscaEventosDoUsuario(id);
		JSONArray array = new JSONArray();
		for (Evento user : evento)
			array.put(DaoEvento.toJson(user));
			array.put(DaoUsuario.toJson(u));
		//JSONObject o = new JSONObject();
		//o.put("usuario", DaoUsuario.toJson(u));
		//o.put("eventos", array);
		return Response.ok().entity(array.toString()).build();
	}
		
		
	@GET
	@Path("/{id}")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response buscaUsuario(@PathParam("id") Integer id) {
		DaoUsuario dao = new DaoUsuario();
		Usuario usuario = dao.buscaUsuario(id);
		JSONObject json = DaoUsuario.toJson(usuario);
		return Response.ok().entity(json.toString()).build();		
	}
	
	@POST
	@Path("/login")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response loginUsuario(String jsonString){
		System.out.println(jsonString);
		DaoUsuario dao = new DaoUsuario();
		Usuario user = DaoUsuario.fromJSON(jsonString);
		String email = user.getEmail();
		String senha = user.getSenha();
		Integer id = user.getId();
		Usuario usr = new Usuario();
		usr.setEmail(email);
		usr.setSenha(senha);
		usr.setId(id);
		Usuario login = dao.autenticacaoUsuario(email,senha);
		if(id != null){
		Usuario u = dao.buscaUsuario(id);
		List<Evento> evento = dao.buscaEventosDoUsuario(id);
		JSONArray array = new JSONArray();
		for (Evento use : evento)
			array.put(DaoEvento.toJson(use));
			array.put(DaoUsuario.toJson(u));
			return Response.ok(200).entity(array.toString()).build();
		}
		if(login != null){
			return Response.ok().build();
		}
		else{
			return Response.status(404).build();
		}
		
		
	}
	
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
	public Response postUsuario(String jsonString) {
		DaoUsuario dao = new DaoUsuario();
		Usuario user = DaoUsuario.fromJSON(jsonString);
		dao.insereUsuario(user);
		return Response.ok().build();
		}


	@PUT
	@Consumes(MediaType.APPLICATION_JSON)
	public Response putUsuario(String jsonString){
		DaoUsuario dao = new DaoUsuario(); 
		Usuario user = DaoUsuario.fromJSON(jsonString);
		dao.atualizaUsuario(user);
		return Response.ok().build();
	}
	
	@DELETE
    @Path("/{id}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response excluiUsuario(@PathParam("id") Integer id) {
		DaoUsuario dao = new DaoUsuario();
        dao.excluiUsuario(id);
        return Response.ok().build();
    }
}