import 'package:dio/dio.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/repositories/ibge_repository.dart';

class CEPRepository {
  Future<Address> getAddressFromApi(String cep) async {
    if (cep == null || cep.isEmpty) return Future.error('CEP Inválido.');

    final clearCEP = cep.replaceAll(RegExp('[^0-9]'), '');
    if (clearCEP.length != 8) return Future.error('CEP Inválido.');

    final endpoint = 'https://viacep.com.br/ws/$clearCEP/json/';

    try {
      final response = await Dio().get<Map>(endpoint);

      if (response.data.containsKey('erro') && response.data['erro'])
        return Future.error('CEP Inválido.');

      final ufList = await IBGERepository().getUFList();

      return Address(
        cep: response.data['cep'],
        district: response.data['bairro'],
        city: City(name: response.data['localidade']),
        uf: ufList.firstWhere((uf) => uf.initials == response.data['uf']),
      );
    } catch (e) {
      Future.error('Falha ao buscar CEP. $e');
    }
  }
}
