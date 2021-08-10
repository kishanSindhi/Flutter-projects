import 'package:flutter/material.dart';
import 'package:sasta_app/pages/cart_page.dart';
import 'package:sasta_app/pages/home_page.dart';
import 'package:sasta_app/utils/routs.dart';
import 'package:sasta_app/widgets/theme.dart';
import 'package:velocity_x/velocity_x.dart';

import 'core/store.dart';
import 'pages/login_page.dart';

void main() {
  runApp(VxState(store: MyStore(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      // darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRouts.homeRout,
      routes: {
        "/": (context) => LoginPage(),
        MyRouts.loginRout: (context) => LoginPage(),
        MyRouts.homeRout: (context) => HomePage(),
        MyRouts.cartRoute: (context) => CartPage(),
        // MyRouts.homeDetailRoute: (context) =>
      },
    );
  }
}
