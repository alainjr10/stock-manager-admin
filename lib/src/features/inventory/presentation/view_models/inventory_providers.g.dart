// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getInventoryProductsHash() =>
    r'f09f10360d5dcc8fc58c5630677b1a91d5b36fd0';

/// See also [getInventoryProducts].
@ProviderFor(getInventoryProducts)
final getInventoryProductsProvider =
    AutoDisposeFutureProvider<List<Product>>.internal(
  getInventoryProducts,
  name: r'getInventoryProductsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getInventoryProductsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetInventoryProductsRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$itemsToSellNotifierHash() =>
    r'5d7d57f5f3a7a916148a2cc7a02e1f6bf8ca9bf7';

/// See also [ItemsToSellNotifier].
@ProviderFor(ItemsToSellNotifier)
final itemsToSellNotifierProvider =
    NotifierProvider<ItemsToSellNotifier, List<Product>>.internal(
  ItemsToSellNotifier.new,
  name: r'itemsToSellNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemsToSellNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ItemsToSellNotifier = Notifier<List<Product>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
