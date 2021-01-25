// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'historicViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HistoricViewModel on HistoricViewModelBase, Store {
  Computed<dynamic> _$orderShopPerDayListComputed;

  @override
  dynamic get orderShopPerDayList => (_$orderShopPerDayListComputed ??=
          Computed<dynamic>(() => super.orderShopPerDayList,
              name: 'HistoricViewModelBase.orderShopPerDayList'))
      .value;

  final _$searchValueAtom = Atom(name: 'HistoricViewModelBase.searchValue');

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

  final _$HistoricViewModelBaseActionController =
      ActionController(name: 'HistoricViewModelBase');

  @override
  dynamic addItem(HistoricSolicitation historicSolicitation) {
    final _$actionInfo = _$HistoricViewModelBaseActionController.startAction(
        name: 'HistoricViewModelBase.addItem');
    try {
      return super.addItem(historicSolicitation);
    } finally {
      _$HistoricViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSearchValue(String value) {
    final _$actionInfo = _$HistoricViewModelBaseActionController.startAction(
        name: 'HistoricViewModelBase.changeSearchValue');
    try {
      return super.changeSearchValue(value);
    } finally {
      _$HistoricViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic shopPerDaySearch() {
    final _$actionInfo = _$HistoricViewModelBaseActionController.startAction(
        name: 'HistoricViewModelBase.shopPerDaySearch');
    try {
      return super.shopPerDaySearch();
    } finally {
      _$HistoricViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchValue: ${searchValue},
orderShopPerDayList: ${orderShopPerDayList}
    ''';
  }
}
