import 'package:flutter/material.dart';
import 'package:online_shopping_app/cart_provider.dart';
import 'package:online_shopping_app/widget_pages/home_page_widget.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

ThemeData changeTheme = ThemeData(
  dialogBackgroundColor: const Color.fromARGB(49, 31, 11, 203),
  colorScheme:
      const ColorScheme.light(background: Color.fromARGB(255, 148, 148, 194)),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 180, 180, 222),
      // surfaceTintColor: Colors.pinkAccent,
      // backgroundColor: const Color.fromARGB(255, 224, 169, 187),
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontFamily: "TitleFont",
          color: Color.fromARGB(255, 15, 25, 213),
          fontSize: 40)),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CartProvider();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        theme: ThemeData(
          dialogBackgroundColor: const Color.fromARGB(255, 236, 177, 197),
          colorScheme: const ColorScheme.light(
              background: Color.fromARGB(255, 219, 205, 210)),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 219, 205, 210),
              // surfaceTintColor: Colors.pinkAccent,
              // backgroundColor: const Color.fromARGB(255, 224, 169, 187),
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontFamily: "TitleFont", color: Colors.pink, fontSize: 40)),
        ),
      ),
    );
  }
}
