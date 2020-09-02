import 'dart:async';
import 'package:rxdart/rxdart.dart';

PublishSubject subject = PublishSubject<int>();

void main() {
  subscribe();

  int count = 0;
  Timer.periodic(Duration(seconds: 1), (timer) {
    subject.add(++count);
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
  subject.transform(transformer()).listen((event) {
    print("got: ${event.toString()}");
  });
}
