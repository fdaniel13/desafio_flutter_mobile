import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/models/historicSolicitation.dart';
import 'package:desafio_flutter_mobile/models/product.dart';
import 'package:desafio_flutter_mobile/models/productSolicitation.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/viewModel/clientViewModel.dart';
import 'package:desafio_flutter_mobile/pages/historicPage/viewModel/historicViewModel.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';

class EndOrderedViewModel{


  // pegas a informações dos pedido e adiciona a lista de historico de pedidos
  //se há uma data já cadastrada adiciona o pedido ao conjunto de pedidos dessa data
  completeShop(ClientViewModel clientVM,ProductViewModel productVM,HistoricViewModel  historicVM) {

    List<Client> _client = clientVM.clientsSelected;

    String date = clientVM.data;

    List<Product> _prod = productVM.cartItems;

    List<int> _quantPro = productVM.quantityForItem;

    double _total = productVM.costTotal;

    List<String> dateList = date.split("/");
    DateTime dateT = DateTime(
        int.parse(dateList[2]), int.parse(dateList[1]), int.parse(dateList[0]));

    List<ProductSolicitation> listPro = [];


    int keyContain = -1;
    int key = 0;

    //Procura se a data ja ta resgistrada na lista
    //se sim keyContais assume o valor posição onde ela está
    historicVM.shopPerDay.forEach((element) {
      if (dateT == element.date) {
        keyContain = key;
      }
      key++;
    });

    //busca as datas já cadastradas
    _client.forEach((element) {

      //senão há a data cadastrada
      if (keyContain == -1) {
        listPro.add(ProductSolicitation(
            element, _prod, _total, _quantPro
        ));
      } else {
        historicVM.shopPerDay[keyContain].productSolicitation.add(ProductSolicitation(
            element, _prod, _total, _quantPro
        ));
      }

    });

    if (listPro.isNotEmpty) historicVM.addItem(HistoricSolicitation(dateT, listPro));
  }

}