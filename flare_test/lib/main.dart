import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  String _anim = 'spin1';

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Home(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Container(
            width: 150,
            height: 150,
            child: FlareActor(
              'assets/AnimGears.flr',
              animation: _anim,
            ),
          ),
          onTap: () {
            setState(() {
              if (_anim == 'spin1') {
                _anim = 'spin2';
              } else {
                _anim = 'spin1';
              }
            });
          },
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Flutter + Flare',
              style: TextStyle(fontSize: 30.0),
            ),
            Container(
              height: 100,
              width: 100,
              child: FlareActor(
                'assets/AnimHeart.flr',
                animation: 'pulse',
              ),
            )
          ],
        ),
      ),
    );
  }
}
