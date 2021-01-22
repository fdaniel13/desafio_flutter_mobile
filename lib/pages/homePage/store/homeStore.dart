import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/models/groupProduct.dart';
import 'package:desafio_flutter_mobile/models/product.dart';
import 'package:desafio_flutter_mobile/models/productSolicitation.dart';
import 'package:mobx/mobx.dart';


part 'homeStore.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store{

  @observable
  ObservableList<ProductSolicitation> historicProduct=[
    ProductSolicitation(Client('fabio','images/bairanMask.png'),
        [Product('Cuzcuz','images/cuscuzSimples.png',2.25,['milho','arroz']),
          Product('Cuzcuz','images/cuscuzSimples.png',2.25,['milho','arroz'])],
        DateTime.utc(2021,1)),
    ProductSolicitation(Client('fabio','images/bairanMask.png'),
        [Product('Cuzcuz','images/cuscuzSimples.png',2.25,['milho','arroz'])],
        DateTime.utc(2021,1)),
  ].asObservable();

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
  addItem(ProductSolicitation productSolicitation){

    historicProduct.add(productSolicitation);
  }

}

