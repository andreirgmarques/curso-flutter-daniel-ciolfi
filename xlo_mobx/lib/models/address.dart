import 'package:xlo_mobx/models/city.dart';
import 'package:xlo_mobx/models/uf.dart';

class Address {
  String cep;
  String district;
  UF uf;
  City city;

  Address({
    this.cep,
    this.district,
    this.uf,
    this.city,
  });
}
