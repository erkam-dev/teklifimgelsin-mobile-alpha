import 'package:flutter/material.dart';

AppBar tgAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.menu),
      onPressed: () {},
    ),
    title: Image.asset(
      MediaQuery.of(context).platformBrightness == Brightness.light
          ? "assets/images/light_logo.png"
          : "assets/images/dark_logo.png",
      scale: 3,
    ),
  );
}
