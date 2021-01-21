import 'package:desafio_flutter_mobile/models/product.dart';

class GroupProduct{

  String _name;
  List<Product> _product;

  GroupProduct(this._name,this._product);

  set name(String name)=>this._name=name;
  set product(List<Product> product)=>this._product=product;

  String get name => this._name;
  List<Product> get product=>this._product;


}