import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager_admin/src/features/add_item/data/data_sources/add_item_local_data.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/product_model.dart';
part 'add_item_providers.g.dart';

@riverpod
class AddSalesNotifier extends _$AddSalesNotifier {
  @override
  FutureOr<void> build() {}
  void addItem(List<Product> product) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(addSalesRepoProvider);
      await repo.addItem(product);
    });
  }
}
