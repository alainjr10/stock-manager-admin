import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/common/widgets/buttons.dart';
import 'package:stock_manager_admin/src/features/add_item/presentation/view_models/add_item_providers.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class ConfirmItemDetails extends ConsumerWidget {
  const ConfirmItemDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    ref.listen(addItemNotifierProvider, (_, state) async {
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
            child: ref.watch(addItemNotifierProvider).maybeWhen(
                  orElse: () {
                    return MainBtns(
                      size: size,
                      onPressed: () {
                        ref.read(addItemNotifierProvider.notifier).addItem(
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

class ItemDetailsTileDivider extends StatelessWidget {
  const ItemDetailsTileDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: context.theme.disabledColor,
      thickness: 0.25,
      height: 30,
    );
  }
}

class ItemDetailsTile extends StatelessWidget {
  const ItemDetailsTile({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("$label: ", style: context.bodySmall),
        Text(
          value,
          style: context.bodyMedium,
        ),
      ],
    );
  }
}
