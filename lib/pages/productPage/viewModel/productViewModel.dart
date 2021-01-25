import 'package:desafio_flutter_mobile/models/groupProduct.dart';
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

  @observable
  String searchItems='';

  ObservableList<GroupProduct> listNameItem=ObservableList<GroupProduct>.of([]);

  @observable
  ObservableList<GroupProduct> groupProduct=[
    GroupProduct('Cuscuz',
        [
          Product('Cuscuz simples','images/cuscuzSimples.png',2.25,['Cuscuz de milho','Cuscuz de arroz']),
          Product('Cuscuz completo','images/cuscuzCompleto.png',3.25,['Cuscuz de milho','Cuscuz de arroz'])
        ]
    ),
    GroupProduct('Pães',
        [
          Product('Pão caseiro','images/paoCaseiro.png',2.25,[]),
          Product('Pão caseiro completo','images/paoCaseiroCompleto.png',3.25,[]),
          Product('Misto quente','images/misto.png',3.00,[]),
          Product('Lingua de sogra (pq.)','images/lingua.png',2.00,[]),
          Product('lingua de sogra (gr.)','images/lingua.png',3.00,[]),
        ]
    ),

  ].asObservable();


  @action
  changeSearchItem(String value){
    searchItems=value;
    shopItemSearch();
  }

  @action
  shopItemSearch(){

    List<Product> group=[];
    int times;

    listNameItem.clear();

    if(searchItems.isNotEmpty) {

      String _searchValue=searchItems.trim().toUpperCase();
      groupProduct.forEach((element) {

        times=element.product.length;

        for(int i=0;i<times;i++){
          String name=element.product[i].name.trim().toUpperCase();

          if(name.startsWith(_searchValue)){
            group.add(element.product[i]);
          }
        }
        if(group.isNotEmpty){

          listNameItem.add(GroupProduct(element.name,group));
          group=[];
        }
      });
    }

  }


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

