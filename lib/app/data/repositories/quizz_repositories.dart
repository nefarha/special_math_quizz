import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuizzRepositories {
  final Box<List<int>> _box = Hive.box('answered');

  Future<Either<String, Set<int>>> getAnsweredQuizz() async {
    try {
      var boxResult = _box.get('answered');
      Set<int> result = Set<int>.from(boxResult ?? []);
      print(boxResult);

      return right(result);
    } catch (e) {
      print('get answered $e');
      return left('Maaf, Sepertinya ada kesalahan');
    }
  }

  Future<Either<String, Unit>> saveAnswered({required int level}) async {
    try {
      final result = _box.get('answered');

      print('assda dalam try $result');

      Set<int> listLevel = {level};

      print('assda listLevel $result');

      if (result != null) {
        var setsResult = Set<int>.from(result);
        print('assda set Result $result');
        listLevel.addAll(setsResult);
        print('assda addList $result');
      }

      List<int> listedSet = List<int>.from(listLevel);

      print('assda set convert $result');

      await _box.put('answered', listedSet);

      print('assda put $result');
      return right(unit);
    } catch (e) {
      print('save answer $e');
      return left('Maaf, Sepertinya ada kesalahan');
    }
  }
}
