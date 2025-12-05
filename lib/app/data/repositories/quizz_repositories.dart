import 'package:fpdart/fpdart.dart';
import 'package:hive_flutter/hive_flutter.dart';

class QuizzRepositories {
  final Box<List<int>> _box = Hive.box('answered');

  Future<Either<String, Set<int>>> getAnsweredQuizz() async {
    try {
      var boxResult = _box.get('answered');
      Set<int> result = Set<int>.from(boxResult ?? []);

      return right(result);
    } catch (e) {
      return left('Maaf, Sepertinya ada kesalahan');
    }
  }

  Future<Either<String, Unit>> saveAnswered({required int level}) async {
    try {
      final result = _box.get('answered');

      Set<int> listLevel = {level};

      if (result != null) {
        var setsResult = Set<int>.from(result);

        listLevel.addAll(setsResult);
      }

      List<int> listedSet = List<int>.from(listLevel);

      await _box.put('answered', listedSet);

      return right(unit);
    } catch (e) {
      return left('Maaf, Sepertinya ada kesalahan');
    }
  }
}
