// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  Computed<dynamic> _$orderShopPerDayListComputed;

  @override
  dynamic get orderShopPerDayList => (_$orderShopPerDayListComputed ??=
          Computed<dynamic>(() => super.orderShopPerDayList,
              name: 'HomeStoreBase.orderShopPerDayList'))
      .value;

  final _$searchValueAtom = Atom(name: 'HomeStoreBase.searchValue');

  @override
  String get searchValue {
    _$searchValueAtom.reportRead();
    return super.searchValue;
  }

  @override
  set searchValue(String value) {
    _$searchValueAtom.reportWrite(value, super.searchValue, () {
      super.searchValue = value;
    });
  }

  final _$searchItemsAtom = Atom(name: 'HomeStoreBase.searchItems');

  @override
  String get searchItems {
    _$searchItemsAtom.reportRead();
    return super.searchItems;
  }

  @override
  set searchItems(String value) {
    _$searchItemsAtom.reportWrite(value, super.searchItems, () {
      super.searchItems = value;
    });
  }

  final _$searchClientAtom = Atom(name: 'HomeStoreBase.searchClient');

  @override
  String get searchClient {
    _$searchClientAtom.reportRead();
    return super.searchClient;
  }

  @override
  set searchClient(String value) {
    _$searchClientAtom.reportWrite(value, super.searchClient, () {
      super.searchClient = value;
    });
  }

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
  dynamic changeSearchValue(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeSearchValue');
    try {
      return super.changeSearchValue(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic shopPerDaySearch() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.shopPerDaySearch');
    try {
      return super.shopPerDaySearch();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSearchItem(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeSearchItem');
    try {
      return super.changeSearchItem(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic shopItemSearch() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.shopItemSearch');
    try {
      return super.shopItemSearch();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSearchClient(String value) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.changeSearchClient');
    try {
      return super.changeSearchClient(value);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic shopClientSearch() {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.shopClientSearch');
    try {
      return super.shopClientSearch();
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchValue: ${searchValue},
searchItems: ${searchItems},
searchClient: ${searchClient},
groupProduct: ${groupProduct},
clients: ${clients},
orderShopPerDayList: ${orderShopPerDayList}
    ''';
  }
}
