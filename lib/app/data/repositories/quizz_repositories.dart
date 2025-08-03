import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:get_storage/get_storage.dart';

class QuizzRepositories {
  final _box = GetStorage();
  Future<Either<String, Set<int>>> getAnsweredQuizz() async {
    await Future.delayed(Duration(seconds: 2));
    try {
      Set<int> result = Set<int>.from(_box.read('answered') ?? []);
      print(result);

      return right(result);
    } catch (e) {
      print('get answered $e');
      return left('Maaf, Sepertinya ada kesalahan');
    }
  }

  Future<Either<String, Unit>> saveAnswered({required int level}) async {
    try {
      final result = _box.read('answered');

      Set<int> listLevel = {level};

      if (result != null) {
        var setsResult = Set<int>.from(result);
        listLevel.addAll(setsResult);
      }

      List<int> listedSet = List<int>.from(listLevel);

      _box.write('answered', listedSet);
      return right(unit);
    } catch (e) {
      print('save answer $e');
      return left('Maaf, Sepertinya ada kesalahan');
    }
  }
}
