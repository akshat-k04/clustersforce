
import 'package:clustersforce/Screens/Splash.dart';
import 'package:clustersforce/providers/contestProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'providers/cfuserdata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>CFuserData()) ,
        ChangeNotifierProvider(create: (context)=>ContestProvid()) ,
      ],
      child: MaterialApp(
        title: 'clustersforce',
        theme: ThemeData(

          primarySwatch: Colors.lightGreen,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeState() ;
  }

}

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light),
    // child: login(),
    child:  Splash() ,
    );
  }
}