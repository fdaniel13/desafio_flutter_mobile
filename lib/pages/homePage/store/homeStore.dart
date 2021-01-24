
import 'package:desafio_flutter_mobile/models/historicSolicitation.dart';
import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/models/groupProduct.dart';
import 'package:desafio_flutter_mobile/models/product.dart';
import 'package:desafio_flutter_mobile/models/productSolicitation.dart';
import 'package:mobx/mobx.dart';


part 'homeStore.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store{

  @observable
  String searchValue;


  ObservableList<HistoricSolicitation> listNameClient=ObservableList<HistoricSolicitation>.of([]);

  @observable
  String searchItems;


  ObservableList<GroupProduct> listNameItem=ObservableList<GroupProduct>.of([]);

  ObservableList<HistoricSolicitation> shopPerDay= ObservableList <HistoricSolicitation>.of([
    HistoricSolicitation( DateTime.utc(2021,1),[ProductSolicitation(Client('fabio','images/bairanMask.png'),
        [Product('Cuzcuz','images/cuscuzSimples.png',2.25,['milho','arroz'])],
       10,[1,1])])
  ]);


  @observable
  ObservableList<GroupProduct> groupProduct=[
    GroupProduct('Cuscuz',
        [
          Product('Cuscuz simples','images/cuscuzSimples.png',2.25,['milho','arroz']),
          Product('Cuscuz completo','images/cuscuzCompleto.png',3.25,['milho','arroz'])
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

  @observable
  ObservableList<Client> clients=[
    Client('Justine Marshall', 'images/justMask.png'),
    Client('Bairam Frootan', 'images/bairanMask.png'),
    Client('Bairam Frootan', 'images/bariran2Mask.png')

  ].asObservable();


  @action
  addItem(HistoricSolicitation historicSolicitation){

    shopPerDay.add(historicSolicitation);
  }


  @computed
  get orderShopPerDayList=> shopPerDay..sort( (a,b)=>a.date.compareTo(b.date));

  @action
  changeSearchValue(String value){
    searchValue=value;
    shopPerDaySearch();
  }


   @action
   shopPerDaySearch(){

    List<ProductSolicitation> prod=[];
    int times;
    listNameClient.clear();

    if(searchValue.isNotEmpty) {

      String _searchValue=searchValue.trim().toUpperCase();
      shopPerDay.forEach((element) {

       times=element.productSolicitation.length;

       for(int i=0;i<times;i++){
         String name=element.productSolicitation[i].client.name.trim().toUpperCase();

         if(name.startsWith(_searchValue)){
           prod.add(element.productSolicitation[i]);
         }
       }
         if(prod.isNotEmpty){

           listNameClient.add(HistoricSolicitation(element.date,prod));
           prod=[];
         }
      });

    }


  }



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

}

