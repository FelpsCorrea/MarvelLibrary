import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_library/app/modules/home/submodules/profile/profile_store.dart';
 
void main() {
  late ProfileStore store;

  setUpAll(() {
    store = ProfileStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}