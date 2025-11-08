import 'dart:async';

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({this.milliseconds = 500});

  void run(void Function() action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}



// final _debouncer = Debouncer(milliseconds: 400);

// onChanged: (text) {
//   _debouncer.run(() {
//     print('Searching for $text');
//   });
// }