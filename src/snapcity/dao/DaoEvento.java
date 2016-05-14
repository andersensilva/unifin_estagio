package snapcity.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.imageio.ImageIO;

import org.json.*;

import snapcity.model.*;
import snapcity.dao.banco.ConectionFactory;
import snapcity.model.Usuario;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
/**
 * Classe de Dao de Eventos
 * @author Marcelo e Andersen
 *
 */
public class DaoEvento {

	/**
	 * Retorna todos os eventos cadastros.
	 * @return Lista de {@link Evento} mostra todos eventos.
	 */
	public List<Evento> mostrarEvento() {

		// TODO buscaEventos

		ArrayList<Evento> eventos = new ArrayList<Evento>();

		try {
			Connection c = ConectionFactory.getConnection();
			c.setAutoCommit(false);
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM eventos;");

			while (rs.next()) {
				Evento evento = new Evento();
				evento.setId(rs.getInt("idEventos"));
				evento.setFoto(rs.getString("foto"));
				evento.setDescricao(rs.getString("descricao"));
				evento.setTag(rs.getString("tags"));
				evento.setLatitude(rs.getDouble("latitude"));
				evento.setLongintude(rs.getDouble("longitude"));
				evento.setDatahora(rs.getString("datahora"));				
				eventos.add(evento);
			}
			stmt.close();

		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
		}
		// TODO remover todos os System.out
		System.out.println("Operacao com mostraEventos com sucesso");
		return eventos;
	}

	/**
	 * Retorna evento por ID
	 * @param idEvento
	 * @return Mostra {@link buscaEvento} Evento
	 */
	public Evento buscaEvento(int idEvento) {

		try {	
			Evento evento = new Evento();

			Connection c = ConectionFactory.getConnection();
			Statement stmt = c.createStatement();
			ResultSet rs = stmt.executeQuery("select * from eventos where eventos.\"idEventos\"="+ idEvento + ";");
			while (rs.next()) {

				int id = rs.getInt("idEventos");
				String foto = rs.getString("foto");
				String descricao = rs.getString("descricao");
				String tags = rs.getString("tags");
				Double latitude = rs.getDouble("latitude");
				Double longitude = rs.getDouble("longitude");
				String datahora = rs.getString("datahora");		

				evento.setId(id);
				evento.setDescricao(descricao);
				evento.setFoto(foto);
				evento.setTag(tags);
				evento.setLatitude(latitude);
				evento.setLongintude(longitude);
				evento.setDatahora(datahora);

			}

			rs.close();
			c.close();
			stmt.close();

			System.out.println("Operacao com buscaEventos com sucesso");

			return evento;
		} catch (Exception e) {
			System.err.println(e.getClass().getName() + ": " + e.getMessage());
			return null;
		}
	}

	/**
	 * Método que Exclui evento por ID
	 * @param idEvento
	 * @return Exclui {@link excluiEvento} evento
	 */
	public void excluiEvento(int idEvento) {    
		try {  
			Connection c = ConectionFactory.getConnection(); 
			c.setAutoCommit(false);
			Statement stmt = c.createStatement();
			String sql = "DELETE FROM eventos WHERE eventos.\"idEventos\" = '" + idEvento + "';";
			stmt.executeUpdate(sql);
			c.commit();
			c.close();
			stmt.close();

			// TODO remover system.out TODOS eles
			System.out.println("Operacao com exluirEventos com sucesso");

		} catch ( Exception e ) {
			System.err.println( e.getClass().getName()+": "+ e.getMessage() );
		}
	}

	/**
	 * Atualiza evento o campo datahora pega valores de data e hora atual do sistema em timestamp
	 * @param evento
	 * @return Atualiza {@link Evento}
	 */
	public void atualizaEvento(Evento evento) {    
		try {  
			Connection c = ConectionFactory.getConnection();
			c.setAutoCommit(false);
			Timestamp datahora = new Timestamp(System.currentTimeMillis());
			Statement stmt = c.createStatement();
			String sql = "UPDATE eventos set foto = '"+ evento.getFoto() +
					"',descricao = '"+ evento.getDescricao()+"',latitude = '"+
					evento.getLatitude() +"',longitude = '"+ evento.getLongintude() +
					"', tags = '"+ evento.getTag() +"',datahora = '"+datahora+"'"
					+ " where eventos.\"idEventos\" = '" + evento.getId() + "';";
			stmt.executeUpdate(sql);
			c.commit();
			c.close();
			stmt.close();
			System.out.println("Operacao com atualizaEventos com sucesso");
		} catch ( Exception e ) {
			System.err.println( e.getClass().getName()+": "+ e.getMessage() );
		}
	} 


