import 'package:desafio_flutter_mobile/models/cliente.dart';
import 'package:desafio_flutter_mobile/models/groupProduct.dart';
import 'package:desafio_flutter_mobile/models/historicSolicitation.dart';
import 'package:desafio_flutter_mobile/models/product.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/viewModel/clientViewModel.dart';
import 'package:desafio_flutter_mobile/pages/homePage/store/homeStore.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';
import'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quiver/strings.dart';


enum Check{
  option1,
  option2
}


mixin ComponentsPage{


  Widget title (BuildContext context,{int idTitle=1}){
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

  Widget plusOrder(BuildContext context){
    double sizeW =MediaQuery.of(context).size.width;

    return  InkWell(
      onTap: (){
        //viewModel
        Navigator.pushReplacementNamed(context,'/itemOrdered');
      },
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

  Widget description(BuildContext context,{int idText=0}){

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

  Widget searchForm(BuildContext context,HomeStore homeStore,int pag ){
    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    String init='';
    Function _onChanged;

    switch(pag){
      case 1:
        init=homeStore.searchValue;
        _onChanged=homeStore.changeSearchValue;
        break;
      case 2:
        init=homeStore.searchItems;
        _onChanged=homeStore.changeSearchItem;
        break;
      case 3:
        init='';
        _onChanged=(value){};
        break;

    }

    return TextFormField(
      initialValue:init,
      onChanged:_onChanged,
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

  Widget checkedCard(List<String> opc,BuildContext context,Check _check,Function f,{ProductViewModel productViewModel,ClientViewModel clientVM}){



    return opc.isEmpty? Container(height:0,width: 0,):
    Column(
      children: [
        Container(width: MediaQuery.of(context).size.width*0.9,
          height:MediaQuery.of(context).size.height*0.1 ,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
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
                Radio<Check>(
                  value: Check.option1,
                  groupValue: _check,
                  onChanged: (value){



                      if(productViewModel!=null) {
                        snackBarCustom(context,productViewModel);
                        f(value,productViewModel);
                      }else f(value,clientVM);

                  },
                )
              ],
            ),

          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width*0.9,
          height:MediaQuery.of(context).size.height*0.1 ,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                  color: Colors.grey[400]
              )
          ),
          margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.008 ),

          child: ListTile(
            title: Text(opc[1],
              style: GoogleFonts.openSans(),
            ),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Radio<Check>(
                  value: Check.option2,
                  groupValue: _check,
                  onChanged: (value){


                    if(productViewModel!=null) {
                      snackBarCustom(context,productViewModel);
                      f(value,productViewModel);
                    }else f(value,clientVM);

                  },
                )
              ],
            ),

          ),
        ),
      ],
    );
  }

  Widget cardCustom(BuildContext context,String text,String urlImage,String price,Color cardColor,{String subText='',Color colorText=Colors.black}){


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
        subtitle: Text(subText,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.openSans(
              color:colorText
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

  Widget customListProduct(GroupProduct groupProduct,Product product,ProductViewModel productVM){



    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: groupProduct.product.length,
        itemBuilder:(context,index){
          return index==0?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text(groupProduct.name,
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
                  onTap: (){
                    productVM.changeProduct(groupProduct.product[index]);
                    Navigator.of(context).pushReplacementNamed('/itemOptions');
                  },
                  child:cardCustom(context,
                      groupProduct.product[index].name,groupProduct.product[index].urlPicture,
                      '${groupProduct.product[index].price}',
                      productVM.searchProduct(groupProduct.product[index])?Color(0xffFF8822):Colors.white,
                    subText: groupProduct.product[index].options.isNotEmpty?
                    '${groupProduct.product[index].options[0]} ou ${groupProduct.product[index].options[1]} ':'',
                    colorText:  productVM.searchProduct(groupProduct.product[index])?Colors.white:Colors.black
                  ),
                ),
              )
            ],
          ): Padding(
            padding: const EdgeInsets.only(bottom:8.0),
            child: InkWell(
              onTap: (){

                productVM.changeProduct(groupProduct.product[index]);
                Navigator.of(context).pushReplacementNamed('/itemOptions');


              },
              child: cardCustom(context,groupProduct.product[index].name,groupProduct.product[index].urlPicture,
                  '${groupProduct.product[index].price}',
                  productVM.searchProduct(groupProduct.product[index])?Color(0xffFF8822):Colors.white,
                  subText:groupProduct.product[index].options.isNotEmpty?
                  '${groupProduct.product[index].options[0]} ou ${groupProduct.product[index].options[1]} ':'',
                  colorText:  productVM.searchProduct(groupProduct.product[index])?Colors.white:Colors.black
              ),
            ),
          );
        });
  }

  Widget customListGroupProduct(List<GroupProduct> groupProductList,{Product product,ProductViewModel productVM }){


    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount:groupProductList.length ,
      separatorBuilder: (context,index){
        return Divider();
      },
      itemBuilder: (context,index){

        return customListProduct(groupProductList[index],product, productVM);
      },
    );
  }

  Widget customListHistoric(HistoricSolicitation historicSolicitation){


    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: historicSolicitation.productSolicitation.length,
        itemBuilder:(context,index){

          var historicP = historicSolicitation.productSolicitation[index];

          return index==0?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text('Em ${historicSolicitation.date.day}/${historicSolicitation.date.month} você vendeu R\$ '
                    '${historicSolicitation.totalPerDay.toString().replaceAll('.',',')} ',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: cardCustom(context,historicP.client.name,historicP.client.urlPicture,
                    '${historicP.total}',
                    Colors.white,
                  subText: '${historicP.infoShop}'

                ),
              )
            ],
          ): Padding(padding: const EdgeInsets.only(bottom:8.0),
              child:cardCustom(context,historicP.client.name,historicP.client.urlPicture,
                  '${historicP.total}',
                  Colors.white,
                  subText: '${historicP.infoShop}'
              ),);
        });
  }

  Widget customListGroupHistoric(List<HistoricSolicitation> historicList){


    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      reverse: true,
      itemCount:historicList.length ,
      separatorBuilder: (context,index){
        return Divider();
      },
      itemBuilder: (context, index){

        return customListHistoric(historicList[index]);
      },
    );
  }




  Widget steps(BuildContext context,{int nStep=1}){

    List<String> textTitle=[
      'O que você está vendendo?',
      'Para quem você está vendendo?',
      'Finalizar pedido'

    ];
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
                  textTitle[nStep-1],
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w600
                  ),
                ),
                Text('${nStep} de 3',
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

  calendarDialog(BuildContext context,CalendarController cal,ClientViewModel clientVM) {
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
                          clientVM.setDataSelect(cal.selectedDay);
                          Navigator.of(context).pop();
                        },
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


   snackBarCustom(BuildContext context, ProductViewModel productViewModel){

      Scaffold.of(context).showSnackBar(

        SnackBar(
        duration: Duration(hours: 1),
            backgroundColor:Colors.white,
            content:Observer(
              builder: (_){
                return Container(
                  height: MediaQuery.of(context).size.height*0.07,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(icon:Icon(Icons.remove,
                            color: Colors.grey,
                          ), onPressed: productViewModel.removeOne),
                          Text('${productViewModel.quantity}',
                            style: GoogleFonts.openSans(
                                color: Colors.black
                            ),
                          ),
                          IconButton(icon:Icon(Icons.add,
                            color: Colors.orange,
                          ), onPressed: productViewModel.addOne)
                        ],
                      ),
                      InkWell(
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.07,
                          width: MediaQuery.of(context).size.width*0.5,
                          decoration: BoxDecoration(
                              color: Color(0xffFF8822),
                              borderRadius:BorderRadius.circular(MediaQuery.of(context).size.width*0.01)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Adicionar',
                                style: GoogleFonts.openSans(
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                              Text('R\$${productViewModel.product.price}')
                            ],
                          ),
                        ),
                        onTap: (){

                          productViewModel.cart();
                          Navigator.of(context).pushReplacementNamed ('/itemOrdered');

                        },
                      )
                    ],
                  ),
                );
              },
            )
        )



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
                       colorText: clientVM.textCardColor(client[index]))
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
               colorText: clientVM.textCardColor(client[index]))
             ),
           );
         });
   }

}

