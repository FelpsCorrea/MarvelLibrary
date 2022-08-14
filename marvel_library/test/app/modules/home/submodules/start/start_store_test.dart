import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_library/app/modules/home/submodules/start/start_store.dart';
 
void main() {
  late StartStore store;

  setUpAll(() {
    store = StartStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}