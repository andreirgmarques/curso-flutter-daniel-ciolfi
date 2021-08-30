// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cep_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CEPStore on _CEPStoreBase, Store {
  Computed<String> _$clearCEPComputed;

  @override
  String get clearCEP =>
      (_$clearCEPComputed ??= Computed<String>(() => super.clearCEP,
              name: '_CEPStoreBase.clearCEP'))
          .value;

  final _$cepAtom = Atom(name: '_CEPStoreBase.cep');

  @override
  String get cep {
    _$cepAtom.reportRead();
    return super.cep;
  }

  @override
  set cep(String value) {
    _$cepAtom.reportWrite(value, super.cep, () {
      super.cep = value;
    });
  }

  final _$addressAtom = Atom(name: '_CEPStoreBase.address');

  @override
  Address get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(Address value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  final _$errorAtom = Atom(name: '_CEPStoreBase.error');

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CEPStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_searchCEPAsyncAction = AsyncAction('_CEPStoreBase._searchCEP');

  @override
  Future<void> _searchCEP() {
    return _$_searchCEPAsyncAction.run(() => super._searchCEP());
  }

  final _$_CEPStoreBaseActionController =
      ActionController(name: '_CEPStoreBase');

  @override
  dynamic setCEP(String value) {
    final _$actionInfo = _$_CEPStoreBaseActionController.startAction(
        name: '_CEPStoreBase.setCEP');
    try {
      return super.setCEP(value);
    } finally {
      _$_CEPStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _reset() {
    final _$actionInfo = _$_CEPStoreBaseActionController.startAction(
        name: '_CEPStoreBase._reset');
    try {
      return super._reset();
    } finally {
      _$_CEPStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cep: ${cep},
address: ${address},
error: ${error},
loading: ${loading},
clearCEP: ${clearCEP}
    ''';
  }
}
