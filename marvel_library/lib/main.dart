import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:marvel_library/app/app_module.dart';
import 'package:marvel_library/app/app_widget.dart';

void main() =>
    runApp(ModularApp(module: AppModule(), child: Phoenix(child: AppWidget())));
