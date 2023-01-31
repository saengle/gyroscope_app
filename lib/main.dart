import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  List<double>? _accelerometerValues;

  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(
      accelerometerEvents.listen(
        (AccelerometerEvent event) {
          setState(() {
            _accelerometerValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    //가로모드
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);

    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Stack(
      children: [
        StreamBuilder<AccelerometerEvent>(
            stream: accelerometerEvents,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return Positioned(
                left: centerX - _accelerometerValues![1] * 20,
                top: centerY - _accelerometerValues![0] * 20,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.green),
                  width: 100,
                  height: 100,
                ),
              );
            })
      ],
    );
  }
}