	/**
	 * Cadastra Evento, datahora insere data atual do sistema em timestamp
	 * @param evento
	 */
	public void insereEvento(Evento evento){
		try{
			Connection c = ConectionFactory.getConnection();
			c.setAutoCommit(false);
			Timestamp datahora = new Timestamp(System.currentTimeMillis()); 
			Statement stmt = c.createStatement();
			String sql = "INSERT INTO eventos (foto,descricao,latitude,longitude,id_usuario,tags,datahora)"
					+" values ('"+evento.getFoto()+"','"+evento.getDescricao()+"','"+evento.getLatitude()+"','"+evento.getLongintude()+"','"+evento.getIdUsuario()+"','"+evento.getTag()+"','"+datahora+"');";

			stmt.executeUpdate(sql);
			c.commit();
			stmt.close();
			c.close();
			System.out.println("Evento foi criado com sucesso");
		} catch ( Exception e ) {
			System.err.println( e.getClass().getName()+": "+ e.getMessage() );
		}
	}


	/** 
	 * Método que retorna imagem codificada em base64
	 * @param endereco
	 * @return {@link encodeToString}
	 */

	public static String encodeToString(String endereco) {
		String imageString = null;

		try {
			File file = new File(endereco);
			FileInputStream imageInFile = new FileInputStream(file);
			byte imageData[] = new byte[(int)file.length()];
			imageInFile.read(imageData);

			BASE64Encoder encoder = new BASE64Encoder();
			imageString = encoder.encode(imageData);

			imageInFile.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imageString;
	}

	/**
	 * Método de decodificação de imagem codificada em base64
	 * @param imageString
	 * @return {@link decodeToImage}
	 */
	public static BufferedImage decodeToImage(String imageString) {

		BufferedImage image = null;
		byte[] imageByte;
		try {
			BASE64Decoder decoder = new BASE64Decoder();
			imageByte = decoder.decodeBuffer(imageString);

			ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
			image = ImageIO.read(bis);
			bis.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return image;
	}

	/**
	 * Retorna objeto Evento para Json
	 * @param evento
	 * @return {@link toJson}
	 */

	public static JSONObject toJson(Evento evento){
		JSONObject obj = new JSONObject();
		obj.put("id", evento.getId());
		obj.put("descricao", evento.getDescricao());
		obj.put("foto", evento.getFoto());
		obj.put("longitude", evento.getLongintude());
		obj.put("latitude", evento.getLatitude());
		obj.put("tags", evento.getTag());
		obj.put("datacriacao", evento.getDatahora());
		return obj;
	}

	/**
	 * Método que retorna Json para dados de Evento
	 * @param strJson
	 * @return {@link fromJson}
	 */
	public Evento fromJson(String strJson){
		JSONObject eventoJson = new JSONObject(strJson);
		Evento evento = new Evento();

		if(eventoJson.has("id")){
			Integer id = eventoJson.getInt("id");
			evento.setId(id);
		}

		String descricao = eventoJson.getString("descricao");
		String tags = eventoJson.getString("tags");
		Double latitude = eventoJson.getDouble("latitude");
		Double longitude = eventoJson.getDouble("longitude");
		Integer id_usuario = eventoJson.getInt("id_usuario");
		System.out.println(id_usuario);
		String foto = eventoJson.getString("foto");

		evento.setDescricao(descricao);
		evento.setTag(tags);
		evento.setLatitude(latitude);
		evento.setLongintude(longitude);
		evento.setUsuario(id_usuario);
		evento.setFoto(foto);

		return evento;
	}
}