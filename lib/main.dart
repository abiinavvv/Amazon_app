import 'package:amazon_app/constant/global.dart';
import 'package:amazon_app/router.dart';
import 'package:amazon_app/view/auth/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) => generateRoute(settings),
      debugShowCheckedModeBanner: false,
      title: 'Amazon app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(primary: GlobalVariables.primaryColor),
        appBarTheme: AppBarTheme(
            backgroundColor: GlobalVariables.primaryColor,
            elevation: 0.0,
            foregroundColor: Colors.white),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: GlobalVariables.primaryColor,
                foregroundColor: Colors.white)),
      ),
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const Text(
            "Amazon",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Amazon"),
              Builder(builder: (context) {
                return ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AuthScreen.routeName);
                    },
                    child: const Text("Click me"));
              })
            ],
          ),
        ),
      ),
    );
  }
}
