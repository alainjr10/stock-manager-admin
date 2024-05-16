import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/common/widgets/center_loading_widget.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager_admin/src/features/sales/presentation/view_models/sales_providers.dart';
import 'package:stock_manager_admin/src/utils/constants/constants.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class SalesScrn extends ConsumerWidget {
  const SalesScrn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final selectedItems = ref.watch(itemsToSellNotifierProvider);
    // final selectableRows = ref.watch(isSelectableRows);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/add_item');
        },
        backgroundColor: kAltSecondaryColor,
        foregroundColor: kSecondaryColor,
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
            8.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Sales Records", style: context.titleSmall.bold),
                IconButton(
                  onPressed: () {
                    ref.invalidate(salesNotifierProvider);
                    ref.read(salesNotifierProvider);
                  },
                  icon: const Icon(Icons.refresh_outlined),
                ),
              ],
            ),
            8.vGap,
            SizedBox(
              height: size.height * 0.45,
              child: ref.watch(salesNotifierProvider).when(
                error: (error, stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("An error occured loading products"),
                        TextButton.icon(
                          onPressed: () {
                            ref.invalidate(salesNotifierProvider);
                            ref.read(salesNotifierProvider);
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
                data: (sales) {
                  return sales.isEmpty
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
                            // ref
                            //     .read(itemsToSellNotifierProvider.notifier)
                            //     .toggleAllSelection(products);
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
                                'Qty Sold',
                                style: context.bodySmall.bold700,
                              ),
                              numeric: true,
                              size: ColumnSize.S,
                            ),
                            DataColumn2(
                              label: Text(
                                'Selling Price',
                                style: context.bodySmall.bold700,
                              ),
                            ),
                            DataColumn2(
                              label: Text(
                                'Sold On',
                                style: context.bodySmall.bold700,
                              ),
                            ),
                          ],
                          rows: [
                            for (SalesProductModel sale in sales)
                              DataRow(
                                // selected: selectedItems.contains(product),
                                // onSelectChanged: !selectableRows
                                //     ? null
                                //     : (value) {
                                //         ref
                                //             .read(itemsToSellNotifierProvider
                                //                 .notifier)
                                //             .toggleSelection(product);
                                //       },
                                // onLongPress: () {
                                //   ref
                                //       .read(isSelectableRows.notifier)
                                //       .update((state) => true);
                                //   ref
                                //       .read(
                                //           itemsToSellNotifierProvider.notifier)
                                //       .toggleSelection(product);
                                // },
                                cells: [
                                  DataCell(
                                    Text(
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      sale.product.productName,
                                      style: context.bodySmall.secondaryColor,
                                    ),
                                    onTap: () {
                                      context.go(
                                          '/item_details/${sale.product.productId}');
                                    },
                                  ),
                                  DataCell(
                                    Text(
                                      sale.salesModel.qtySold.toString(),
                                      style: context.bodySmall.secondaryColor,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "XAF ${sale.salesModel.sellingPrice.toInt()}",
                                      style: context.bodySmall.secondaryColor,
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      sale.salesModel.dateAdded!
                                          .dateTimeToString,
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

class HomeDrawerListTile extends StatelessWidget {
  const HomeDrawerListTile({
    super.key,
    required this.title,
    this.onTap,
    required this.icon,
    this.isSelected = false,
  });
  final String title;
  final Function()? onTap;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(
        icon,
        color: context.colorScheme.onPrimary,
      ),
      onTap: onTap,
      selectedColor: context.colorScheme.onPrimary,
      selectedTileColor: context.colorScheme.primaryContainer,
      selected: isSelected,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
