import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_library/app/modules/home/submodules/character_detail/characterDetail_store.dart';
 
void main() {
  late CharacterDetailStore store;

  setUpAll(() {
    store = CharacterDetailStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}