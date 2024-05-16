import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager_admin/src/features/inventory/data/data_sources/supabase_inventory_data.dart';
import 'package:stock_manager_admin/src/features/inventory/data/services/inventory_alt_services.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/inventory_models.dart';
part 'inventory_providers.g.dart';

final isSelectableRows = StateProvider.autoDispose<bool>((ref) => false);
final productUpdatedController =
    StateProvider.autoDispose<bool>((ref) => false);
final generalDurationCode = StateProvider<int>((ref) => 1);

@Riverpod(keepAlive: false)
FutureOr<List<Product>> getInventoryProducts(GetInventoryProductsRef ref) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getInventoryProducts();
}

// 0 for in stock, 1 for out of stock, 2 for low stock, 3 for expired, 4 for approaching expiry date
@riverpod
(String, int) productStatus(ProductStatusRef ref, {required Product product}) {
  return InventoryAltServices.productStatusProvider(product: product);
}

@riverpod
class GetProductByIdNotifier extends _$GetProductByIdNotifier {
  Future<Product> _fetchProduct(String productId) async {
    final repo = ref.read(supabaseInventoryProvider);
    return repo.getProductById(productId);
  }

  @override
  FutureOr<Product> build(String productId) {
    return _fetchProduct(productId);
  }
}

@riverpod
class ProductCrudNotifier extends _$ProductCrudNotifier {
  Future<List<Product>> _fetchProducts() async {
    final repo = ref.read(supabaseInventoryProvider);
    return repo.getInventoryProducts();
  }

  @override
  FutureOr<List<Product>> build() {
    return _fetchProducts();
  }

  void addProduct(Product product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(supabaseInventoryProvider);
      await repo.addProduct(product);
      return _fetchProducts();
    });
  }

  void updateProduct(Product product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(supabaseInventoryProvider);
      await repo.updateProduct(product);
      return _fetchProducts();
    });
  }

  void deleteProduct(String productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(supabaseInventoryProvider);
      await repo.deleteProduct(productId);
      return _fetchProducts();
    });
  }
}

@riverpod
FutureOr<(int, int)> getTotalProducts(
    GetTotalProductsRef ref, int durationCode) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getTotalActiveProducts(durationCode);
}

@riverpod
FutureOr<int> getLowStockCount(GetLowStockCountRef ref, int durationCode) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getLowStockProductsCount(durationCode);
}

@riverpod
FutureOr<(int, int)> getSoldProducts(GetSoldProductsRef ref, int durationCode) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getTotalSoldProducts(durationCode);
}

@riverpod
FutureOr<int> getSalesValue(GetSalesValueRef ref, int durationCode) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getTotalSalesValue(durationCode);
}

@riverpod
FutureOr<int> getTotalProfits(GetTotalProfitsRef ref, int durationCode) {
  final repo = ref.read(supabaseInventoryProvider);
  return repo.getTotalProfitWithinDuration(durationCode);
}

@Riverpod(keepAlive: true)
class ItemsToSellNotifier extends _$ItemsToSellNotifier {
  @override
  List<Product> build() {
    return [];
  }

  void addProduct(Product product) {
    state = [...state, product];
  }

  void removeProduct(Product product) {
    state = state
        .where((element) => element.productId != product.productId)
        .toList();
  }

  void toggleSelection(Product product) {
    if (state.contains(product)) {
      removeProduct(product);
    } else {
      addProduct(product);
    }
  }

  void selectAllProducts(List<Product> products) {
    state = products;
  }

  void clearProducts() {
    state = [];
  }

  void toggleAllSelection(List<Product> products) {
    if (state.length == products.length) {
      clearProducts();
    } else {
      selectAllProducts(products);
    }
  }
}
