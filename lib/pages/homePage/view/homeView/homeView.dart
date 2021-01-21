import 'package:desafio_flutter_mobile/pages/homePage/store/homeStore.dart';
import 'package:desafio_flutter_mobile/pages/homePage/view/historicView/historic.dart';
import 'package:desafio_flutter_mobile/pages/productPage/productView/productOptionsView.dart';
import 'package:desafio_flutter_mobile/pages/productPage/productView/productView.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ProductViewModel>(create: (_)=> ProductViewModel())

      ],
      child: MaterialApp(
        routes: {'/itemOptions':(context)=>ProductOptionsView()},

        home:ProductView() ,)
    );
  }
}
