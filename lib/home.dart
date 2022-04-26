import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var size = 400.0;
  var isLoading = false;

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            controller.reverse();
          },
          child: AnimatedBuilder(
              animation: controller,
              builder: (context, snapshot) {
                return Container(
                  width: 100 * controller.value,
                  height: 100 * controller.value,
                  color: Colors.red,
                );
              }),
        ),
      ),
    );
  }
}
