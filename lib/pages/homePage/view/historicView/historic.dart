import 'package:desafio_flutter_mobile/components/components.dart';
import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/models/historicSolicitation.dart';
import 'package:desafio_flutter_mobile/models/product.dart';
import 'package:desafio_flutter_mobile/models/productSolicitation.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/viewModel/clientViewModel.dart';
import 'package:desafio_flutter_mobile/pages/homePage/store/homeStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';



class Historic extends StatefulWidget {
  @override
  _HistoricState createState() => _HistoricState();
}

class _HistoricState extends State<Historic> with ComponentsPage{




  @override
  Widget build(BuildContext context) {
    final homeStore = Provider.of<HomeStore>(context);

    double sizeW =MediaQuery.of(this.context).size.width;
    double sizeH = MediaQuery.of(this.context).size.height;

    return Scaffold(
      body:SingleChildScrollView(

        child: Container(
            padding: EdgeInsets.only(right:sizeW*0.05, left:sizeW*0.05 ),
            color:Color(0xffFAFAFA),
            child: Column(

              children: [
                Column(
                  children: [
                    Container(
                      height: sizeH*0.1,
                    ),
                    Container(
                      width: sizeW,
                      height: sizeH*0.07,
                      child: title(context,idTitle:0),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: sizeH*0.03,bottom: sizeH*0.03),
                        child:plusOrder(context)
                    ),
                    Container(
                      child:Column(
                        children: [
                          searchForm(context,homeStore,1),


                        ],
                      ),
                    ),
                    Observer(
                      builder: (_){
                        return homeStore.searchValue.isEmpty?
                        customListGroupHistoric(homeStore.orderShopPerDayList)
                            : customListGroupHistoric(homeStore.listNameClient);

                      },
                    ),

                  ],
                ),

              ],
            )
        ),
      ),
    );
  }
}
