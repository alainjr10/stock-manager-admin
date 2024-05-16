import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/common/widgets/center_loading_widget.dart';
import 'package:stock_manager_admin/src/features/home/presentation/widgets/dashboard_details_card.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager_admin/src/utils/constants/constants.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class InventoryScrn extends ConsumerWidget {
  const InventoryScrn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(itemsToSellNotifierProvider);
    final selectableRows = ref.watch(isSelectableRows);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/add_item');
        },
        backgroundColor: kAltSecondaryColor,
        foregroundColor: kSecondaryColor,
        // label: const Icon(Icons.add),
        label: Row(
          children: [
            const Icon(Icons.add),
            4.hGap,
            const Text("Add Product"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DashboardDetailsCard(
                    bgColor: Colors.green,
                    icon: Icons.input_outlined,
                    label: "Stock In",
                    value: '',
                    provider: ref.watch(getTotalProductsProvider(2)),
                    providerHasTwoOutputs: true,
                  ),
                ),
                12.hGap,
                Expanded(
                  child: DashboardDetailsCard(
                    bgColor: Colors.pink,
                    icon: Icons.output_outlined,
                    label: "Stock Out",
                    value: '',
                    provider: ref.watch(getSoldProductsProvider(2)),
                    providerHasTwoOutputs: true,
                  ),
                ),
              ],
            ),
            8.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Inventory Products: ",
                          style: context.titleSmall.bold,
                        ),
                        TextSpan(
                          text:
                              "(${ref.watch(getTotalProductsProvider(0)).maybeWhen(
                                    data: (productsCount) =>
                                        productsCount.$2.toString(),
                                    orElse: () => "0",
                                  )})",
                          style: context.titleSmall.bold700,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref.invalidate(productCrudNotifierProvider);
                    ref.read(productCrudNotifierProvider);
                  },
                  icon: const Icon(Icons.refresh_outlined),
                ),
              ],
            ),
            8.vGap,
            SizedBox(
              height: size.height * 0.4,
              child: ref.watch(productCrudNotifierProvider).when(
                error: (error, stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("An error occured loading products"),
                        TextButton.icon(
                          onPressed: () {
                            ref.invalidate(productCrudNotifierProvider);
                            ref.read(productCrudNotifierProvider);
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text("Refresh"),
                        ),
                      ],
                    ),
                  );
                },
                loading: () {
                  return const CenterLoadingWidget(label: "Fetching Products");
                },
                data: (products) {
                  return products.isEmpty
                      ? const Center(
                          child: Text("No products in inventory"),
                        )
                      : DataTable2(
                          columnSpacing: 24,
                          horizontalMargin: 8,
                          minWidth: 600,
                          dividerThickness: 0.25,
                          dataRowHeight: 54,
                          headingCheckboxTheme: context.theme.checkboxTheme,
                          datarowCheckboxTheme: context.theme.checkboxTheme,
                          checkboxHorizontalMargin: 0,
                          fixedLeftColumns: 1,
                          smRatio: 0.45,
                          onSelectAll: (value) {
                            ref
                                .read(itemsToSellNotifierProvider.notifier)
                                .toggleAllSelection(products);
                          },
                          columns: [
                            DataColumn2(
                              label: Text(
                                'Product',
                                style: context.bodySmall.bold700,
                              ),
                            ),
                            DataColumn2(
                              label: Text(
                                'Stock',
                                style: context.bodySmall.bold700,
                              ),
                              numeric: true,
                              size: ColumnSize.S,
                            ),
                            DataColumn2(
                              label: Text(
                                'Price',
                                style: context.bodySmall.bold700,
                              ),
                            ),
                            DataColumn2(
                              label: Text(
                                'Expiry Date',
                                style: context.bodySmall.bold700,
                              ),
                            ),
                          ],
                          rows: [
                            for (Product product in products)
                              DataRow(
                                selected: selectedItems.contains(product),
                                onSelectChanged: !selectableRows
                                    ? null
                                    : (value) {
                                        ref
                                            .read(itemsToSellNotifierProvider
                                                .notifier)
                                            .toggleSelection(product);
                                      },
                                onLongPress: () {
                                  ref
                                      .read(isSelectableRows.notifier)
                                      .update((state) => true);
                                  ref
                                      .read(
                                          itemsToSellNotifierProvider.notifier)
                                      .toggleSelection(product);
                                },
                                cells: [
                                  DataCell(
                                    Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      product.productName,
                                      style: context.bodySmall.secondaryColor,
                                    ),
                                    onTap: () {
                                      context.go(
                                          '/item_details/${product.productId}');
                                    },
                                  ),
                                  DataCell(
                                    Text(
                                      product.availableQty.toString(),
                                      style: context.bodySmall.secondaryColor,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "XAF ${product.sellingPrice.toInt()}",
                                      style: context.bodySmall.secondaryColor,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      product.expiryDate!.dateToString,
                                      style: context.bodySmall.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
