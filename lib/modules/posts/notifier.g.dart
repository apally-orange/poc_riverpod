// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postsHash() => r'07b34282b77a8167ef6b8e75bb9985f3afd5d8e4';

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
String _$searchBarServiceHash() => r'c98e7c6d581c040c72c2572e5f806cf0a2cbc9ee';

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
String _$filteredPostHash() => r'f22ad78b44319b55266e9ea2444ea08205fbf7d7';

/// See also [FilteredPost].
@ProviderFor(FilteredPost)
final filteredPostProvider =
    AutoDisposeAsyncNotifierProvider<FilteredPost, List<Post>>.internal(
  FilteredPost.new,
  name: r'filteredPostProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$filteredPostHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FilteredPost = AutoDisposeAsyncNotifier<List<Post>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
