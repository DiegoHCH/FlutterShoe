import 'package:flutter/material.dart';
import 'package:flutter_shoes/view/home_view.dart';
import 'package:flutter_shoes/viewmodels/shoe/shoe_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ShoeViewModel())
    ],
    child: const MyApp()
  ));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: HomeView()
    );
  }
}
