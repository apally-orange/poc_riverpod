// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$basicStringHash() => r'1b992460ec24453567b3ea3751beb00d7748c6fb';

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
String _$postsHash() => r'083d4b243aea515cccae441eb0ee95c0291f27e8';

/// See also [Posts].
@ProviderFor(Posts)
final postsProvider =
    AutoDisposeAsyncNotifierProvider<Posts, List<Post>>.internal(
  Posts.new,
  name: r'postsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Posts = AutoDisposeAsyncNotifier<List<Post>>;
String _$searchBarServiceHash() => r'3d45a3a6c7e722f2514b14dd8f5f06b05a0cf6d1';

/// See also [SearchBarService].
@ProviderFor(SearchBarService)
final searchBarServiceProvider =
    AutoDisposeNotifierProvider<SearchBarService, String>.internal(
  SearchBarService.new,
  name: r'searchBarServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchBarServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SearchBarService = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
