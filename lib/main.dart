import 'package:app_rick/futures/home/pages/home_page.dart';
import 'package:app_rick/futures/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        home: ChangeNotifierProvider(
            create: (_) => HomeProvider()..getCharacter(), child: const HomePage()));
  }
}
