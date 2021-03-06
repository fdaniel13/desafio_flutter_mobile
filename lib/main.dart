
import 'package:desafio_flutter_mobile/pages/clientPage/viewModel/clientViewModel.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/views/clientOptionsView.dart';
import 'package:desafio_flutter_mobile/pages/clientPage/views/clientView.dart';
import 'package:desafio_flutter_mobile/pages/endOrderedPage/views/endOrdered.dart';
import 'package:desafio_flutter_mobile/pages/historicPage/viewModel/historicViewModel.dart';
import 'package:desafio_flutter_mobile/pages/historicPage/views/historic.dart';
import 'package:desafio_flutter_mobile/pages/productPage/productView/productOptionsView.dart';
import 'package:desafio_flutter_mobile/pages/productPage/productView/productView.dart';
import 'package:desafio_flutter_mobile/pages/loginPage/view/loginView.dart';
import 'package:desafio_flutter_mobile/pages/productPage/viewModel/productViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(
    MultiProvider(
      providers: [
        Provider<HistoricViewModel>(create:(_)=>HistoricViewModel()),
        Provider<ProductViewModel>(create: (_)=> ProductViewModel()),
        Provider<ClientViewModel>(create: (_)=> ClientViewModel())


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
          '/clientOptions': (context)=>ClientOptionsView(),
          '/endOrdered':(context)=>EndOrdered()

        },
          home:LoginView(),
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
  ));
}


