import 'package:projeto_final_faculdade/model/endereco_model.dart';

sealed class IEnderecoState {
  const IEnderecoState();
}

final class InitialEnderecoState extends IEnderecoState {}

final class LoadedEnderecoState extends IEnderecoState {
  final List<EnderecoModel> enderecos;
  const LoadedEnderecoState(this.enderecos);
}

final class ErrorEnderecoState extends IEnderecoState {
  final String message;
  const ErrorEnderecoState(this.message);
}

final class EmptyEnderecoState extends IEnderecoState {}
