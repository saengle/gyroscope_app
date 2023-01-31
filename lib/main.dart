import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sensors Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Gyroscope(),
    );
  }
}

class Gyroscope extends StatefulWidget {
  const Gyroscope({Key? key}) : super(key: key);

  @override
  State<Gyroscope> createState() => _GyroscopeState();
}

class _GyroscopeState extends State<Gyroscope> {
  @override
  Widget build(BuildContext context) {
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Stack(
      children: [
        Positioned(
          left: centerX,
          top: centerY,
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.green),
            width: 100,
            height: 100,
          ),
        )
      ],
    );
  }
}

//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, this.title}) : super(key: key);
//
//   final String? title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   List<double>? _accelerometerValues;
//
//   final _streamSubscriptions = <StreamSubscription<dynamic>>[];
//
//   @override
//   Widget build(BuildContext context) {
//     final accelerometer =
//         _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sensor Example'),
//       ),
//       body: Stack(children: [
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Center(
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   border: Border.all(width: 1.0, color: Colors.black38),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text('Accelerometer: $accelerometer'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ]),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     for (final subscription in _streamSubscriptions) {
//       subscription.cancel();
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _streamSubscriptions.add(
//       accelerometerEvents.listen(
//         (AccelerometerEvent event) {
//           setState(() {
//             _accelerometerValues = <double>[event.x, event.y, event.z];
//           });
//         },
//       ),
//     );
//   }
// }
