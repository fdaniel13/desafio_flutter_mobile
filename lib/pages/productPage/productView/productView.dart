import 'package:desafio_flutter_mobile/components/components.dart';
import 'package:desafio_flutter_mobile/pages/homePage/store/homeStore.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';



class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> with ComponentsPage{





  @override
  Widget build(BuildContext context) {

    final homeStore = Provider.of<HomeStore>(context);
    final productVM= Provider.of<ProductViewModel>(context);

    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      body:SingleChildScrollView(
        child: Observer(
          builder: (_){
            return Container(
              height:1.55*sizeH,
              width: sizeW,
              padding: EdgeInsets.only(right:sizeW*0.05, left:sizeW*0.05 ),
              color:Color(0xffFAFAFA),
              child: Column(
                children: [
                  Container(
                    height: sizeH*0.06,
                    width: sizeW,
                    margin: EdgeInsets.only(top: sizeH*0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            productVM.resetSate();
                            Navigator.of(context).pushReplacementNamed('/historic');

                          },
                          icon: Icon(Icons.keyboard_arrow_left,
                            color: Color(0xffFF8822),
                          ),

                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: sizeW,
                    height: sizeH*0.07,
                    child: title(context,idTitle:1),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: sizeH*0.03,bottom: sizeH*0.03),
                      child:description(context)
                  ),
                  Container(
                    child:Column(
                      children: [
                        steps(context),
                        searchForm(context)

                      ],
                    ),
                  ),
                  Expanded(
                    child:Container(

                      padding: EdgeInsets.only(top:sizeH*0.03),
                      child:customListGroupProduct (homeStore.groupProduct,productVM:productVM),
                    ),
                  ),
                ],
              ),
            );
          },
        )
      ),
    );
  }

}

