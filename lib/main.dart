import 'dart:async';

StreamController controller = StreamController<int>();

void main() {
  subscribe();

  int count = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    controller.sink.add(++count);
  });
}

// StreamTransformer<DataType, ReturnType>
StreamTransformer<int, String> transformer() {
  return StreamTransformer<int, String>.fromHandlers(
    handleData: (data, sink) {
      // Error handling
      if (data < 1) {
        print("unexpected data");
        return;
      }
      // add to stream
      sink.add("added $data time${data > 1 ? "s" : ""}");
    },
  );
}

void subscribe() {
  controller.stream.transform(transformer()).listen((event) {
    print("got: ${event.toString()}");
  });
}
