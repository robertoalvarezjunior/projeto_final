import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_final_faculdade/core/utils/getit_setup.dart';
import 'package:projeto_final_faculdade/database/delete/delete_endereco.dart';
import 'package:projeto_final_faculdade/database/insert/insert_endereco.dart';
import 'package:projeto_final_faculdade/database/select/select_endereco.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_event.dart';
import 'package:projeto_final_faculdade/view_model/endereco/endereco_state.dart';

final class EnderecoBloc extends Bloc<IEnderecoEvent, IEnderecoState> {
  EnderecoBloc() : super(InitialEnderecoState()) {
    on<GetEnderecosEvent>(_getEndereco);
    on<AdicionarEnderecoEvent>(_addEndereco);
    on<DeleteEnderecoEvent>(_removerEndereco);
  }

  void _getEndereco(
      GetEnderecosEvent event, Emitter<IEnderecoState> emit) async {
    try {
      emit(InitialEnderecoState());
      final enderecos = await getIt<SelectEndereco>().selectCarrinho();

      emit(LoadedEnderecoState(enderecos));

      if (enderecos.isEmpty) {
        emit(EmptyEnderecoState());
      }
    } catch (e) {
      emit(ErrorEnderecoState(e.toString()));
    }
  }

  void _addEndereco(
      AdicionarEnderecoEvent event, Emitter<IEnderecoState> emit) async {
    try {
      await getIt<InsertEndereco>().insertEndereco(event.endereco);
    } catch (e) {
      emit(ErrorEnderecoState(e.toString()));
    }
  }

  void _removerEndereco(
      DeleteEnderecoEvent event, Emitter<IEnderecoState> emit) async {
    try {
      await getIt<DeleteEndereco>()
          .deleteEndereco(event.id)
          .then((value) => emit(InitialEnderecoState()))
          .whenComplete(() async {
        emit(InitialEnderecoState());
        final enderecos = await getIt<SelectEndereco>().selectCarrinho();

        emit(LoadedEnderecoState(enderecos));
        if (enderecos.isEmpty) {
          emit(EmptyEnderecoState());
        }
      });
    } catch (e) {
      emit(ErrorEnderecoState(e.toString()));
    }
  }
}
