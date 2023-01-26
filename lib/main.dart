import 'package:flutter/material.dart';
import 'package:todo/layout/home_layout.dart';
import 'package:todo/modules/settings/settings.dart';
import 'package:todo/shared/styles/mytheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: HomeLayout.routeName ,
      routes: {
          HomeLayout.routeName : (context)=> HomeLayout(),
      } ,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,

    );
  }
}

