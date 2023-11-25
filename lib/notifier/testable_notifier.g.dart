// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testable_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$basicStringHash() => r'59897b33929af9559926e63add39f3dc10f2a533';

/// See also [basicString].
@ProviderFor(basicString)
final basicStringProvider = AutoDisposeProvider<String>.internal(
  basicString,
  name: r'basicStringProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$basicStringHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BasicStringRef = AutoDisposeProviderRef<String>;
String _$futureStringHash() => r'73e11abb2e9d255ba78cb405bebfbb338e35d96f';

/// See also [futureString].
@ProviderFor(futureString)
final futureStringProvider = AutoDisposeFutureProvider<String>.internal(
  futureString,
  name: r'futureStringProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$futureStringHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FutureStringRef = AutoDisposeFutureProviderRef<String>;
String _$testMultiHash() => r'7ffb60c270ba8c6b1f5900e9032866ff2060c35a';

/// See also [TestMulti].
@ProviderFor(TestMulti)
final testMultiProvider =
    AutoDisposeNotifierProvider<TestMulti, String>.internal(
  TestMulti.new,
  name: r'testMultiProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$testMultiHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TestMulti = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
