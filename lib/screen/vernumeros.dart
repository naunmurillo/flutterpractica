import 'package:flutter/material.dart';
import 'package:flutte_async/services/mockapi.dart';
import 'package:flutter/services.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin {
  late AnimationController controller, controller2, controller3;
  late Animation colorAnimation, colorAnimation2, colorAnimation3;
  late Animation sizeAnimation, sizeAnimation2, sizeAnimation3;

  var num1 = 0, num2 = 0, num3 = 0;

  final height = 20;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller3 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    colorAnimation =
        ColorTween(begin: Colors.white, end: Color.fromARGB(255, 244, 205, 36)).animate(controller);
    colorAnimation2 =
        ColorTween(begin: Colors.white, end: const Color.fromARGB(255, 246, 135, 127)).animate(controller2);
    colorAnimation3 =
        ColorTween(begin: Colors.white, end: Color.fromARGB(255, 238, 8, 184)).animate(controller3);

    sizeAnimation = Tween<double>(begin: 20, end: 300).animate(controller);
    sizeAnimation2 = Tween<double>(begin: 20, end: 300).animate(controller2);
    sizeAnimation3 = Tween<double>(begin: 20, end: 300).animate(controller3);

    controller.addListener(() {
      setState(() {});
    });
    controller2.addListener(() {
      setState(() {});
    });
    controller3.addListener(() {
      setState(() {});
    });
  }

  Widget Naranja() {
    return GestureDetector(
      child: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 244, 77, 0),
        foregroundColor: Colors.black,
        onPressed: () {
          sizeAnimation = Tween<double>(begin: 1, end: 500).animate(controller);

          controller.reset();
          colorAnimation = ColorTween(begin: Colors.green, end: Colors.white)
              .animate(controller);

          controller.forward();

          MockApi().getFerrariInteger().then((value) => {
                setState((() {
                  num1 = value;
                })),
              });
        },
        child: const Icon(Icons.adb_outlined),
      ),
    );
  }

  Widget Azul() {
    return GestureDetector(
      child: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 0, 81, 255),
        foregroundColor: Colors.black,
        onPressed: () {
          sizeAnimation2 =
              Tween<double>(begin: 1, end: 500).animate(controller2);

          controller2.reset();
          colorAnimation2 = ColorTween(begin: const Color.fromARGB(255, 0, 51, 255), end: Colors.white)
              .animate(controller2);

          controller2.forward();

          MockApi().getFerrariInteger().then((value) => {
                setState((() {
                  num2 = value;
                }))
              });
        },
        child: const Icon(Icons.add_home_work_sharp),
      ),
    );
  }

  Widget Cafe() {
    return GestureDetector(
      child: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 92, 22, 17),
        foregroundColor: Colors.black,
        onPressed: () {
          sizeAnimation3 =
              Tween<double>(begin: 1, end: 500).animate(controller3);

          controller3.reset();
          colorAnimation3 = ColorTween(begin: const Color.fromARGB(255, 134, 15, 6), end: Colors.white)
              .animate(controller3);

          controller3.forward();
          MockApi().getFerrariInteger().then((value) => {
                setState((() {
                  num3 = value;
                }))
              });
        },
        child: const Icon(Icons.ac_unit_rounded),
      ),
    );
  }

  Widget contenedorNaranja() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 60),
        curve: Curves.fastLinearToSlowEaseIn,
        height: height.toDouble(),
        width: sizeAnimation.value,
        color: colorAnimation.value,
      ),
    );
  }

  Widget contenedorAzul() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 75),
        curve: Curves.fastLinearToSlowEaseIn,
        height: 20,
        width: sizeAnimation2.value,
        color: colorAnimation2.value,
      ),
    );
  }

  Widget contenedorCafe() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.fastLinearToSlowEaseIn,
        height: 20,
        width: sizeAnimation3.value,
        color: colorAnimation3.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: const Text('Asincronia',
                  textAlign: TextAlign.center))),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                  ])),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 40),
                    Naranja(),
                    const SizedBox(height: 6),
                    contenedorNaranja(),
                    Text(
                      "$num1",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 90, 30),
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Azul(),
                    const SizedBox(height: 6),
                    contenedorAzul(),
                    Text(
                      "$num2",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 26, 255),
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Cafe(),
                    const SizedBox(height: 6),
                    contenedorCafe(),
                    Text(
                      "$num3",
                      style: const TextStyle(
                        color: Color.fromARGB(60, 255, 17, 0),
                        fontSize: 50,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
