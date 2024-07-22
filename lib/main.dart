import 'package:flutter/material.dart';
import 'package:flutter_vs_provider_correct_favourite_app/homepage.dart';
import 'package:flutter_vs_provider_correct_favourite_app/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
        FavouriteProvider(),
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    )
    );        
        
  }
}

