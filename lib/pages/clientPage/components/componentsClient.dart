import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/viewModel/clientViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

mixin ComponentsClient{


  Widget cardCustom(BuildContext context,String text,String urlImage,String price,
      Color cardColor,Color colorText){


    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      height:MediaQuery.of(context).size.height*0.105,

      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(width:0,color: Colors.white),

        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: MediaQuery.of(context).size.height*0.003,


          ),
        ],
      ),


      child: ListTile(
        title: Text(text,
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600,
              color:colorText
          ),
        ),
        leading: Container(
          width: MediaQuery.of(context).size.width*0.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(urlImage),
            ],
          ),
        ),
        trailing: Text(
          price.isNotEmpty?'R\$$price'.replaceAll('.',','):'',
          style: GoogleFonts.openSans(
              color:colorText
          ),
        ),

      ),
    );
  }

  Widget customListClients(List<Client> client,ClientViewModel clientVM){

    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: client.length,
        itemBuilder:(context,index){
          return index==0?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text('Meus clientes',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: InkWell(
                    onTap:  (){
                      if(clientVM.disableCardClient) clientVM.clickLogic(client[index]);
                    },
                    child:cardCustom(context,
                        client[index].name,client[index].urlPicture, '',
                        clientVM.cardClientColor (client[index]),
                        clientVM.textCardColor(client[index]))
                ),
              )
            ],
          ): Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: InkWell(
                onTap: (){
                  if(clientVM.disableCardClient) clientVM.clickLogic(client[index]);
                },
                child:cardCustom(context,
                    client[index].name,client[index].urlPicture, '',
                    clientVM.cardClientColor(client[index]),
                     clientVM.textCardColor(client[index]))
            ),
          );
        });
  }

  void  calendarDialog(BuildContext context,CalendarController cal,ClientViewModel clientVM) {
    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;
    String dropdownValue = DateTime.now().year.toString();


    showDialog(context: context,
        barrierColor: Colors.transparent,
        builder: (context){
          return Stack(
              children:[
                Positioned(
                  top: sizeH*0.09,
                  child: AlertDialog(
                    insetPadding: EdgeInsets.only(left: sizeW*0.05,right:sizeW*0.05 ),
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
                                width: sizeW*0.86,
                                height: sizeH*0.11,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Observer(builder: (context){
                                      return Text(clientVM.dataCalendar,
                                        style: GoogleFonts.openSans(
                                            fontWeight: FontWeight.w400,
                                            fontSize: sizeH*0.02
                                        ),
                                      );
                                    }),
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
                              TableCalendar(
                                onDaySelected: (date,list1,list2){
                                  clientVM.changeDataCalendar(cal);
                                },
                                rowHeight: 30,
                                calendarController: cal,
                                builders: CalendarBuilders(
                                  outsideDayBuilder:(context,date,_){
                                    return Container(

                                    );
                                  },
                                  outsideWeekendDayBuilder:(context,date,_){
                                    return Container(

                                    );
                                  }
                                  ,
                                  selectedDayBuilder:(context,date,_){
                                    return  Container(
                                      decoration: BoxDecoration(
                                        color:Color(0xffFF8822),
                                        shape: BoxShape.circle,
                                      ),
                                      child:Center(child: Text(date.day.toString(),
                                        style: GoogleFonts.openSans(),
                                      )),
                                    );
                                  },
                                  dayBuilder:(context,date,_){
                                    return Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(date.day.toString(),
                                            style: GoogleFonts.openSans(),

                                          ),
                                        ],
                                      ),
                                    );},
                                  dowWeekdayBuilder: (context,dayW){
                                    Characters  dayLetter= dayW.characters;
                                    dayW=dayW.replaceFirst (dayLetter.first, dayLetter.first.toUpperCase());
                                    return Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(dayW,style: GoogleFonts.openSans(),

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
                                    titleTextBuilder: (date, locale){
                                      String month =DateFormat.MMMM(locale).format(date);
                                      Characters  dayLetter= month.characters;
                                      month=month.replaceFirst (dayLetter.first, dayLetter.first.toUpperCase());
                                      return month;

                                    }

                                ),
                              )

                            ],
                          ),
                        );
                      },
                    ),
                    actions: [
                      InkWell(
                        onTap: (){
                          if(cal.selectedDay!=null){
                            clientVM.setDataSelect(cal.selectedDay);
                            Navigator.of(context).pop();
                          }
                        },
                        child: Observer(
                          builder: (_){
                            return Container(
                              width: sizeW*0.35,
                              height:sizeH*0.07 ,
                              decoration: BoxDecoration(
                                  color: clientVM.dataCalendar.isNotEmpty?Color.fromRGBO(255,136,34,1):Color.fromRGBO(255,136,34,0.5),
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
                            );
                          },
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