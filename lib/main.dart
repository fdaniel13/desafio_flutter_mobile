
import 'package:desafio_flutter_mobile/pages/login/view/loginView.dart';
import 'package:desafio_flutter_mobile/pages/ordered/view/ordered.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: [const Locale('pt', 'BR')],
    home: Ordered(),//LoginView(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      unselectedWidgetColor: Color(0xffFF8822),
      toggleableActiveColor: Color(0xffFF8822)
    ),
  ));
}


