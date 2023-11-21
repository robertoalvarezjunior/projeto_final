final class UsuarioModel {
  final String? idUsuario;
  final String email;
  final String senha;
  final String nome;
  final String numeroTelefone;

  UsuarioModel({
    this.idUsuario,
    required this.email,
    required this.senha,
    required this.nome,
    required this.numeroTelefone,
  });
}
