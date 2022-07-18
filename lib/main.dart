import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_exam/screens/json_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
                                                                                primarySwatch: Colors.blue,
      ),
      home: const JsonScreen(),
    );
  }
}
