import 'dart:async';

StreamController controller = StreamController<String>();

void main() {
  subscribe();

  int count = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    controller.sink.add("added ${++count} time${count > 1 ? "s" : ""}");
  });
}

void subscribe() {
  controller.stream.listen((event) {
    print("got: ${event.toString()}");
  });
}
