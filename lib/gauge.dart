import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

Widget gauge(double temp) {
  return Scaffold(
    body: Center(
      child: SfRadialGauge(
        title: const GaugeTitle(
            text: 'Temperature',
            textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        enableLoadingAnimation: true,
        animationDuration: 4500,
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 100, pointers: <GaugePointer>[
            NeedlePointer(value: temp, enableAnimation: true)
          ], ranges: <GaugeRange>[
            GaugeRange(startValue: 0, endValue: 25, color: Colors.blue),
            GaugeRange(startValue: 25, endValue: 40, color: Colors.green),
            GaugeRange(startValue: 40, endValue: 100, color: Colors.red)
          ], annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Text(
                  '$temp°C',
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                positionFactor: 0.5,
                angle: 90)
          ])
        ],
      ),
    ),
  );
}
