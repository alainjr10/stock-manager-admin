import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/common/widgets/buttons.dart';
import 'package:stock_manager_admin/src/features/add_item/presentation/view_models/add_item_providers.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/widgets/product_details_tile_widget.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class ConfirmItemDetails extends ConsumerWidget {
  const ConfirmItemDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    ref.listen(productCrudNotifierProvider, (_, state) async {
      if (!state.hasError && !state.isLoading) {
        'product added successfully'.log();
        'Successfully added product!!!'.showInfoToast;
        context.go('/');
        ref.read(selectedProductProvider.notifier).state = null;
      } else if (state.hasError) {
        'Error adding sales: ${state.error}'.log();
      }
    });
    final selectedProduct = ref.watch(selectedProductProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Confirm Details"),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: selectedProduct == null
                  ? 0.gap
                  : Column(
                      children: [
                        40.vGap,
                        ItemDetailsTile(
                          label: "Product Name",
                          value: selectedProduct.productName,
                        ),
                        const ItemDetailsTileDivider(),
                        ItemDetailsTile(
                          label: "Stock Quantity",
                          value: selectedProduct.availableQty.toString(),
                        ),
                        const ItemDetailsTileDivider(),
                        ItemDetailsTile(
                          label: "Cost Price",
                          value: selectedProduct.costPrice.toString(),
                        ),
                        const ItemDetailsTileDivider(),
                        ItemDetailsTile(
                          label: "Selling Price",
                          value: selectedProduct.sellingPrice.toString(),
                        ),
                        const ItemDetailsTileDivider(),
                        ItemDetailsTile(
                          label: "Safety Stock",
                          value: selectedProduct.safetyStock.toString(),
                        ),
                        const ItemDetailsTileDivider(),
                        ItemDetailsTile(
                          label: "Expiry Date",
                          value: selectedProduct.expiryDate!.dateToString,
                        ),
                        const ItemDetailsTileDivider(),
                      ],
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ref.watch(productCrudNotifierProvider).maybeWhen(
                  orElse: () {
                    return MainBtns(
                      size: size,
                      onPressed: () {
                        ref
                            .read(productCrudNotifierProvider.notifier)
                            .addProduct(
                              selectedProduct!,
                            );
                      },
                      btnText: "Add Product",
                    );
                  },
                  loading: () => MainBtnLoading(
                    size: size,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
