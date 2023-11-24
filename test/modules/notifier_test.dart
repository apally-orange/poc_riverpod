import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_archi/modules/posts/notifier.dart';

class MockSearchBarService extends AutoDisposeNotifier<String>
    with Mock
    implements SearchBarService {}

void main() {
  late final MockCat cat;
  late final MockSearchBarService mockSearch;

  setUpAll(() {
    cat = MockCat();
    mockSearch = MockSearchBarService();
  });

  group('group 1: ', () {
    test('Test 1', () async {
      when(() => cat.likes(any())).thenAnswer((_) async => true);
      expect(await cat.likes('tt'), true);

      when(() => cat.sound()).thenReturn('Tata');
      expect(cat.sound(), 'Tata');
    });

    test('Test Riverpod', () async {
      final container = ProviderContainer(overrides: [
        basicStringProvider.overrideWith((ref) => 'toto'),
        futureStringProvider.overrideWith((ref) => 'tata'),
      ]);

      final sub = container.listen(basicStringProvider, (_, __) {});

      expect(container.read(basicStringProvider), 'toto');

      expect(sub.read(), 'toto');

      await expectLater(
        container.read(futureStringProvider.future),
        completion('tata'),
      );
    });

    test('Test Riverpod 2', () async {
      when(
        () => mockSearch.build(),
      ).thenAnswer((invocation) => 'hello');

      final container = ProviderContainer(overrides: [
        searchBarServiceProvider.overrideWith(() => mockSearch),
      ]);

      expect(container.read(searchBarServiceProvider), 'hello');

      expect(container.read(basicStringProvider), 'search: hello');
    });

    test('Test Riverpod 3', () async {
      when(
        () => mockSearch.build(),
      ).thenAnswer((invocation) => 'hello');

      final container = ProviderContainer(overrides: [
        searchBarServiceProvider.overrideWith(() => mockSearch),
      ]);

      expect(container.read(searchBarServiceProvider), 'hello');

      expect(container.read(testMultiProvider), 'multi: hello');
    });
  });
}

class Cat {
  String sound() => 'meow!';
  Future<bool> likes(String food, {bool isHungry = false}) async => false;
  final int lives = 9;
}

// A Mock Cat class
class MockCat extends Mock implements Cat {}
