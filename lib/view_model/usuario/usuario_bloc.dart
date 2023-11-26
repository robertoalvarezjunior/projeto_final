import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:projeto_final_faculdade/core/utils/getit_setup.dart';
import 'package:projeto_final_faculdade/database/insert/insert_usuario.dart';
import 'package:projeto_final_faculdade/database/select/select_usuario.dart';
import 'package:projeto_final_faculdade/view_model/usuario/usuario_event.dart';
import 'package:projeto_final_faculdade/view_model/usuario/usuario_state.dart';

final class UsuarioBloc extends Bloc<IUsuarioEvent, IUsuarioState> {
  UsuarioBloc() : super(InitialUsuarioState()) {
    on<CadastrarUsuarioEvent>(_cadastrarUsuario);
    on<RecuperarSenhaUsuarioEvent>(_recuperarSenha);
    on<LoginUsuairoEvent>(_login);
    on<VerifyUsuarioEvent>(_verify);
  }

  FutureOr<void> _cadastrarUsuario(
      CadastrarUsuarioEvent event, Emitter<IUsuarioState> emit) async {
    try {
      await getIt<InsertUsuario>().insertUsuario(event.usuario);
    } catch (e) {
      emit(ErrorUsuarioState(e.toString()));
    }
  }

  FutureOr<void> _recuperarSenha(
      RecuperarSenhaUsuarioEvent event, Emitter<IUsuarioState> emit) {
    try {} catch (e) {
      emit(ErrorUsuarioState(e.toString()));
    }
  }

  FutureOr<void> _login(
      LoginUsuairoEvent event, Emitter<IUsuarioState> emit) async {
    try {
      emit(InitialUsuarioState());
      final usuario =
          await getIt<SelectUsuairo>().selectUsuario(event.email, event.senha);
      emit(LoggedUsuarioState(usuario));
    } catch (e) {
      emit(ErrorUsuarioState(e.toString()));
    }
  }

  FutureOr<void> _verify(
      VerifyUsuarioEvent event, Emitter<IUsuarioState> emit) async {
    try {
      emit(InitialUsuarioState());
      final usuario = await getIt<SelectUsuairo>().verifyUsuario();
      emit(LoginUsuarioState());
      if (usuario.isNotEmpty) {
        emit(LoggedUsuarioState(usuario.first));
      }
    } catch (e) {
      emit(ErrorUsuarioState(e.toString()));
    }
  }
}
