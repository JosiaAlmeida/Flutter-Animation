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
  late final Animation<double> squadSize;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    squadSize = Tween<double>(begin: 100, end: 200).animate(controller);
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
            if (controller.value > 0) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          child: AnimatedBuilder(
              animation: squadSize,
              builder: (context, snapshot) {
                return Container(
                  width: squadSize.value,
                  height: squadSize.value,
                  alignment: squadSize.value > 0
                      ? Alignment.centerRight
                      : Alignment.center,
                  color:
                      Color.lerp(Colors.red, Colors.purple, controller.value),
                );
              }),
        ),
      ),
    );
  }
}
