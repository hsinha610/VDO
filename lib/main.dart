import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vdo_watch/preference.dart';

import 'home.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.lightBlue[400],
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setEnabledSystemUIOverlays([]);

  await Preference.init();
  isloggedIn = Preference.getLoggedIn() ?? false;

  if (isloggedIn) {
    loggedInUser = Preference.getLoggedInUser();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isloggedIn ? Home() : Login(),
    );
  }
}
