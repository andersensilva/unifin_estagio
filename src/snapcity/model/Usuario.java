package snapcity.model;

/**
 * Classe POJO Usuario
 * @author Andersen Silva e Marcelo
 *
 */
public class Usuario {
	private Integer id;
	private String nome;
	private String senha;
	private String email;
	private String datacriacao;

	public void setId(Integer id) {
		this.id = id;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setDatacriacao(String datacriacao) {
		this.datacriacao = datacriacao;
	}

	public Integer getId() {
		return id;
	}

	public String getNome() {
		return nome;
	}

	public String getSenha() {
		return senha;
	}

	public String getEmail() {
		return email;
	}

	public String getDatacriacao() {
		return datacriacao;
	}

}