

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


enum Marcado {opc1,opc2}

class Ordered extends StatefulWidget {

  @override
  _OrderedState createState() => _OrderedState();
}

class _OrderedState extends State<Ordered> {

  Marcado _marcado;
  CalendarController cal=CalendarController();


 bool scroolState=false;


  @override
  Widget build(BuildContext context) {
    double sizeW =MediaQuery.of(this.context).size.width;
    double sizeH = MediaQuery.of(this.context).size.height;


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFAFAFA),
        toolbarHeight: sizeH*0.07,
      ),
      body:SingleChildScrollView(
        physics: scroolState==false? NeverScrollableScrollPhysics():AlwaysScrollableScrollPhysics(),
        child: Container(
          height: 2*sizeH,
          width: sizeW,
          padding: EdgeInsets.only(right:sizeW*0.05, left:sizeW*0.05 ),
          color:Color(0xffFAFAFA),
          child: IndexedStack(
            index: 2,

            children: [
              Column(
                children: [
                  Container(
                    width: sizeW,
                    height: sizeH*0.07,
                    child: _title(context,idTitle:0),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: sizeH*0.03,bottom: sizeH*0.03),
                    child:_plusOrder(context)
                  ),
                  Container(
                    child:Column(
                      children: [
                        _searchForm(context)

                      ],
                    ),
                  ),
                  Container(
                width: sizeW,
                height: sizeH*0.56,
                padding: EdgeInsets.only(top:sizeH*0.03),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.separated(
                        itemCount:2 ,
                        separatorBuilder: (context,index){
                          return Divider();
                        },
                        itemBuilder: (context,index){

                          return _customListProduct(['Cuscuz simples','Cuscuz Completo'],'Cuscuz');
                          },
                        )
                    ),
                  ],
                ),
              ),

                ],
              ),
              Column(
                children: [
                  Container(
                    width: sizeW,
                    height: sizeH*0.07,
                    child: _title(context,idTitle:1),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: sizeH*0.03,bottom: sizeH*0.03),
                      child:_description(context)
                  ),
                  Container(
                    child:Column(
                      children: [
                        _steps(context),
                        _searchForm(context)

                      ],
                    ),
                  ),
                  Container(
                    width: sizeW,
                    height: sizeH*0.56,
                    padding: EdgeInsets.only(top:sizeH*0.03),
                    child: Column(
                      children: [
                        Expanded(
                            child: ListView.separated(
                              itemCount:2 ,
                              separatorBuilder: (context,index){
                                return Divider();
                              },
                              itemBuilder: (context,index){

                                return _customListProduct(['Cuscuz simples','Cuscuz Completo'],'Cuscuz');
                              },
                            )
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              Column(
                children: [
                  Container(
                    width: sizeW,
                    height: sizeH*0.07,
                    child: _title(context,idTitle:2),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: sizeH*0.03,bottom: sizeH*0.03),
                      child:_description(context,idText: 1)
                  ),
                  Container(
                    child:Column(
                      children: [
                        _cardCustom('Lingua','images/lingua.png','R\$3,75',Colors.white),
                        Divider(),
                        Container(
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
                        ),
                        _checkedCard(_marcado, (['milho','arroz'])),

                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: Container(
                      width: sizeW,
                      height: sizeH*0.56,
                      padding: EdgeInsets.only(top:sizeH*0.03),
                      child: Column(
                        children: [
                          Expanded(
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
                                    onTap: (){
                                      setState(() {
                                        scroolState=true;
                                      });
                                    },
                                    onFieldSubmitted: (value){
                                      setState(() {
                                        scroolState=false;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Deseja adicionar alguma obs.?',
                                      border: OutlineInputBorder()
                                    ),
                                  )
                                ],
                              )
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

            ],
          )
        ),
      ),
    );
  }

  Widget _title (BuildContext context,{int idTitle=1}){
    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    List<String> _title =['Olá, Alessandra!',
      'Informações para o pedido',
      'Detalhes do pedido'
    ];

   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
     Text(
     _title[idTitle],
     style: GoogleFonts.openSans(
       color: Color(0xffE57A1F),
       fontWeight: FontWeight.w400,
       fontSize:sizeH*0.04
        ),
      ),
       SizedBox(
         width: sizeW*0.7,
         child: DecoratedBox(
           decoration: BoxDecoration(
               border: Border(
                   bottom: BorderSide(
                     color: Color(0xffB8CC3B),
                   )
               )
           ),
         ),
       ),
     ],
   );
  }

  Widget _plusOrder(BuildContext context){
    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    return  InkWell(
      child: Card(
        elevation: 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:EdgeInsets.all(sizeW*0.06),
              child: SvgPicture.asset('images/plus.svg'),
            ),
            Text(
              'FAZER NOVO PEDIDO',
              style: GoogleFonts.openSans(

              ),
            )
          ],
        ),

      ),
    );
  }

  Widget _description(BuildContext context,{int idText=0}){

    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    List<String> _text =['Preencha as informações abaixo para concluir o pedido.',
      'caso queira, aproveite para adicionar alguma observação para este pedido.',
      'Preencha as informações abaixo para concluir o pedido.'];

    return Text(
      _text[idText],
      style: GoogleFonts.openSans(
          fontWeight: FontWeight.w400,
          fontSize: sizeH*0.023,
          height:sizeH*0.0025
      ),
    );
  }

  Widget _searchForm(BuildContext context){
    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    return TextFormField(
      cursorColor: Color(0xffFF8822),
      decoration: InputDecoration(
        hintText:'Digite a sua busca aqui',
        prefixIconConstraints: BoxConstraints(
          minHeight: sizeH*0.072,
          minWidth: sizeW*0.072,
        ),
        focusedBorder:UnderlineInputBorder(
            borderSide: BorderSide(
                color:  Colors.black54
            )
        ) ,
        prefixIcon: SvgPicture.asset('images/seach.svg',
          fit: BoxFit.scaleDown,
          color: Color(0xffFF8822),
        ),
      ),

    );
  }

  Widget _checkedCard(Marcado marcado,List<String> opc){


    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(
                  color: Colors.grey[400]
              )
          ),
          child: ListTile(
            title: Text(opc[0],
              style: GoogleFonts.openSans(),
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio<Marcado>(
                  value: Marcado.opc2,
                  groupValue: _marcado,
                  onChanged: (value){

                    setState(() {
                      _marcado=value;
                    });


                  },
                )
              ],
            ),

          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
              side: BorderSide(
                  color: Colors.grey[400]
              )
          ),

          child: ListTile(
            title: Text(opc[1],
              style: GoogleFonts.openSans(),
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio<Marcado>(
                  value: Marcado.opc1,
                  groupValue: _marcado,
                  onChanged: (value){
                    setState(() {
                      _marcado=value;
                    });

                  },
                )
              ],
            ),

          ),
        ),
      ],
    );
  }

  Widget _cardCustom(String text,String urlImage,String price,Color cardColor,{String subText=''}){
    return Card(
      color: cardColor,
      child: ListTile(
        title: Text(text,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w600
          ),
        ),
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(urlImage),
          ],
        ),
        subtitle: Text(subText,
          style: GoogleFonts.openSans(),
        ),
        trailing: Text(price,
          style: GoogleFonts.openSans(),
        ),

      ),
    );
  }

  Widget _customListProduct(List<String> product,String category){

    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: product.length,
        itemBuilder:(context,index){
          return index==0?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text(category,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600
                    )
                  ),
                ),
              ),
              _cardCustom(product[index],'images/lingua.png','R\$3,75',Colors.white)
            ],
          ): _cardCustom(product[index],'images/lingua.png','R\$3,75',Colors.white);
        });
  }

  Widget _steps(BuildContext context,{int nStep=1}){
    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;
    return  Padding(
      padding:EdgeInsets.only(bottom: sizeH*0.03),
      child: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'O que você está vendendo?',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text('1 de 3',
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400
                  ),)
              ],
            ),
          ),
          Container(
            height: sizeH*0.02,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                borderRadius: BorderRadius.circular(sizeW*0.05)
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: nStep*(sizeW*0.9)/3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFF8822),
                      borderRadius: BorderRadius.circular(sizeW*0.05)
                  ),

                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  Widget _calendarDialog(BuildContext context,CalendarController cal) {
    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;
    String dropdownValue = DateTime.now().year.toString();

    showDialog(context: context,
        barrierColor: Colors.white,
        builder: (context){

          return Stack(
              children:[
                Positioned(
                  top: sizeH*0.05,
                  child: AlertDialog(
                    insetPadding: EdgeInsets.only(left: sizeW*0.05,right:sizeW*0.05 ),
                    //buttonPadding: EdgeInsets.zero,
                    contentPadding: EdgeInsets.only(bottom: 0),
                    elevation: 2,
                    content: StatefulBuilder(
                      builder: (context,  setState){
                        return Container(
                          width: sizeW*0.9,
                          height: sizeH*0.5,
                          child: Column(
                            children: [
                              SizedBox(
                                width: sizeW*0.9,
                                height: sizeH*0.11,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cal.selectedDay.toString(),
                                      style: GoogleFonts.openSans(
                                          fontWeight: FontWeight.w400,
                                          fontSize: sizeH*0.02
                                      ),
                                    ),
                                    DropdownButton(
                                        value:dropdownValue,
                                        iconEnabledColor: Color(0xffFF8822),
                                        iconDisabledColor: Color(0xffFF8822),
                                        underline: Container(
                                          height: 0,
                                        ),
                                        items: <String>['${DateTime.now().year}', '${DateTime.now().year+1}',
                                          '${DateTime.now().year+2}', '${DateTime.now().year+3}',
                                          '${DateTime.now().year+4}']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                      fontWeight: FontWeight.w400,
                                                      fontSize: sizeH*0.03,
                                                      color: Color(0xffFF8822)
                                                  )
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (newValue){
                                          setState(
                                                  (){
                                                dropdownValue=newValue;
                                                cal.setFocusedDay(DateTime.utc(int.parse(newValue)));
                                              }
                                          );



                                        }),
                                  ],
                                ),
                              ),

                              SizedBox(
                                  width: sizeW*0.9,
                                  //height: sizeH*0.5,
                                  child: TableCalendar(
                                    rowHeight: 30,
                                    calendarController: cal,
                                    builders: CalendarBuilders(
                                      selectedDayBuilder:(context,date,_){
                                        return Container(
                                          width: sizeW*0.0005,
                                          height: sizeH*0.0005,

                                          decoration: BoxDecoration(
                                              color:Color(0xffFF8822),
                                              borderRadius: BorderRadius.circular(sizeW*0.1)
                                          ),
                                          child:Center(child: Text(date.day.toString(),
                                            style: GoogleFonts.openSans(),
                                          )),
                                        );
                                      },
                                      dayBuilder:(context,date,_){
                                        return Container(
                                          width: sizeW*0.0005,
                                          height: sizeH*0.0005,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(date.day.toString(),
                                                style: GoogleFonts.openSans(),

                                              ),
                                            ],
                                          ),
                                        );},
                                      dowWeekdayBuilder: (context,s){
                                        return Container(
                                          width: 15,
                                          height: 25,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(s,
                                                style: GoogleFonts.openSans(),

                                              ),
                                            ],
                                          ),
                                        );
                                      },

                                    ),
                                    locale: 'pt-br',
                                    availableCalendarFormats:{CalendarFormat.month: 'Month'},
                                    headerStyle: HeaderStyle(
                                      leftChevronMargin: EdgeInsets.zero,
                                      rightChevronMargin: EdgeInsets.zero,
                                      leftChevronPadding: EdgeInsets.zero,
                                      rightChevronPadding: EdgeInsets.zero,
                                      leftChevronIcon: Icon(Icons.chevron_left,
                                        color:Color(0xffFF8822),
                                      ),
                                      rightChevronIcon: Icon(Icons.chevron_right,
                                        color:Color(0xffFF8822),
                                      ),
                                      centerHeaderTitle: true,

                                    ),
                                  )
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    actions: [
                      InkWell(
                        child: Container(
                          width: sizeW*0.35,
                          height:sizeH*0.07 ,
                          decoration: BoxDecoration(
                              color: Color(0xffFF8822),
                              borderRadius: BorderRadius.circular(sizeW*0.09)
                          ),
                          child: Center(
                            child: Text('CONFIRMAR',
                              style: GoogleFonts.openSans(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      )
                    ],


                  ),
                ),
              ]
          );
        });

  }

}

