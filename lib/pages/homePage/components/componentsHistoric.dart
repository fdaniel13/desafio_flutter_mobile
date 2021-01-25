import 'package:desafio_flutter_mobile/models/groupProduct.dart';
import 'package:desafio_flutter_mobile/models/historicSolicitation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

mixin ComponentsHistoric{

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

  Widget cardCustom(BuildContext context,String text,String urlImage,String price,
      Color cardColor,{String subText='',Color colorText=Colors.black}){


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
                    '${historicSolicitation.totalPerDay.toStringAsFixed(2).replaceAll('.',',')} ',
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
                    '${historicP.total.toStringAsFixed(2)}',
                    Colors.white,
                    subText: '${historicP.infoShop}'

                ),
              )
            ],
          ): Padding(padding: const EdgeInsets.only(bottom:8.0),
            child:cardCustom(context,historicP.client.name,historicP.client.urlPicture,
                '${historicP.total.toStringAsFixed (2)}',
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
}