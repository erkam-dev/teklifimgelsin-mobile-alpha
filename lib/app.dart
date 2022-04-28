import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data/data.dart';

class App extends MaterialApp {
  App({Key? key})
      : super(
            key: key,
            debugShowCheckedModeBanner: false,
            theme: tgLightTheme(),
            darkTheme: tgDarkTheme(),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator().generateRoute,
            scrollBehavior: const CupertinoScrollBehavior());
}
