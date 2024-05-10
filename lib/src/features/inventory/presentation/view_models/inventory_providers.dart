import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager_admin/src/features/inventory/data/data_sources/local_inventory_data.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/product_model.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';
part 'inventory_providers.g.dart';

@Riverpod(keepAlive: false)
FutureOr<List<Product>> getInventoryProducts(GetInventoryProductsRef ref) {
  final repo = ref.read(localInventoryProvider);
  'getting inventory prods'.log();
  return repo.getInventoryProducts();
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
