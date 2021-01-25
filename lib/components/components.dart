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
        init=homeStore.searchClient;
        _onChanged=homeStore.changeSearchClient;
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

}

