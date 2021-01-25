import 'dart:ffi';

import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/models/product.dart';

class ProductSolicitation{

  Client _client;
  List<Product> _product;
  Map<int,Product> _productOrder;
  double _total;
  List<int> _quantPro;


  ProductSolicitation(this._client,this._product,this._total,this._quantPro);

   set client(Client client)=>this._client=client;
   set product(List<Product> product)=>this._product=product;
   set productOrder(Map<int,Product> productOrder)=>this._productOrder=productOrder;
   set total(double total)=>this._total=total;

  Client get client=>this._client;
  List<Product> get product=>this._product;
  double get total =>this._total;
  List<int> get quantPro=>this._quantPro;


  //possivel função do viewModel
  double totalPrice(){
    double total=0;
    _product.forEach((e) =>

         total+=e.price
    );

    return total;

  }

  String getInfoShop(){
    String info='';
    int index=0;
    this._product.forEach((element) {
      info+='${quantPro[index]}x ${element.name}';
    });

    return info;
  }



}