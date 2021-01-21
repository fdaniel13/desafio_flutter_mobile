import 'package:desafio_flutter_mobile/models/groupProduct.dart';
import 'package:desafio_flutter_mobile/models/product.dart';
import 'package:desafio_flutter_mobile/models/productSolicitation.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';
import'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_svg/flutter_svg.dart';


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
    double sizeH = MediaQuery.of(context).size.height;

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

  Widget searchForm(BuildContext context){
    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    return TextFormField(
      onChanged: (val){

      },
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

  Widget checkedCard(List<String> opc,BuildContext context,Check _check,Function f,ProductViewModel productViewModel){



    return opc.isEmpty? Container(height: MediaQuery.of(context).size.height*0.2,):
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

                      f(value);
                      snackBarCustom(context,productViewModel);

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
                    f(value);

                    snackBarCustom(context,productViewModel);

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
      height:MediaQuery.of(context).size.height*0.11 ,
      decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
              color: Colors.grey[400]
          )
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
          style: GoogleFonts.openSans(
              color:colorText
          ),

        ),
        trailing: Text(price,
          style: GoogleFonts.openSans(
              color:colorText
          ),
        ),

      ),
    );
  }

  Widget customListProduct(GroupProduct groupProduct,{Product product,ProductViewModel productVM}){



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
      physics: NeverScrollableScrollPhysics(),
      itemCount:groupProductList.length ,
      separatorBuilder: (context,index){
        return Divider();
      },
      itemBuilder: (context,index){

        return customListProduct(groupProductList[index],product: product,productVM: productVM);
      },
    );
  }

  Widget customListHistoric(ProductSolicitation productSolicitation){

    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: productSolicitation.product.length,
        itemBuilder:(context,index){
          return index==0?Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: Text('Em ${productSolicitation.date.day}/${productSolicitation.date.month} você vendeu R\$ '
                    '${productSolicitation.totalPrice()} ',
                  style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:8.0),
                child: cardCustom(context,productSolicitation.client.name,productSolicitation.client.urlPicture,'${productSolicitation.product[index].price}',
                    Colors.white,
                  subText: 'x${productSolicitation.product[index].name}'
                ),
              )
            ],
          ): Padding(padding: const EdgeInsets.only(bottom:8.0),child:cardCustom(context,productSolicitation.product[index].name,productSolicitation.product[index].urlPicture,'${productSolicitation.product[index].price}',Colors.white));
        });
  }

  Widget customListGroupHistoric(List<ProductSolicitation> productSolicitation){

    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      itemCount:productSolicitation.length ,
      separatorBuilder: (context,index){
        return Divider();
      },
      itemBuilder: (context,index){

        return customListHistoric(productSolicitation[index]);
      },
    );
  }

  Widget steps(BuildContext context,{int nStep=1}){
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

  calendarDialog(BuildContext context,CalendarController cal) {
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


   snackBarCustom(BuildContext context, ProductViewModel productViewModel,{String page='productOptions'}){

      Scaffold.of(context).showSnackBar(
        page=='productOptions'?
        SnackBar(
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
        :
        SnackBar(
            duration: Duration(hours: 1),
            backgroundColor:Color(0xffFF8822),
            content: Observer(builder: (context){
              return   Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Total:R\$${productViewModel.quantity}',
                          style: GoogleFonts.openSans(
                              color: Colors.white,
                            fontWeight: FontWeight.w600
                          ),
                        ),
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


                      },
                    )
                  ],
                ),
              );
            })
        )



    );
  }

}

