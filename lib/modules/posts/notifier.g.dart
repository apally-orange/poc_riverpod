// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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
String _$searchBarServiceHash() => r'327ee2c858fe71a55a3764f4f0d148ecccab85ca';

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
