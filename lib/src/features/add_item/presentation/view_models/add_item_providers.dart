import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/product_model.dart';

// @riverpod
// class AddItemNotifier extends _$AddItemNotifier {
//   @override
//   FutureOr<void> build() {}
//   void addItem(Product product) async {
//     state = const AsyncLoading();
//     state = await AsyncValue.guard(() async {
//       final repo = ref.read(productsInventoryProvider);
//       await repo.addProduct(product);
//     });
//   }
// }

final selectedProductProvider = StateProvider<Product?>((ref) => null);
