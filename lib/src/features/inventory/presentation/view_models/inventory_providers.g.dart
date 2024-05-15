// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getInventoryProductsHash() =>
    r'18bdcb9c1df757637689b90133bfaad698bc8f80';

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
String _$getProductByIdNotifierHash() =>
    r'8fe7800c88a445c534483856c718678e15ada95d';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$GetProductByIdNotifier
    extends BuildlessAutoDisposeAsyncNotifier<Product> {
  late final String productId;

  FutureOr<Product> build(
    String productId,
  );
}

/// See also [GetProductByIdNotifier].
@ProviderFor(GetProductByIdNotifier)
const getProductByIdNotifierProvider = GetProductByIdNotifierFamily();

/// See also [GetProductByIdNotifier].
class GetProductByIdNotifierFamily extends Family<AsyncValue<Product>> {
  /// See also [GetProductByIdNotifier].
  const GetProductByIdNotifierFamily();

  /// See also [GetProductByIdNotifier].
  GetProductByIdNotifierProvider call(
    String productId,
  ) {
    return GetProductByIdNotifierProvider(
      productId,
    );
  }

  @override
  GetProductByIdNotifierProvider getProviderOverride(
    covariant GetProductByIdNotifierProvider provider,
  ) {
    return call(
      provider.productId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getProductByIdNotifierProvider';
}

/// See also [GetProductByIdNotifier].
class GetProductByIdNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<GetProductByIdNotifier,
        Product> {
  /// See also [GetProductByIdNotifier].
  GetProductByIdNotifierProvider(
    String productId,
  ) : this._internal(
          () => GetProductByIdNotifier()..productId = productId,
          from: getProductByIdNotifierProvider,
          name: r'getProductByIdNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getProductByIdNotifierHash,
          dependencies: GetProductByIdNotifierFamily._dependencies,
          allTransitiveDependencies:
              GetProductByIdNotifierFamily._allTransitiveDependencies,
          productId: productId,
        );

  GetProductByIdNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.productId,
  }) : super.internal();

  final String productId;

  @override
  FutureOr<Product> runNotifierBuild(
    covariant GetProductByIdNotifier notifier,
  ) {
    return notifier.build(
      productId,
    );
  }

  @override
  Override overrideWith(GetProductByIdNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: GetProductByIdNotifierProvider._internal(
        () => create()..productId = productId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        productId: productId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<GetProductByIdNotifier, Product>
      createElement() {
    return _GetProductByIdNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetProductByIdNotifierProvider &&
        other.productId == productId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, productId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetProductByIdNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<Product> {
  /// The parameter `productId` of this provider.
  String get productId;
}

class _GetProductByIdNotifierProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<GetProductByIdNotifier,
        Product> with GetProductByIdNotifierRef {
  _GetProductByIdNotifierProviderElement(super.provider);

  @override
  String get productId => (origin as GetProductByIdNotifierProvider).productId;
}

String _$productCrudNotifierHash() =>
    r'ec933be9553685afd3675f2dd1b87733f5af140c';

/// See also [ProductCrudNotifier].
@ProviderFor(ProductCrudNotifier)
final productCrudNotifierProvider = AutoDisposeAsyncNotifierProvider<
    ProductCrudNotifier, List<Product>>.internal(
  ProductCrudNotifier.new,
  name: r'productCrudNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productCrudNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProductCrudNotifier = AutoDisposeAsyncNotifier<List<Product>>;
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
