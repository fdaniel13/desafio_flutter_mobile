import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';



class EndOrdered extends StatefulWidget {
  @override
  _EndOrderedState createState() => _EndOrderedState();
}

class _EndOrderedState extends State<EndOrdered> {
  @override
  Widget build(BuildContext context) {
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
                    child: SvgPicture.asset('images/pedidoFinalizado.svg'),
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
                          Navigator.of(context).pushReplacementNamed('/itemOrdered');

                        },
                          child: Container(
                            width: sizeW*0.9,
                            height: sizeH*0.08,
                            decoration: BoxDecoration(
                              color:Color.fromRGBO(255,136,34,0.5),
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
