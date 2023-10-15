import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:playground/samples/block_cubit_counter/counter/counter.dart';
import 'package:playground/samples/block_cubit_counter/counter_observer.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}

class CounterApp extends MaterialApp {
  const CounterApp({super.key}) : super(home: const CounterPage());
}