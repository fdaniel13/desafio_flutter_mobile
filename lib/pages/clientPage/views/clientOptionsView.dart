import 'package:desafio_flutter_mobile/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';




class ClientOptionsView extends StatefulWidget {
  @override
  _ClientOptionsViewState createState() => _ClientOptionsViewState();
}

class _ClientOptionsViewState extends State<ClientOptionsView>  with ComponentsPage{

  Check _check;
  CalendarController cal =CalendarController();

  @override
  Widget build(BuildContext context) {
    void checkState(value){
      setState(() {
        _check=value;
        //value==Check.option1?productVM.setOptionId(0):
        //value==Check.option2?productVM.setOptionId(1):
        //productVM.setOptionId(-1);
      });
    }

    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    return Scaffold(
      body:SingleChildScrollView(
          child:Container(
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
                          Navigator.of(context).pushReplacementNamed('/clientOrdered');

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
                    padding: EdgeInsets.only(top: sizeH*0.03,bottom: sizeH*0.01),
                    child:description(context,idText: 1)
                ),
                Container(
                  child:steps(context,nStep: 2),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:EdgeInsets.only(bottom: sizeH*0.03),
                        child: Text(
                            'O cliente já pagou?',
                            style: GoogleFonts.openSans(
                                fontWeight: FontWeight.w600,
                                fontSize: sizeH*0.023,
                                height:sizeH*0.0025
                            )),
                      ),
                      checkedCard(['Sim','Não'], context, _check, checkState)

                    ],
                  ),
                ),
                Container(
                  height: sizeH*0.32,

                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:EdgeInsets.only(bottom: sizeH*0.03,top: sizeH*0.03),
                            child: Text('Em que data o pedido foi realizado?',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600
                              ),),
                          ),
                          Container(width: sizeW*0.9,
                            height:sizeH*0.1 ,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: Colors.grey[400]
                                )
                            ),
                            child: ListTile(
                              title: Text('Selecione uma data',
                                style: GoogleFonts.openSans(
                                    color:  Colors.grey[600]
                                ),
                              ),
                              leading: Image.asset('images/calendario.png',
                                  color: Colors.grey[600]),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: Color(0xffFF8822)),
                              onTap: (){
                                calendarDialog(context, cal);
                              },

                            ),
                          ),
                        ],
                      ),
                      InkResponse(onTap: (){
                        if(cal.selectedDay==DateTime.now()){
                          print('não selecionado');
                        }


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
                                'FINALIZAR PEDIDO',
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
                    ],
                  ))


              ],
            ),
          )
      ),
    );
  }
}

