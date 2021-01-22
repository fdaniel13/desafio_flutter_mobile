
import 'package:desafio_flutter_mobile/pages/clientPage/viewModel/clientViewModel.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/views/clientView.dart';
import 'package:desafio_flutter_mobile/pages/homePage/view/historicView/historic.dart';
import 'package:desafio_flutter_mobile/pages/productPage/productView/productOptionsView.dart';
import 'package:desafio_flutter_mobile/pages/productPage/productView/productView.dart';
import 'package:desafio_flutter_mobile/pages/loginPage/view/loginView.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'pages/homePage/store/homeStore.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<HomeStore>(create:(_)=>HomeStore()),
        Provider<ProductViewModel>(create: (_)=> ProductViewModel())


      ],
      child: MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [const Locale('pt', 'BR')],
        routes: {
          '/loguin':(context)=>LoginView(),
          '/historic':(context)=>Historic(),
          '/itemOrdered':(context)=>ProductView(),
          '/itemOptions':(context)=>ProductOptionsView(),
          '/clientOrdered':(context)=>ClientView(),

        },
          home:Historic(),//Ordered(),// LoginView(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              unselectedWidgetColor: Color(0xffFF8822),
              toggleableActiveColor: Color(0xffFF8822),
              appBarTheme: AppBarTheme(
                  color: Color(0xffFAFAFA),
                  elevation: 0,
                  iconTheme:IconThemeData(
                      color: Color(0xffFF8822)
                  )
              )
          ),
        )),
  );
}


