import 'package:flutter/material.dart';
import "package:carrotmarket_app/theme.dart";
import "package:carrotmarket_app/screens/screen_all.dart";
import 'package:provider/provider.dart';
import 'package:carrotmarket_app/providers/provider_all.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => ChatMessageProvider()),
      ],
      child: MaterialApp(
        title: 'carrot_market',
        debugShowCheckedModeBanner: false,
        theme: globalTheme(),
        initialRoute: "/index", //* /
        routes: {
          // '/': (context) => SplashScreen(),
          '/index': (context) => IndexScreen(),
        },
      ),
    );
  }
}
