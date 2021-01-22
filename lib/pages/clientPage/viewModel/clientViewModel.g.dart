// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clientViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientViewModel on ClientViewModelBase, Store {
  Computed<Color> _$colorButtonComputed;

  @override
  Color get colorButton =>
      (_$colorButtonComputed ??= Computed<Color>(() => super.colorButton,
              name: 'ClientViewModelBase.colorButton'))
          .value;
  Computed<bool> _$buttonActivatedComputed;

  @override
  bool get buttonActivated =>
      (_$buttonActivatedComputed ??= Computed<bool>(() => super.buttonActivated,
              name: 'ClientViewModelBase.buttonActivated'))
          .value;

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

  final _$opcAtom = Atom(name: 'ClientViewModelBase.opc');

  @override
  int get opc {
    _$opcAtom.reportRead();
    return super.opc;
  }

  @override
  set opc(int value) {
    _$opcAtom.reportWrite(value, super.opc, () {
      super.opc = value;
    });
  }

  final _$dataAtom = Atom(name: 'ClientViewModelBase.data');

  @override
  String get data {
    _$dataAtom.reportRead();
    return super.data;
  }

  @override
  set data(String value) {
    _$dataAtom.reportWrite(value, super.data, () {
      super.data = value;
    });
  }

  final _$ClientViewModelBaseActionController =
      ActionController(name: 'ClientViewModelBase');

  @override
  dynamic setOptionId(int _opc) {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.setOptionId');
    try {
      return super.setOptionId(_opc);
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetButton() {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.resetButton');
    try {
      return super.resetButton();
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDataSelect(DateTime dataSel) {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.setDataSelect');
    try {
      return super.setDataSelect(dataSel);
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
stepComplete: ${stepComplete},
opc: ${opc},
data: ${data},
colorButton: ${colorButton},
buttonActivated: ${buttonActivated}
    ''';
  }
}
