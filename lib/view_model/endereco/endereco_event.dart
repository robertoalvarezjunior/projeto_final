import 'package:projeto_final_faculdade/model/endereco_model.dart';

sealed class IEnderecoEvent {
  const IEnderecoEvent();
}

final class GetEnderecosEvent extends IEnderecoEvent {
  const GetEnderecosEvent();
}

final class AdicionarEnderecoEvent extends IEnderecoEvent {
  final EnderecoModel endereco;
  const AdicionarEnderecoEvent(this.endereco);
}

final class DeleteEnderecoEvent extends IEnderecoEvent {
  final int id;
  const DeleteEnderecoEvent(this.id);
}
