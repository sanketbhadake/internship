import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/time/time_screen.dart';

void main() {
  runApp(ProviderScope(child: const TimeScreen()));
}
