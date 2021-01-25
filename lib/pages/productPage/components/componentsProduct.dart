import 'package:desafio_flutter_mobile/models/groupProduct.dart';
import 'package:desafio_flutter_mobile/models/product.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin ComponentsProduct{



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

}