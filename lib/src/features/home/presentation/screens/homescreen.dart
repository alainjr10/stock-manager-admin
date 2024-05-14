import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/product_model.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager_admin/src/utils/constants/constants.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(itemsToSellNotifierProvider);
    final selectableRows = ref.watch(isSelectableRows);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 120,
              child: Center(
                child: DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Inventory Manager",
                        style: context.headlineMedium.bold,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            HomeDrawerListTile(
              title: "Dashboard",
              icon: Icons.dashboard_outlined,
              isSelected: true,
              onTap: () {},
            ),
            HomeDrawerListTile(
              title: "Sales",
              icon: Icons.production_quantity_limits_outlined,
              onTap: () {},
            ),
            HomeDrawerListTile(
              title: "Products",
              icon: Icons.inventory_2_outlined,
              onTap: () {},
            ),
            HomeDrawerListTile(
              title: "Inventory Management",
              icon: Icons.inventory_outlined,
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go('/add_item');
        },
        backgroundColor: kAltSecondaryColor,
        foregroundColor: kSecondaryColor,
        label: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(
                    'Home Screen',
                  ),
                ],
              ),
            ),
            8.vGap,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Products in Inventory", style: context.titleSmall.bold),
                IconButton(
                  onPressed: () {
                    ref.invalidate(getInventoryProductsProvider);
                    ref.read(getInventoryProductsProvider);
                  },
                  icon: const Icon(Icons.refresh_outlined),
                ),
              ],
            ),
            8.vGap,
            SizedBox(
              height: size.height * 0.7,
              child: ref.watch(getInventoryProductsProvider).when(
                error: (error, stackTrace) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("An error occured loading products"),
                        TextButton.icon(
                          onPressed: () {
                            ref.invalidate(getInventoryProductsProvider);
                            ref.read(getInventoryProductsProvider);
                          },
                          icon: const Icon(Icons.refresh),
                          label: const Text("Refresh"),
                        ),
                      ],
                    ),
                  );
                },
                loading: () {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Fetching Products"),
                        8.vGap,
                        CircularProgressIndicator.adaptive(
                          backgroundColor: context.colorScheme.secondary,
                        ),
                      ],
                    ),
                  );
                },
                data: (products) {
                  return DataTable2(
                    columnSpacing: 24,
                    horizontalMargin: 8,
                    minWidth: 600,
                    dividerThickness: 0.25,
                    headingCheckboxTheme: context.theme.checkboxTheme,
                    datarowCheckboxTheme: context.theme.checkboxTheme,
                    checkboxHorizontalMargin: 0,
                    fixedLeftColumns: 1,
                    smRatio: 0.5,
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
                          'Last Order Date',
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
                                      .read(
                                          itemsToSellNotifierProvider.notifier)
                                      .toggleSelection(product);
                                },
                          onLongPress: () {
                            ref
                                .read(isSelectableRows.notifier)
                                .update((state) => true);
                            ref
                                .read(itemsToSellNotifierProvider.notifier)
                                .toggleSelection(product);
                          },
                          cells: [
                            DataCell(
                              Text(
                                product.productName,
                                style: context.bodySmall.secondaryColor,
                              ),
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
                                product.dateModified!.dateToString,
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
