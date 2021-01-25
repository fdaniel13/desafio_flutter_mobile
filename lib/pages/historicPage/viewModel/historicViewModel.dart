
import 'package:desafio_flutter_mobile/models/historicSolicitation.dart';
import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/models/groupProduct.dart';
import 'package:desafio_flutter_mobile/models/product.dart';
import 'package:desafio_flutter_mobile/models/productSolicitation.dart';
import 'package:mobx/mobx.dart';


part 'historicViewModel.g.dart';

class HistoricViewModel = HistoricViewModelBase with _$HistoricViewModel;

abstract class HistoricViewModelBase with Store{

  @observable
  String searchValue='';

  ObservableList<HistoricSolicitation> listNameClient=ObservableList<HistoricSolicitation>.of([]);

  ObservableList<HistoricSolicitation> shopPerDay= ObservableList <HistoricSolicitation>.of([
    HistoricSolicitation( DateTime.utc(2021,10,23),[
      ProductSolicitation(Client('Hanna Montana','images/hanna.png'),
          [Product('Cuscuz com calabresa, 1x s...','images/cuscuzSimples.png',2.25,['milho','arroz'])],
          5.5,[1,1]),
      ProductSolicitation(Client('Pablo Alvarez','images/hanna.png'),
          [Product('salgado, 1x pão de queijo.','images/cuscuzSimples.png',2.25,['milho','arroz'])],
          5.50,[2,1]),
      ProductSolicitation(Client('Andreia Barros','images/hanna.png'),
          [Product('misto quente, 1x pão com c...','images/cuscuzSimples.png',2.25,['milho','arroz'])],
          5.50,[2,1])
    ]),
    HistoricSolicitation( DateTime.utc(2021,10,22),[ProductSolicitation(Client('Hanna Montana','images/hanna.png'),
        [Product('misto quente, 1x pão com c...','images/cuscuzSimples.png',2.25,['milho','arroz'])],
        5.50,[2,1])])
  ]);


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


}

