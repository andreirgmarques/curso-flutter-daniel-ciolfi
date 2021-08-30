import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class IBGERepository {
  Future<List<UF>> getUFList() async {
    final preferences = await SharedPreferences.getInstance();

    if (preferences.containsKey('UF_LIST')) {
      final j = json.decode(preferences.getString('UF_LIST'));

      return j.map<UF>((json) => UF.fromJson(json)).toList()
        ..sort(
          (UF a, UF b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
    }

    const endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados';

    try {
      final response = await Dio().get<List>(endpoint);

      preferences.setString('UF_LIST', json.encode(response.data));

      return response.data.map<UF>((json) => UF.fromJson(json)).toList()
        ..sort(
          (UF a, UF b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
    } on DioError {
      return Future.error('Falha ao obter lista de Estados.');
    }
  }

  Future<List<City>> getCityListFromApi(UF uf) async {
    final String endpoint =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf.id}/municipios';

    try {
      final response = await Dio().get<List>(endpoint);

      final cityList =
          response.data.map<City>((json) => City.fromJson(json)).toList()
            ..sort(
              (City a, City b) =>
                  a.name.toLowerCase().compareTo(b.name.toLowerCase()),
            );

      return cityList;
    } on DioError {
      return Future.error('Falha ao obter lista de Cidades.');
    }
  }
}
