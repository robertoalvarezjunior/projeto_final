import 'package:projeto_final_faculdade/model/usuario_model.dart';

sealed class IUsuarioState {
  const IUsuarioState();
}

final class InitialUsuarioState extends IUsuarioState {}

final class LoggedUsuarioState extends IUsuarioState {
  final UsuarioModel? usuario;
  const LoggedUsuarioState(this.usuario);
}

final class ErrorUsuarioState extends IUsuarioState {
  final String message;
  const ErrorUsuarioState(this.message);
}

final class LoginUsuarioState extends IUsuarioState {}
