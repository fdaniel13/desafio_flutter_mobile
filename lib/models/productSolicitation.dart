import 'dart:ffi';

import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/models/product.dart';

class Productsolicitation{

  Client _client;
  Product _product;
  DateTime _date;
  Double  _total;

   set client(Client client)=>this._client=client;
   set product(Product product)=>this._product=product;
   set date(DateTime date)=>this._date=date;
   set total(Double total)=>this._total=total;

  Client get client=>this._client;
  Product get product=>this._product;
  DateTime get date=>this._date;
  Double get total=>this._total;


}