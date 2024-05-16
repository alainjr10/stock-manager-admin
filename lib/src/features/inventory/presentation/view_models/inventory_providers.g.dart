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
String _$productStatusHash() => r'14185e4a812b26fa98ec3252c92475dd7aff7463';

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

/// See also [productStatus].
@ProviderFor(productStatus)
const productStatusProvider = ProductStatusFamily();

/// See also [productStatus].
class ProductStatusFamily extends Family<(String, int)> {
  /// See also [productStatus].
  const ProductStatusFamily();

  /// See also [productStatus].
  ProductStatusProvider call({
    required Product product,
  }) {
    return ProductStatusProvider(
      product: product,
    );
  }

  @override
  ProductStatusProvider getProviderOverride(
    covariant ProductStatusProvider provider,
  ) {
    return call(
      product: provider.product,
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
  String? get name => r'productStatusProvider';
}

/// See also [productStatus].
class ProductStatusProvider extends AutoDisposeProvider<(String, int)> {
  /// See also [productStatus].
  ProductStatusProvider({
    required Product product,
  }) : this._internal(
          (ref) => productStatus(
            ref as ProductStatusRef,
            product: product,
          ),
          from: productStatusProvider,
          name: r'productStatusProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productStatusHash,
          dependencies: ProductStatusFamily._dependencies,
          allTransitiveDependencies:
              ProductStatusFamily._allTransitiveDependencies,
          product: product,
        );

  ProductStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
  }) : super.internal();

  final Product product;

