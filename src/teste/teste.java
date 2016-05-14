package teste;
import snapcity.model.Evento;
import snapcity.model.Usuario;
import java.util.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import org.json.*;

import snapcity.dao.DaoEvento;
import snapcity.dao.DaoUsuario;

public class teste {
	public static void main(String[] args) throws JSONException {

		snapcity.dao.DaoUsuario usuarios = new DaoUsuario();
		snapcity.dao.DaoEvento eventos = new DaoEvento();
		DaoUsuario dao = new DaoUsuario();
		JSONObject obj = new JSONObject();

		// -------------->> Insere Usuario <<-----------------------------//
//		 String json_str = "{\"nome\":\"andersen\",\"senha\":\"753\",\"email\":\"teste@2152.com.br\"}";
//		 Usuario user = DaoUsuario.fromJSON(json_str);
//		 dao.insereUsuario(user);

		 List<Evento> evento = dao.buscaEventosDoUsuario(28);
		 JSONArray array = new JSONArray();
		 for(Evento user : evento)
			 array.put(DaoEvento.toJson(user)); 	
		 System.out.println(array);
		 
		// -------------->> Atualiza Usuario <<-----------------------------//
		// String json_str =
		// "{\"nome\":\"andersen\",\"senha\":\"753\",\"email\":\"teste@2152.com.br\"}";
		// Usuario user = DaoUsuario.fromJSON(json_str);
		// String json_str1 =
		// "{\"nome\":\"Joao\",\"senha\":\"123\",\"email\":\"joao@uol.com.br\"}";
		// Usuario user1 = DaoUsuario.alteraJSON(json_str1);
		// dao.atualizaUsuario(25, user1);

		// usuarios.mostrarUsuario();

		// -------------->>Busca Usuario <<-----------------------------//
		// String usuario = dao.buscaUsuario(25);
		// Usuario userJson = DaoUsuario.toJson(usuario);
		// System.out.println(userJson);

		// List<Usuario> usuario = dao.mostrarUsuario();
		// String userJson = DaoUsuario.toJsonArray(usuario);
		// System.out.println(userJson);

		// -------------->>Excluir Usuario <<-----------------------------//
		// Usuario usuario = dao.excluiUsuario(24);
		// String userJson = DaoUsuario.toJson(usuario);
		// System.out.println(userJson);

		// usuarios.buscaUsuariosEventos(1);

	}
}