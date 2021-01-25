import 'package:desafio_flutter_mobile/components/components.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/components/componentsClient.dart';
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

class _ClientViewState extends State<ClientView> with ComponentsPage, ComponentsClient {



  @override
  Widget build(BuildContext context) {

    final clientVM = Provider.of<ClientViewModel>(context);
    final homeStore = Provider.of<HomeStore>(context);

    double sizeW =MediaQuery.of(context).size.width;
    double sizeH = MediaQuery.of(context).size.height;

    return Scaffold(

      bottomSheet: _bottomSheetCustom(sizeW,sizeH,clientVM),
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
                          clientVM.resetState();
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
                      searchForm(context,homeStore,3)

                    ],
                  ),
                ),
                Observer(builder: (_){
                  return  homeStore.searchClient.isEmpty?
                  Container(

                    child:  clientVM.listReactState?
                    customListClients(homeStore.clients,clientVM):
                    customListClients(homeStore.clients,clientVM),
                  ):
                  Container(
                    child:  clientVM.listReactState?
                    customListClients(homeStore.listSearchClient,clientVM):
                    customListClients(homeStore.listSearchClient,clientVM),
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

  Widget _bottomSheetCustom(double sizeW, double sizeH,ClientViewModel clientVM){

    return Observer(builder: (_){
      return clientVM.stepComplete?Container(
        height: MediaQuery.of(context).size.height*0.08,
        width: MediaQuery.of(context).size.width,
        color: Color(0xffFF8822),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(
                builder: (_){
                  return Text('${clientVM.clientsSelected.length} clientes selecionados',
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                    ),
                  );
                }
              )
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
                Navigator.of(context).pushReplacementNamed ('/clientOptions');

              },
            )
          ],
        ),
      ):Container(width: 0,height: 0);
    });
  }



}
