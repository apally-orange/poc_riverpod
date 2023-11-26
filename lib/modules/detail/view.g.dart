// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentPostHash() => r'0953d293b7c03f560850935c185cb1ad385bf53c';

/// See also [_currentPost].
@ProviderFor(_currentPost)
final _currentPostProvider = AutoDisposeProvider<Post>.internal(
  _currentPost,
  name: r'_currentPostProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentPostHash,
  dependencies: const <ProviderOrFamily>[],
  allTransitiveDependencies: const <ProviderOrFamily>{},
);

typedef _CurrentPostRef = AutoDisposeProviderRef<Post>;
String _$commentsHash() => r'f08bbbbb72a108b0d7dbb0826b93214e36775910';

/// See also [Comments].
@ProviderFor(Comments)
final commentsProvider =
    AutoDisposeAsyncNotifierProvider<Comments, List<Comment>>.internal(
  Comments.new,
  name: r'commentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$commentsHash,
  dependencies: <ProviderOrFamily>[_currentPostProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    _currentPostProvider,
    ...?_currentPostProvider.allTransitiveDependencies
  },
);

typedef _$Comments = AutoDisposeAsyncNotifier<List<Comment>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
