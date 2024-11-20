
import 'package:flutter/material.dart';
import 'package:flutter_assignment1/injection.dart';
import 'package:flutter_assignment1/presentation/core/app_widget.dart';
import 'package:injectable/injectable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection(Environment.dev);
  runApp(const AppWidget());
}
