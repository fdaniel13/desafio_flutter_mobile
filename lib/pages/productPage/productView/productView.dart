import 'package:desafio_flutter_mobile/components/components.dart';
import 'package:desafio_flutter_mobile/pages/historicPage/viewModel/homeStore.dart';
import 'package:desafio_flutter_mobile/pages/productPage/components/componentsProduct.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';




class ProductView extends StatefulWidget {
  @override
  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> with ComponentsPage,ComponentsProduct{





  @override
  Widget build(BuildContext context) {

    final homeStore = Provider.of<HomeStore>(context);
    final productVM= Provider.of<ProductViewModel>(context);

    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomSheet: productVM.cartItems.isNotEmpty?Container(
        height: MediaQuery.of(context).size.height*0.08,
        width: MediaQuery.of(context).size.width,
        color: Color(0xffFF8822),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Total : R\$ ${productVM.costTotal}'.replaceAll('.', ','),
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height*0.08,
                width: MediaQuery.of(context).size.width*0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Avançar',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right,
                        color: Colors.white
                    ),
                  ],
                ),
              ),
              onTap: (){
                Navigator.of(context).pushReplacementNamed ('/clientOrdered');

              },
            )
          ],
        ),
      ):Container(width: 0,height: 0),
      body:SingleChildScrollView(
        child: Observer(
          builder: (_){
            return Container(
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
                        searchForm(context,homeStore,2)

                      ],
                    ),
                  ),
                  homeStore.searchItems.isEmpty?
                  customListGroupProduct (homeStore.groupProduct,productVM:productVM):
                  customListGroupProduct (homeStore.listNameItem,productVM:productVM),
                ],
              ),
            );
          },
        )
      ),
    );
  }

}

