import 'package:mobx/mobx.dart';
import 'package:xlo_mobx/models/address.dart';
import 'package:xlo_mobx/repositories/cep_repository.dart';

part 'cep_store.g.dart';

class CEPStore = _CEPStoreBase with _$CEPStore;

abstract class _CEPStoreBase with Store {
  _CEPStoreBase() {
    autorun((_) {
      if (clearCEP.isEmpty || clearCEP.length != 8) {
        _reset();
      } else {
        _searchCEP();
      }
    });
  }

  @observable
  String cep = '';

  @action
  setCEP(String value) => cep = value;

  @computed
  String get clearCEP => cep.replaceAll(RegExp('[^0-9]'), '');

  @observable
  Address address;

  @observable
  String error;

  @observable
  bool loading = false;

  @action
  Future<void> _searchCEP() async {
    loading = true;
    try {
      address = await CEPRepository().getAddressFromApi(clearCEP);
      error = null;
    } catch (e) {
      address = null;
      error = e;
    }
    loading = false;
  }

  @action
  void _reset() {
    address = null;
    error = null;
  }
}
