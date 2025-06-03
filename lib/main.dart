import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plants/button.dart';
import 'package:plants/plant_provider.dart';
import 'package:plants/plants_cash.dart';
import 'package:plants/plants_first_page.dart';
import 'package:plants/plants_pin.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:plants/plants_third_page.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('favorites');
  runApp(const MaterialApp(home: MovieFirstPage()));

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlantProvider()),
      ],
      child: const MyApp(),
    ),
  );
  runApp(
    ChangeNotifierProvider(
      create: (_) => PlantProvider(),
      child: MaterialApp(home: PlantsThirdPage()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      home: MovieFirstPage(),
    );
  }
}
