import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager_admin/src/features/add_item/data/data_sources/add_item_local_data.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/product_model.dart';
part 'add_item_providers.g.dart';

@riverpod
class AddItemNotifier extends _$AddItemNotifier {
  @override
  FutureOr<void> build() {}
  void addItem(Product product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(addSalesRepoProvider);
      await repo.addItem(product);
    });
  }
}

final selectedProductProvider = StateProvider<Product?>((ref) => null);
