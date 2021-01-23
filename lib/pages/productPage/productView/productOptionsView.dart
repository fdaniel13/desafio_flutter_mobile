import 'package:desafio_flutter_mobile/components/components.dart';
import 'package:desafio_flutter_mobile/pages/homePage/store/homeStore.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';
import'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class ProductOptionsView extends StatefulWidget {
  @override
  _ProductOptionsViewState createState() => _ProductOptionsViewState();
}

class _ProductOptionsViewState extends State<ProductOptionsView> with ComponentsPage{

  Check _check;
  void _checkState(value,ProductViewModel productVM){
    setState(() {
      _check=value;
    });
    value==Check.option1?productVM.setOptionId(0):
    value==Check.option2?productVM.setOptionId(1):
    productVM.setOptionId(-1);
  }


  @override
  Widget build(BuildContext context) {
    final productVM= Provider.of<ProductViewModel>(context);



    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;


    return  Scaffold(
      bottomNavigationBar: productVM.product.options.isEmpty?
      Container(
        height: MediaQuery.of(context).size.height*0.1,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(right: sizeW*0.05,left:sizeW*0.05 ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(icon:Icon(Icons.remove,
                  color: Colors.grey,
                ), onPressed: productVM.removeOne),
                Observer(
                  builder: (_){
                    return Text('${productVM.quantity}',
                      style: GoogleFonts.openSans(
                          color: Colors.black
                      ),
                    );
                  },
                ),
                IconButton(icon:Icon(Icons.add,
                  color: Colors.orange,
                ), onPressed: productVM.addOne)
              ],
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.5,
                margin: EdgeInsets.only(right: sizeW*0.02),
                decoration: BoxDecoration(
                    color: Color(0xffFF8822),
                    borderRadius:BorderRadius.circular(MediaQuery.of(context).size.width*0.01)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Adicionar',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                    Text('R\$${productVM.product.price}',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.white))
                  ],
                ),
              ),
              onTap: (){

                productVM.cart();

                Navigator.of(context).pushReplacementNamed ('/itemOrdered');

              },
            )
          ],
        ),
      ):Container(width: 0,height: 0),
      body:SingleChildScrollView(
          child: Observer(
            builder: (_){
              return Container(
                height:sizeH,
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
                              productVM.resetQuantity();
                               Navigator.pushReplacementNamed(context,'/itemOrdered');

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
                      child: title(context,idTitle:2),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: sizeH*0.03,bottom: sizeH*0.03),
                        child:description(context,idText: 1)
                    ),
                    Container(
                      child: Column(
                        children: [
                         cardCustom(context,productVM.product.name,productVM.product.urlPicture, 'R\$${productVM.product.price}', Colors.white),
                          Divider(),
                          productVM.product.options.isNotEmpty? Container(
                            height: sizeH*0.12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    'Opções',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: sizeH*0.023,
                                        height:sizeH*0.0025
                                    )),
                                Text(
                                    'Escolha uma das opções de massas disponíveis abaixo.',
                                    style: GoogleFonts.openSans(
                                        fontWeight: FontWeight.w400,
                                        fontSize: sizeH*0.023,
                                        height:sizeH*0.0025
                                    )),

                              ],
                            ),

                          ) :Container(height: sizeH*0.35,width: sizeW*0.9,),
                          Builder(
                              builder: (context)=>checkedCard(productVM.product.options,
                                  context,_check,_checkState,productViewModel: productVM)
                          )



                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top:sizeH*0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:EdgeInsets.only(bottom: sizeH*0.02),
                            child: Text(
                                'Observações',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: sizeH*0.023,
                                    height:sizeH*0.0025
                                )),
                          ),
                          TextFormField(
                            onChanged: productVM.changeObservations,
                            onTap: (){

                            },
                            onFieldSubmitted: (value){
                              print(productVM.observations);
                              print(productVM.opc);


                            },
                            decoration: InputDecoration(
                              hintText: 'Deseja adicionar alguma obs.?',
                              border: OutlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black45,
                                  )
                              ),
                            ),
                          )
                        ],
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
