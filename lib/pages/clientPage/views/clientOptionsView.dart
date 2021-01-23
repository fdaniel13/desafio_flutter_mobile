import 'package:desafio_flutter_mobile/components/components.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/viewModel/clientViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';




class ClientOptionsView extends StatefulWidget {
  @override
  _ClientOptionsViewState createState() => _ClientOptionsViewState();
}

class _ClientOptionsViewState extends State<ClientOptionsView>  with ComponentsPage{

  Check _check;
  CalendarController cal =CalendarController();

  void checkState(value,ClientViewModel clientVM){
    setState(() {
      _check=value;

    });
    value==Check.option1?clientVM.setOptionId(0):
    value==Check.option2?clientVM.setOptionId(1):
    clientVM.setOptionId(-1);
  }


  @override
  void dispose() {
    // TODO: implement dispose
    cal.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final clientVM = Provider.of<ClientViewModel>(context);





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
                          clientVM.resetButton();
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
                  child:steps(context,nStep: 3),
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
                      checkedCard(['Sim','Não'], context, _check, checkState,clientVM: clientVM)

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
                              title: Observer(
                                builder: (context){
                                  return Text(clientVM.data,
                                    style: GoogleFonts.openSans(
                                        color:  Colors.grey[600]
                                    ),
                                  );
                                },
                              ),
                              leading: Image.asset('images/calendario.png',
                                  color: Colors.grey[600]),
                              trailing: Icon(Icons.keyboard_arrow_right,
                                  color: Color(0xffFF8822)),
                              onTap: (){
                                calendarDialog(context, cal,clientVM);
                              },

                            )
                          ),
                        ],
                      ),
                      Observer(builder: (context){
                        return InkResponse(

                          onTap: (){

                            if(clientVM.buttonActivated){

                              Navigator.of(context).pushReplacementNamed('/endOrdered');
                            }


                          },
                          child: Container(
                            width: sizeW*0.9,
                            height: sizeH*0.08,
                            decoration: BoxDecoration(
                              color:clientVM.colorButton,
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
                        );
                      })
                    ],
                  ))


              ],
            ),
          )
      ),
    );
  }
}

