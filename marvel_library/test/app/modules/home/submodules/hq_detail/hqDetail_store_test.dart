import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_library/app/modules/home/submodules/hq_detail/hqDetail_store.dart';
 
void main() {
  late HqDetailStore store;

  setUpAll(() {
    store = HqDetailStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}