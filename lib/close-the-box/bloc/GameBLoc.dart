import 'package:rxdart/rxdart.dart';

class GameBloc {
  BehaviorSubject<List> gameStream;

  GameBloc() {
    gameStream = new BehaviorSubject<List>.seeded([]);
    fetchAll();
  }

  Observable<List> get taskList => gameStream.stream;

  void fetchAll() async {

  }

  fetch(int index) async {
   
  }

  void add(String value) {
   
  }

  void delete(int id) {
   
  }

  dispose() {
    gameStream.close();
  }
}
