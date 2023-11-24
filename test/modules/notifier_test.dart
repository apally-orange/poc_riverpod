import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late final MockCat cat;

  setUp(() {
    cat = MockCat();
  });

  group('group 1', () {
    test('Test 1', () async {
      when(() => cat.likes(any())).thenAnswer((_) async => true);
      expect(await cat.likes('tt'), true);

      when(() => cat.sound()).thenReturn('Tata');
      expect(cat.sound(), 'Tata');
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
