// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:poc_archi/modules/posts/notifier.dart';
import 'package:poc_archi/notifier/testable_notifier.dart';

class MockSearchBarService extends AutoDisposeNotifier<String>
    with Mock
    implements SearchBarService {}

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}

void main() {
  late MockCat cat;
  late MockSearchBarService mockSearch;

  setUp(() {
    cat = MockCat();
    mockSearch = MockSearchBarService();
  });

  test('Test 1', () async {
    when(() => cat.likes(any())).thenAnswer((_) async => true);
    expect(await cat.likes('tt'), true);

    when(() => cat.sound()).thenReturn('Tata');
    expect(cat.sound(), 'Tata');
  });

  test('Test Riverpod', () async {
    final container = createContainer(
      overrides: [
        basicStringProvider.overrideWith((ref) => 'toto'),
        futureStringProvider.overrideWith((ref) => 'tata'),
      ],
    );

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

    final container = createContainer(
      overrides: [
        searchBarServiceProvider.overrideWith(() => mockSearch),
      ],
    );

    expect(container.read(searchBarServiceProvider), 'hello');

    expect(container.read(basicStringProvider), 'search: hello');
  });

  test('Test Riverpod 3', () async {
    when(
      () => mockSearch.build(),
    ).thenAnswer((invocation) => 'hello');

    final container = createContainer(
      overrides: [
        searchBarServiceProvider.overrideWith(() => mockSearch),
      ],
    );

    expect(container.read(searchBarServiceProvider), 'hello');

    expect(container.read(testMultiProvider), 'multi: hello');
  });
}

class Cat {
  String sound() => 'meow!';
  Future<bool> likes(String food, {bool isHungry = false}) async => false;
  final int lives = 9;
}

// A Mock Cat class
class MockCat extends Mock implements Cat {}
