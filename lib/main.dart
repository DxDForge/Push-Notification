import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_notification/controller/firebase_api.dart';
import 'package:push_notification/firebase_options.dart';
import 'package:push_notification/pages/home_page.dart';
import 'package:push_notification/pages/notification_page.dart';


final navigatorKey =GlobalKey<NavigatorState>();
void main() async{
  runApp(const MyApp());
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform );
  await FirebaseApi().initNotification();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const HomePage(),
      navigatorKey: navigatorKey,
      routes:{
        
        '/home': (context) => const HomePage(),
        '/notification': (context) => const NotificationPage(),
      } ,
    );
  }
}

