import 'dart:ffi';

import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/models/product.dart';

class ProductSolicitation{

  Client _client;
  List<Product> _product;
  Map<int,Product> _productOrder;
  DateTime _date;

  ProductSolicitation(this._client,this._product,this._date);

   set client(Client client)=>this._client=client;
   set product(List<Product> product)=>this._product=product;
   set date(DateTime date)=>this._date=date;
   set productOrder(Map<int,Product> productOrder)=>this._productOrder=productOrder;

  Client get client=>this._client;
  List<Product> get product=>this._product;
  DateTime get date=>this._date;


  //possivel função do viewModel
  double totalPrice(){
    double total=0;
    _product.forEach((e) =>

         total+=e.price
    );

    return total;

  }



}