import 'package:projeto_final_faculdade/model/usuario_model.dart';

sealed class IUsuarioEvent {
  const IUsuarioEvent();
}

final class CadastrarUsuarioEvent extends IUsuarioEvent {
  final UsuarioModel usuario;

  CadastrarUsuarioEvent({required this.usuario});
}

final class RecuperarSenhaUsuarioEvent extends IUsuarioEvent {
  final String email;
  final String senha;

  RecuperarSenhaUsuarioEvent({required this.email, required this.senha});
}

final class LoginUsuairoEvent extends IUsuarioEvent {
  final String email;
  final String senha;

  LoginUsuairoEvent({required this.email, required this.senha});
}

final class VerifyUsuarioEvent extends IUsuarioEvent {
  const VerifyUsuarioEvent();
}
