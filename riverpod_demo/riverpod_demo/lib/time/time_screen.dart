import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/time/time_controller.dart';

class TimeScreen extends ConsumerStatefulWidget {
  const TimeScreen({super.key});

  @override
  ConsumerState<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends ConsumerState<TimeScreen> {
  @override
  Widget build(BuildContext context) {
    final timer = ref.watch(controller);
    return MaterialApp(
      home: Scaffold(body: Center(child: Text(timer.currentTime))),
    );
  }
}