  @override
  Override overrideWith(
    (String, int) Function(ProductStatusRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductStatusProvider._internal(
        (ref) => create(ref as ProductStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<(String, int)> createElement() {
    return _ProductStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductStatusProvider && other.product == product;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ProductStatusRef on AutoDisposeProviderRef<(String, int)> {
  /// The parameter `product` of this provider.
  Product get product;
}

class _ProductStatusProviderElement
    extends AutoDisposeProviderElement<(String, int)> with ProductStatusRef {
  _ProductStatusProviderElement(super.provider);

  @override
  Product get product => (origin as ProductStatusProvider).product;
}

String _$getTotalProductsHash() => r'829662999436163467343cde17441dc512ec6b7c';

/// See also [getTotalProducts].
@ProviderFor(getTotalProducts)
const getTotalProductsProvider = GetTotalProductsFamily();

/// See also [getTotalProducts].
class GetTotalProductsFamily extends Family<AsyncValue<(int, int)>> {
  /// See also [getTotalProducts].
  const GetTotalProductsFamily();

  /// See also [getTotalProducts].
  GetTotalProductsProvider call(
    int durationCode,
  ) {
    return GetTotalProductsProvider(
      durationCode,
    );
  }

  @override
  GetTotalProductsProvider getProviderOverride(
    covariant GetTotalProductsProvider provider,
  ) {
    return call(
      provider.durationCode,
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
  String? get name => r'getTotalProductsProvider';
}

/// See also [getTotalProducts].
class GetTotalProductsProvider extends AutoDisposeFutureProvider<(int, int)> {
  /// See also [getTotalProducts].
  GetTotalProductsProvider(
    int durationCode,
  ) : this._internal(
          (ref) => getTotalProducts(
            ref as GetTotalProductsRef,
            durationCode,
          ),
          from: getTotalProductsProvider,
          name: r'getTotalProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTotalProductsHash,
          dependencies: GetTotalProductsFamily._dependencies,
          allTransitiveDependencies:
              GetTotalProductsFamily._allTransitiveDependencies,
          durationCode: durationCode,
        );

  GetTotalProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.durationCode,
  }) : super.internal();

  final int durationCode;

  @override
  Override overrideWith(
    FutureOr<(int, int)> Function(GetTotalProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTotalProductsProvider._internal(
        (ref) => create(ref as GetTotalProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        durationCode: durationCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<(int, int)> createElement() {
    return _GetTotalProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTotalProductsProvider &&
        other.durationCode == durationCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, durationCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTotalProductsRef on AutoDisposeFutureProviderRef<(int, int)> {
  /// The parameter `durationCode` of this provider.
  int get durationCode;
}

class _GetTotalProductsProviderElement
    extends AutoDisposeFutureProviderElement<(int, int)>
    with GetTotalProductsRef {
  _GetTotalProductsProviderElement(super.provider);

  @override
  int get durationCode => (origin as GetTotalProductsProvider).durationCode;
}

String _$getLowStockCountHash() => r'70c2b3f8abd3eef4caacb111813697d8b50ad4fe';

/// See also [getLowStockCount].
@ProviderFor(getLowStockCount)
const getLowStockCountProvider = GetLowStockCountFamily();

/// See also [getLowStockCount].
class GetLowStockCountFamily extends Family<AsyncValue<int>> {
  /// See also [getLowStockCount].
  const GetLowStockCountFamily();

  /// See also [getLowStockCount].
  GetLowStockCountProvider call(
    int durationCode,
  ) {
    return GetLowStockCountProvider(
      durationCode,
    );
  }

  @override
  GetLowStockCountProvider getProviderOverride(
    covariant GetLowStockCountProvider provider,
  ) {
    return call(
      provider.durationCode,
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
  String? get name => r'getLowStockCountProvider';
}

/// See also [getLowStockCount].
class GetLowStockCountProvider extends AutoDisposeFutureProvider<int> {
  /// See also [getLowStockCount].
  GetLowStockCountProvider(
    int durationCode,
  ) : this._internal(
          (ref) => getLowStockCount(
            ref as GetLowStockCountRef,
            durationCode,
          ),
          from: getLowStockCountProvider,
          name: r'getLowStockCountProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getLowStockCountHash,
          dependencies: GetLowStockCountFamily._dependencies,
          allTransitiveDependencies:
              GetLowStockCountFamily._allTransitiveDependencies,
          durationCode: durationCode,
        );

  GetLowStockCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.durationCode,
  }) : super.internal();

  final int durationCode;

  @override
  Override overrideWith(
    FutureOr<int> Function(GetLowStockCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetLowStockCountProvider._internal(
        (ref) => create(ref as GetLowStockCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        durationCode: durationCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _GetLowStockCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetLowStockCountProvider &&
        other.durationCode == durationCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, durationCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetLowStockCountRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `durationCode` of this provider.
  int get durationCode;
}

class _GetLowStockCountProviderElement
    extends AutoDisposeFutureProviderElement<int> with GetLowStockCountRef {
  _GetLowStockCountProviderElement(super.provider);

  @override
  int get durationCode => (origin as GetLowStockCountProvider).durationCode;
}

String _$getSoldProductsHash() => r'9cab77993533d4f2cbc6394103bd18d1b7d7ad7d';

/// See also [getSoldProducts].
@ProviderFor(getSoldProducts)
const getSoldProductsProvider = GetSoldProductsFamily();

/// See also [getSoldProducts].
class GetSoldProductsFamily extends Family<AsyncValue<(int, int)>> {
  /// See also [getSoldProducts].
  const GetSoldProductsFamily();

  /// See also [getSoldProducts].
  GetSoldProductsProvider call(
    int durationCode,
  ) {
    return GetSoldProductsProvider(
      durationCode,
    );
  }

  @override
  GetSoldProductsProvider getProviderOverride(
    covariant GetSoldProductsProvider provider,
  ) {
    return call(
      provider.durationCode,
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
  String? get name => r'getSoldProductsProvider';
}

/// See also [getSoldProducts].
class GetSoldProductsProvider extends AutoDisposeFutureProvider<(int, int)> {
  /// See also [getSoldProducts].
  GetSoldProductsProvider(
    int durationCode,
  ) : this._internal(
          (ref) => getSoldProducts(
            ref as GetSoldProductsRef,
            durationCode,
          ),
          from: getSoldProductsProvider,
          name: r'getSoldProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSoldProductsHash,
          dependencies: GetSoldProductsFamily._dependencies,
          allTransitiveDependencies:
              GetSoldProductsFamily._allTransitiveDependencies,
          durationCode: durationCode,
        );

  GetSoldProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.durationCode,
  }) : super.internal();

  final int durationCode;

  @override
  Override overrideWith(
    FutureOr<(int, int)> Function(GetSoldProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSoldProductsProvider._internal(
        (ref) => create(ref as GetSoldProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        durationCode: durationCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<(int, int)> createElement() {
    return _GetSoldProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSoldProductsProvider &&
        other.durationCode == durationCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, durationCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSoldProductsRef on AutoDisposeFutureProviderRef<(int, int)> {
  /// The parameter `durationCode` of this provider.
  int get durationCode;
}

class _GetSoldProductsProviderElement
    extends AutoDisposeFutureProviderElement<(int, int)>
    with GetSoldProductsRef {
  _GetSoldProductsProviderElement(super.provider);

  @override
  int get durationCode => (origin as GetSoldProductsProvider).durationCode;
}

String _$getSalesValueHash() => r'9e2e1a10942b7b6244b83c2ba4d2ba5f2cd5ea1a';

/// See also [getSalesValue].
@ProviderFor(getSalesValue)
const getSalesValueProvider = GetSalesValueFamily();

/// See also [getSalesValue].
class GetSalesValueFamily extends Family<AsyncValue<int>> {
  /// See also [getSalesValue].
  const GetSalesValueFamily();

  /// See also [getSalesValue].
  GetSalesValueProvider call(
    int durationCode,
  ) {
    return GetSalesValueProvider(
      durationCode,
    );
  }

  @override
  GetSalesValueProvider getProviderOverride(
    covariant GetSalesValueProvider provider,
  ) {
    return call(
      provider.durationCode,
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
  String? get name => r'getSalesValueProvider';
}

/// See also [getSalesValue].
class GetSalesValueProvider extends AutoDisposeFutureProvider<int> {
  /// See also [getSalesValue].
  GetSalesValueProvider(
    int durationCode,
  ) : this._internal(
          (ref) => getSalesValue(
            ref as GetSalesValueRef,
            durationCode,
          ),
          from: getSalesValueProvider,
          name: r'getSalesValueProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getSalesValueHash,
          dependencies: GetSalesValueFamily._dependencies,
          allTransitiveDependencies:
              GetSalesValueFamily._allTransitiveDependencies,
          durationCode: durationCode,
        );

  GetSalesValueProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.durationCode,
  }) : super.internal();

  final int durationCode;

  @override
  Override overrideWith(
    FutureOr<int> Function(GetSalesValueRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetSalesValueProvider._internal(
        (ref) => create(ref as GetSalesValueRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        durationCode: durationCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _GetSalesValueProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetSalesValueProvider && other.durationCode == durationCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, durationCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetSalesValueRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `durationCode` of this provider.
  int get durationCode;
}

class _GetSalesValueProviderElement
    extends AutoDisposeFutureProviderElement<int> with GetSalesValueRef {
  _GetSalesValueProviderElement(super.provider);

  @override
  int get durationCode => (origin as GetSalesValueProvider).durationCode;
}

String _$getTotalProfitsHash() => r'80545b2c25273d65026d930377509dfe72079b7a';

/// See also [getTotalProfits].
@ProviderFor(getTotalProfits)
const getTotalProfitsProvider = GetTotalProfitsFamily();

/// See also [getTotalProfits].
class GetTotalProfitsFamily extends Family<AsyncValue<int>> {
  /// See also [getTotalProfits].
  const GetTotalProfitsFamily();

  /// See also [getTotalProfits].
  GetTotalProfitsProvider call(
    int durationCode,
  ) {
    return GetTotalProfitsProvider(
      durationCode,
    );
  }

  @override
  GetTotalProfitsProvider getProviderOverride(
    covariant GetTotalProfitsProvider provider,
  ) {
    return call(
      provider.durationCode,
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
  String? get name => r'getTotalProfitsProvider';
}

/// See also [getTotalProfits].
class GetTotalProfitsProvider extends AutoDisposeFutureProvider<int> {
  /// See also [getTotalProfits].
  GetTotalProfitsProvider(
    int durationCode,
  ) : this._internal(
          (ref) => getTotalProfits(
            ref as GetTotalProfitsRef,
            durationCode,
          ),
          from: getTotalProfitsProvider,
          name: r'getTotalProfitsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTotalProfitsHash,
          dependencies: GetTotalProfitsFamily._dependencies,
          allTransitiveDependencies:
              GetTotalProfitsFamily._allTransitiveDependencies,
          durationCode: durationCode,
        );

  GetTotalProfitsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.durationCode,
  }) : super.internal();

  final int durationCode;

  @override
  Override overrideWith(
    FutureOr<int> Function(GetTotalProfitsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTotalProfitsProvider._internal(
        (ref) => create(ref as GetTotalProfitsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        durationCode: durationCode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _GetTotalProfitsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTotalProfitsProvider &&
        other.durationCode == durationCode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, durationCode.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTotalProfitsRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `durationCode` of this provider.
  int get durationCode;
}

class _GetTotalProfitsProviderElement
    extends AutoDisposeFutureProviderElement<int> with GetTotalProfitsRef {
  _GetTotalProfitsProviderElement(super.provider);

  @override
  int get durationCode => (origin as GetTotalProfitsProvider).durationCode;
}

String _$getProductByIdNotifierHash() =>
    r'8fe7800c88a445c534483856c718678e15ada95d';

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
