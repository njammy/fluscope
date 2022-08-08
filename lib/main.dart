import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const Fluscope());
}

class Fluscope extends StatelessWidget {
  const Fluscope({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Fluscoper());
  }
}

class Fluscoper extends StatefulWidget {
  const Fluscoper({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => FluscoperState();
}

class FluscoperState extends State<Fluscoper> {
  double x = 0, y = 0, z = 0;
  String direction = "nana";

  @override
  void initState() {
    gyroscopeEvents.listen((GyroscopeEvent event) {
      x = event.x;
      y = event.y;
      z = event.z;

      if (x > 0) {
        direction = "back";
      } else if (x < 0) {
        direction = "forward";
      } else if (y > 0) {
        direction = "left";
      } else if (y < 0) {
        direction = "right";
      }

      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Center(
        child: Text(direction),
      ),
    ));
  }
}
