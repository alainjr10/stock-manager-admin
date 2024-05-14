import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager_admin/src/features/inventory/data/data_sources/local_inventory_data.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/product_model.dart';
part 'inventory_providers.g.dart';

final isSelectableRows = StateProvider.autoDispose<bool>((ref) => false);
final productUpdatedController =
    StateProvider.autoDispose<bool>((ref) => false);

@Riverpod(keepAlive: false)
FutureOr<List<Product>> getInventoryProducts(GetInventoryProductsRef ref) {
  final repo = ref.read(productsInventoryProvider);
  return repo.getInventoryProducts();
}

@riverpod
class GetProductByIdNotifier extends _$GetProductByIdNotifier {
  Future<Product> _fetchProduct(String productId) async {
    final repo = ref.read(productsInventoryProvider);
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
    final repo = ref.read(productsInventoryProvider);
    return repo.getInventoryProducts();
  }

  @override
  FutureOr<List<Product>> build() {
    return _fetchProducts();
  }

  void addProduct(Product product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(productsInventoryProvider);
      await repo.addProduct(product);
      return _fetchProducts();
    });
  }

  void updateProduct(Product product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(productsInventoryProvider);
      await repo.updateProduct(product);
      return _fetchProducts();
    });
  }

  void deleteProduct(String productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(productsInventoryProvider);
      await repo.deleteProduct(productId);
      return _fetchProducts();
    });
  }
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
