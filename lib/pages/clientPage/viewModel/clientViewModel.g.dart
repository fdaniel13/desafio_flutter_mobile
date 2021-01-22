// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clientViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientViewModel on ClientViewModelBase, Store {
  final _$clientsSelectedAtom =
      Atom(name: 'ClientViewModelBase.clientsSelected');

  @override
  List<Client> get clientsSelected {
    _$clientsSelectedAtom.reportRead();
    return super.clientsSelected;
  }

  @override
  set clientsSelected(List<Client> value) {
    _$clientsSelectedAtom.reportWrite(value, super.clientsSelected, () {
      super.clientsSelected = value;
    });
  }

  final _$stepCompleteAtom = Atom(name: 'ClientViewModelBase.stepComplete');

  @override
  bool get stepComplete {
    _$stepCompleteAtom.reportRead();
    return super.stepComplete;
  }

  @override
  set stepComplete(bool value) {
    _$stepCompleteAtom.reportWrite(value, super.stepComplete, () {
      super.stepComplete = value;
    });
  }

  final _$ClientViewModelBaseActionController =
      ActionController(name: 'ClientViewModelBase');

  @override
  dynamic clickLogic(Client clientS) {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.clickLogic');
    try {
      return super.clickLogic(clientS);
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool searchClient(Client clientS) {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.searchClient');
    try {
      return super.searchClient(clientS);
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stepFinish() {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.stepFinish');
    try {
      return super.stepFinish();
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clientsSelected: ${clientsSelected},
stepComplete: ${stepComplete}
    ''';
  }
}
