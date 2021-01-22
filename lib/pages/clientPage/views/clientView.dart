import 'package:desafio_flutter_mobile/components/components.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/viewModel/clientViewModel.dart';
import 'package:desafio_flutter_mobile/pages/homePage/store/homeStore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';


class ClientView extends StatefulWidget {
  @override
  _ClientViewState createState() => _ClientViewState();
}

class _ClientViewState extends State<ClientView> with ComponentsPage {

 ClientViewModel  clientVM = ClientViewModel();


  @override
  Widget build(BuildContext context) {

    //final client = Provider.of<ClientViewModel>(context);
    final homeStore = Provider.of<HomeStore>(context);

    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    return Scaffold(

      bottomSheet: clientVM.stepComplete?Container(
        height: MediaQuery.of(context).size.height*0.08,
        width: MediaQuery.of(context).size.width,
        color: Color(0xffFF8822),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Total : R\$ ${clientVM.clientsSelected.length} selecionados',
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
                  )
                ],
              ),
            ),
            InkWell(
              child: Container(
                height: MediaQuery.of(context).size.height*0.08,
                width: MediaQuery.of(context).size.width*0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Avançar',
                      style: GoogleFonts.openSans(
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                      ),
                    ),
                    Icon(Icons.keyboard_arrow_right,
                        color: Colors.white
                    ),
                  ],
                ),
              ),
              onTap: (){
                //Navigator.of(context).pushReplacementNamed ('/clientOrdered');

              },
            )
          ],
        ),
      ):Container(width: 0,height: 0),
      body:SingleChildScrollView(
          child: Container(
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

                          Navigator.of(context).pushReplacementNamed('/itemOrdered');

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
                  child: title(context,idTitle:1),
                ),
                Container(
                    padding: EdgeInsets.only(top: sizeH*0.03,bottom: sizeH*0.01),
                    child:description(context)
                ),
                Container(
                  child:Column(
                    children: [
                      steps(context,nStep: 2),
                      searchForm(context)

                    ],
                  ),
                ),
                Observer(builder: (_){
                  return  Container(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: homeStore.clients.length,
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
                                  onTap: (){
                                    clientVM.clickLogic(homeStore.clients[index]);



                                  },
                                  child:cardCustom(context,
                                      homeStore.clients[index].name,homeStore.clients[index].urlPicture,
                                      '',
                                      clientVM.searchClient (homeStore.clients[index])?Color(0xffFF8822):Colors.white,
                                      colorText:  clientVM.searchClient (homeStore.clients[index])?Colors.white:Colors.black
                                  ),
                                ),
                              )
                            ],
                          ): Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: InkWell(
                              onTap: (){

                                clientVM.clickLogic(homeStore.clients[index]);


                              },
                              child:cardCustom(context,
                                  homeStore.clients[index].name,homeStore.clients[index].urlPicture,
                                  '',
                                  clientVM.searchClient (homeStore.clients[index])?Color(0xffFF8822):Colors.white,
                                  colorText: clientVM.searchClient (homeStore.clients[index])?Colors.white:Colors.black
                              ),
                            ),
                          );
                        }),
                  );
                }),
                Align(
                  alignment: Alignment.topRight,
                  child: FloatingActionButton(
                    backgroundColor: Color(0xffFF8822),
                    child: Icon(Icons.add),
                    onPressed: (){
                      clientVM.stepFinish();


                    },
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
