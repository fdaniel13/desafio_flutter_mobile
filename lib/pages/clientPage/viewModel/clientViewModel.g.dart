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
  Computed<dynamic> _$disableCardClientComputed;

  @override
  dynamic get disableCardClient => (_$disableCardClientComputed ??=
          Computed<dynamic>(() => super.disableCardClient,
              name: 'ClientViewModelBase.disableCardClient'))
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

  final _$listReactStateAtom = Atom(name: 'ClientViewModelBase.listReactState');

  @override
  bool get listReactState {
    _$listReactStateAtom.reportRead();
    return super.listReactState;
  }

  @override
  set listReactState(bool value) {
    _$listReactStateAtom.reportWrite(value, super.listReactState, () {
      super.listReactState = value;
    });
  }

  final _$dataCalendarAtom = Atom(name: 'ClientViewModelBase.dataCalendar');

  @override
  String get dataCalendar {
    _$dataCalendarAtom.reportRead();
    return super.dataCalendar;
  }

  @override
  set dataCalendar(String value) {
    _$dataCalendarAtom.reportWrite(value, super.dataCalendar, () {
      super.dataCalendar = value;
    });
  }

  final _$searchClientAtom = Atom(name: 'ClientViewModelBase.searchClient');

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

  final _$clientsAtom = Atom(name: 'ClientViewModelBase.clients');

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

  final _$ClientViewModelBaseActionController =
      ActionController(name: 'ClientViewModelBase');

  @override
  dynamic changeSearchClient(String value) {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.changeSearchClient');
    try {
      return super.changeSearchClient(value);
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic shopClientSearch() {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.shopClientSearch');
    try {
      return super.shopClientSearch();
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetDataCalendar() {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.resetDataCalendar');
    try {
      return super.resetDataCalendar();
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDataCalendar(CalendarController cal) {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.changeDataCalendar');
    try {
      return super.changeDataCalendar(cal);
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
  Color cardClientColor(Client _client) {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.cardClientColor');
    try {
      return super.cardClientColor(_client);
    } finally {
      _$ClientViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Color textCardColor(Client _client) {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.textCardColor');
    try {
      return super.textCardColor(_client);
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
  dynamic resetState() {
    final _$actionInfo = _$ClientViewModelBaseActionController.startAction(
        name: 'ClientViewModelBase.resetState');
    try {
      return super.resetState();
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
listReactState: ${listReactState},
dataCalendar: ${dataCalendar},
searchClient: ${searchClient},
clients: ${clients},
colorButton: ${colorButton},
buttonActivated: ${buttonActivated},
disableCardClient: ${disableCardClient}
    ''';
  }
}
