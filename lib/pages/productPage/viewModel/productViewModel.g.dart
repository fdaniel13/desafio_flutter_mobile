// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductViewModel on ProductViewModelBase, Store {
  Computed<double> _$costTotalComputed;

  @override
  double get costTotal =>
      (_$costTotalComputed ??= Computed<double>(() => super.costTotal,
              name: 'ProductViewModelBase.costTotal'))
          .value;

  final _$productAtom = Atom(name: 'ProductViewModelBase.product');

  @override
  Product get product {
    _$productAtom.reportRead();
    return super.product;
  }

  @override
  set product(Product value) {
    _$productAtom.reportWrite(value, super.product, () {
      super.product = value;
    });
  }

  final _$opcAtom = Atom(name: 'ProductViewModelBase.opc');

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

  final _$quantityAtom = Atom(name: 'ProductViewModelBase.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$cartItemsAtom = Atom(name: 'ProductViewModelBase.cartItems');

  @override
  List<Product> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(List<Product> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  final _$observationsAtom = Atom(name: 'ProductViewModelBase.observations');

  @override
  String get observations {
    _$observationsAtom.reportRead();
    return super.observations;
  }

  @override
  set observations(String value) {
    _$observationsAtom.reportWrite(value, super.observations, () {
      super.observations = value;
    });
  }

  final _$completeItemAtom = Atom(name: 'ProductViewModelBase.completeItem');

  @override
  bool get completeItem {
    _$completeItemAtom.reportRead();
    return super.completeItem;
  }

  @override
  set completeItem(bool value) {
    _$completeItemAtom.reportWrite(value, super.completeItem, () {
      super.completeItem = value;
    });
  }

  final _$quantityForItemAtom =
      Atom(name: 'ProductViewModelBase.quantityForItem');

  @override
  List<int> get quantityForItem {
    _$quantityForItemAtom.reportRead();
    return super.quantityForItem;
  }

  @override
  set quantityForItem(List<int> value) {
    _$quantityForItemAtom.reportWrite(value, super.quantityForItem, () {
      super.quantityForItem = value;
    });
  }

  final _$ProductViewModelBaseActionController =
      ActionController(name: 'ProductViewModelBase');

  @override
  dynamic quantityForIt() {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.quantityForIt');
    try {
      return super.quantityForIt();
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetSate() {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.resetSate');
    try {
      return super.resetSate();
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeProduct(Product _product) {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.changeProduct');
    try {
      return super.changeProduct(_product);
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setOptionId(int _opc) {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.setOptionId');
    try {
      return super.setOptionId(_opc);
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeObservations(dynamic value) {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.changeObservations');
    try {
      return super.changeObservations(value);
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addOne() {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.addOne');
    try {
      return super.addOne();
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeOne() {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.removeOne');
    try {
      return super.removeOne();
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fluxItemCompleted() {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.fluxItemCompleted');
    try {
      return super.fluxItemCompleted();
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cart() {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.cart');
    try {
      return super.cart();
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic searchProduct(Product _product) {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.searchProduct');
    try {
      return super.searchProduct(_product);
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
product: ${product},
opc: ${opc},
quantity: ${quantity},
cartItems: ${cartItems},
observations: ${observations},
completeItem: ${completeItem},
quantityForItem: ${quantityForItem},
costTotal: ${costTotal}
    ''';
  }
}
