import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size = 100.0;
  var increase = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Center(
      child: GestureDetector(
        onTap: () {
          increase = !increase;
          setState(() {});
        },
        child: AnimatedContainer(
          //Gerar curva na animação
          curve: Curves.bounceOut,
          duration: Duration(seconds: 2),
          width: increase ? 200 : size,
          height: increase ? 200 : size,
          color: Colors.red,
        ),
      ),
    ));
  }
}
