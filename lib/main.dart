import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/ecran_vide.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Avenir',
        primaryColor: AppColors.blue,
        primaryColorDark: AppColors.blue,
        accentColor: AppColors.yellow,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      //home: ControlYourHome(),
      home: HomePage(),
    );
  }
}

class ControlYourHome extends StatelessWidget {
  const ControlYourHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: ColoredBox(
              color: Colors.orange,
            ),
          ),
          //Image.network(
          //'https://images.unsplash.com/photo-1622891194491-1d16c2b2134b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=334&q=80',
          //fit: BoxFit.cover,
          // ),
          Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Control your home',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                        'Control all your smart home devices and enjoy your life'),
                    SizedBox(
                      height: 14.0,
                    ),
                    GetStartedButton(label: 'Get Started', onPressed: () {}),
                    TextButton(
                      child: Text('Sign in'),
                      onPressed: () {},
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

class GetStartedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  GetStartedButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepPurpleAccent),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
