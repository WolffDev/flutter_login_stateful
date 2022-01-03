import 'package:flutter/material.dart';
import 'package:learn_login_stateful/src/screens/login_screen.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Log me in',
      color: Colors.black,
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
