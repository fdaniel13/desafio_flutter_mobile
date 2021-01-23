import 'package:desafio_flutter_mobile/models/productSolicitation.dart';

class HistoricSolicitation{

  DateTime date;
  List<ProductSolicitation> productSolicitation;


  HistoricSolicitation(this.date,this.productSolicitation);


  get totalPerDay{
    double totalDay=0;
      productSolicitation.forEach((element) {
        totalDay+=element.total;
      });

      return totalDay;


  }
}