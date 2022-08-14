import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_library/app/modules/home/submodules/creator_detail/creatorDetail_store.dart';
 
void main() {
  late CreatorDetailStore store;

  setUpAll(() {
    store = CreatorDetailStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}