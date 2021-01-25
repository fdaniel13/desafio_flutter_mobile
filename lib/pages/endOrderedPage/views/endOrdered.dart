import 'package:desafio_flutter_mobile/pages/clientPage/viewModel/clientViewModel.dart';
import 'package:desafio_flutter_mobile/pages/endOrderedPage/viewModel/endOrderedViewModel.dart';
import 'package:desafio_flutter_mobile/pages/historicPage/viewModel/homeStore.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



class EndOrdered extends StatefulWidget {
  @override
  _EndOrderedState createState() => _EndOrderedState();
}

class _EndOrderedState extends State<EndOrdered> {

  EndOrderedViewModel endOVM = EndOrderedViewModel();




  @override
  Widget build(BuildContext context) {
    final clientVM= Provider.of<ClientViewModel>(context);
    final productVM =Provider.of<ProductViewModel>(context);
    final homeStore =Provider.of<HomeStore>(context);

    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      body:SingleChildScrollView(
          child:Container(
            height:sizeH,
            width: sizeW,
            padding: EdgeInsets.only(right:sizeW*0.05, left:sizeW*0.05 ),
            color:Color(0xffFAFAFA),
            child:Stack(

              children: [
                Center(
                  child: SizedBox(
                    width: sizeW*0.7,
                    height: sizeH*0.4,
                    child: Column(
                     children: [
                       Image.asset('images/logoFinal.png'),
                       Text('Pedido realizado!',
                       style:GoogleFonts.openSans(
                         fontWeight: FontWeight.w400,
                         fontSize: sizeH*0.04

                       ))
                     ],
                    )
                  ),
                ),
                Positioned(
                  bottom: sizeH*0.02,
                  child: Container(
                    height: sizeH*0.22,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkResponse(onTap: (){

                          endOVM.completeShop(clientVM, productVM, homeStore);

                          productVM.resetSate();
                          clientVM.resetState();

                          Navigator.of(context).pushReplacementNamed('/itemOrdered');

                        },
                          child: Container(
                            width: sizeW*0.9,
                            height: sizeH*0.08,
                            decoration: BoxDecoration(
                              color:Color.fromRGBO(255,136,34,1),
                              borderRadius: BorderRadius.circular(sizeH*0.05),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'FAZER NOVO PEDIDO',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffFFFFFF),
                                          fontSize: sizeH*0.025
                                      )

                                  ),

                                )
                              ],
                            ),
                          ),
                        ),
                        InkResponse(onTap: (){

                          endOVM.completeShop(clientVM, productVM, homeStore);

                          productVM.resetSate();
                          clientVM.resetState();

                          Navigator.of(context).pushReplacementNamed('/historic');

                        },
                          child: Container(
                            width: sizeW*0.9,
                            height: sizeH*0.08,
                            decoration: BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(sizeH*0.05),
                                border: Border.all(
                                    color: Color(0xffB8CC3B),
                                    width: sizeW*0.005
                                )
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'VOLTAR PARA A PÁGINA INICIAL',
                                  style: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xffB8CC3B),
                                          fontSize: sizeH*0.025
                                      )

                                  ),

                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            )
          )
      ),
    );
  }
}
