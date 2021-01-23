import 'package:desafio_flutter_mobile/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'productViewModel.g.dart';

class ProductViewModel = ProductViewModelBase with _$ProductViewModel;

abstract class ProductViewModelBase with Store {

  @observable
  Product product=Product('','images/justMask.png' , 0,['','']);

  @observable
  int opc=-1;
  @observable
  int quantity=1;
  @observable
  List<Product> cartItems=[];

  @observable
  String observations='';


  @observable
  List<int> quantityForItem=[];



  @action
  resetSate(){
    product=Product('','images/justMask.png' , 0,['','']);
    int opc=-1;
    quantity=1;
    cartItems=[];
    observations='';
    quantityForItem=[];
  }


  @action
  changeProduct(Product _product)=>product=_product;

  @action
  setOptionId(int _opc){
    opc =_opc;
  }



  @action
  changeObservations(value){
    observations=value;
  }


  @action
  addOne(){
    quantity+=1;
  }

  @action
  removeOne(){
    if(quantity!=1) quantity-=1;
  }



  @action
  cart(){
    if(!cartItems.contains(product)){

      cartItems.add(product);
      quantityForItem.add(quantity);
      quantity=1;
    }
  }

  @action
  resetQuantity(){
    quantity=1;
  }

  @action
  searchProduct(Product _product){
    if(cartItems.isNotEmpty) return cartItems.contains(_product);
    return false;
  }

  @computed
  double get costTotal{
    double  cost=0;
    int index=0;

    cartItems.forEach((prod) {


      cost+=prod.price*quantityForItem[index];

      index++;

    });


    return cost;
  }

}

