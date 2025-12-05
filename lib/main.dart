import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:special_math_quizz/quizz_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init('special_math_quizz_cache');
  await Hive.initFlutter();
  await Hive.openBox<List<int>>('answered');
  runApp(
    QuizzApp(),
  );
}
