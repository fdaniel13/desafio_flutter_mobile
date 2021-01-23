// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$groupProductAtom = Atom(name: 'HomeStoreBase.groupProduct');

  @override
  ObservableList<GroupProduct> get groupProduct {
    _$groupProductAtom.reportRead();
    return super.groupProduct;
  }

  @override
  set groupProduct(ObservableList<GroupProduct> value) {
    _$groupProductAtom.reportWrite(value, super.groupProduct, () {
      super.groupProduct = value;
    });
  }

  final _$clientsAtom = Atom(name: 'HomeStoreBase.clients');

  @override
  ObservableList<Client> get clients {
    _$clientsAtom.reportRead();
    return super.clients;
  }

  @override
  set clients(ObservableList<Client> value) {
    _$clientsAtom.reportWrite(value, super.clients, () {
      super.clients = value;
    });
  }

  final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase');

  @override
  dynamic addItem(HistoricSolicitation historicSolicitation) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.addItem');
    try {
      return super.addItem(historicSolicitation);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
groupProduct: ${groupProduct},
clients: ${clients}
    ''';
  }
}
