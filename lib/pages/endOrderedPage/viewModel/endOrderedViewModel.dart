


import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/models/product.dart';
import 'package:desafio_flutter_mobile/models/productSolicitation.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/viewModel/clientViewModel.dart';
import 'package:desafio_flutter_mobile/pages/homePage/store/homeStore.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';

class EndOrderedViewModel{



  completeShop(ClientViewModel clientVM,ProductViewModel productVM,HomeStore  homeStore){
    List<Client> _client = clientVM.clientsSelected;
    String date =clientVM.data;
    List<Product> _prod = productVM.cartItems;
    List<int> _quantPro =productVM.quantityForItem;
    double _total = productVM.costTotal;

    List<String> dateList = date.split("/");

    _client.forEach((element) {
      homeStore.addItem(ProductSolicitation(
        element,_prod,DateTime(int.parse(dateList[2]),int.parse(dateList[1]),int.parse(dateList[0])),_total
      ));

    });



  }



}