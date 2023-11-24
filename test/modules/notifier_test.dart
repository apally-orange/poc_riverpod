import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_archi/modules/posts/notifier.dart';

void main() {
  late final MockCat cat;

  setUpAll(() {
    cat = MockCat();
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

      expect(container.read(basicStringProvider), 'toto');

      await expectLater(
        container.read(futureStringProvider.future),
        completion('tata'),
      );
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
