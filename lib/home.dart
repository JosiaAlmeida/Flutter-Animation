import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var size = 400.0;
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () {
          isLoading = !isLoading;
          setState(() {});
        },
        child: AnimatedContainer(
            //Gerar curva na animação
            curve: Curves.easeOut,
            duration: Duration(milliseconds: 800),
            width: isLoading ? 80 : 400,
            height: 80,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(isLoading ? 40 : 20),
              color: Colors.red,
            ),
            child: AnimatedCrossFade(
              crossFadeState: isLoading
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 500),
              firstChild: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
              secondChild: Text(
                "ENTRAR",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )),
      ),
    ));
  }
}
