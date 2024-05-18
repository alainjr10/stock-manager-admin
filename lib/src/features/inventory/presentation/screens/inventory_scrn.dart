import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/common/widgets/center_loading_widget.dart';
import 'package:stock_manager_admin/src/common/widgets/dropdowns.dart';
import 'package:stock_manager_admin/src/common/widgets/text_form_fields.dart';
import 'package:stock_manager_admin/src/features/home/presentation/widgets/dashboard_details_card.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/widgets/product_status_widget.dart';
import 'package:stock_manager_admin/src/utils/constants/constants.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class InventoryScrn extends StatefulHookConsumerWidget {
  const InventoryScrn({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InventoryScrnState();
}

class _InventoryScrnState extends ConsumerState<InventoryScrn> {
  bool fieldSubmitted = false;
  @override
  Widget build(BuildContext context) {
    // final selectedItems = ref.watch(itemsToSellNotifierProvider);
    // final selectableRows = ref.watch(isSelectableRows);
    final selectedDurationCode = ref.watch(generalDurationCode);
    final searchController = useTextEditingController();
    FocusNode focusNode = useFocusNode();
    final size = MediaQuery.sizeOf(context);
    final searchFieldIsActive = ref.watch(isSearchFieldActiveProvider);
    final searchedProds = ref.watch(searchProductsNotifierProvider);
    focusNode.addListener(() {
      if (focusNode.hasFocus && !searchFieldIsActive) {
        fieldSubmitted = false;
        ref.read(isSearchFieldActiveProvider.notifier).state =
            focusNode.hasFocus;
      } else if (!focusNode.hasFocus &&
          searchFieldIsActive &&
          !fieldSubmitted) {
        ref.read(isSearchFieldActiveProvider.notifier).state = true;
      }
    });
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
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FilterInventoryCardDropdown(
                selectedDurationCode: selectedDurationCode),
            8.vGap,
            Row(
              children: [
                Expanded(
                  child: DashboardDetailsCard(
                    bgColor: Colors.green,
                    icon: Icons.input_outlined,
                    label: "Stock In",
                    value: '',
                    provider: ref
                        .watch(getTotalProductsProvider(selectedDurationCode)),
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
                    provider: ref
                        .watch(getSoldProductsProvider(selectedDurationCode)),
                    providerHasTwoOutputs: true,
                  ),
                ),
              ],
            ),
            12.vGap,
            Row(
              children: [
                Expanded(
                  child: DashboardDetailsCard(
                    bgColor: kAltSecondaryColor,
                    icon: Icons.inventory_2_outlined,
                    label: "Total Stock",
                    value: '',
                    provider: ref
                        .watch(getTotalProductsProvider(selectedDurationCode)),
                    providerHasTwoOutputs: true,
                  ),
                ),
                12.hGap,
                Expanded(
                  child: DashboardDetailsCard(
                    bgColor: Colors.orange,
                    icon: Icons.monetization_on_outlined,
                    label: "Low Stock",
                    value: '',
                    provider: ref.watch(getLowStockCountProvider(0)),
                  ),
                ),
              ],
            ),
            12.vGap,
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
              height: 40,
              child: CustomInputFormField(
                hintText: "Search Product",
                controller: searchController,
                focusNode: focusNode,
                onFieldSubmitted: (p0) {
                  fieldSubmitted = true;
                  ref
                      .read(searchProductsNotifierProvider.notifier)
                      .searchProducts(query: p0);
                  ref.read(isSearchFieldActiveProvider.notifier).state = false;
                  focusNode.unfocus();
                },
                validator: (p0) {
                  return null;
                },
                onChanged: (value) {
                  ref
                      .read(searchQueryProvider.notifier)
                      .update((state) => value);
                  ref.read(filteredProductNamesProvider);
                },
                onClear: () {
                  searchController.clear();
                  focusNode.unfocus();
                  ref.read(isSearchFieldActiveProvider.notifier).state = false;
                  ref.read(searchQueryProvider.notifier).update((state) => '');
                  ref.read(filteredProductNamesProvider.notifier).state = [];
                  'current focus val: ${focusNode.hasFocus} and search field active state $searchFieldIsActive'
                      .log();
                  setState(() {});
                },
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 12.0,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.4,
              child: searchFieldIsActive
                  ? SizedBox(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...ref.watch(filteredProductNamesProvider).map((e) {
                              return ListTile(
                                onTap: () {
                                  fieldSubmitted = true;
                                  ref
                                      .read(
                                          filteredProductNamesProvider.notifier)
                                      .state = [];
                                  ref
                                      .read(searchProductsNotifierProvider
                                          .notifier)
                                      .searchProducts(
                                          query: e, searchFullText: true);
                                  searchController.text = e;
                                  focusNode.unfocus();
                                  ref
                                      .read(
                                          isSearchFieldActiveProvider.notifier)
                                      .state = false;
                                },
                                title: Text(e),
                                trailing: Icon(
                                  Icons.arrow_outward_rounded,
                                  color: context.colorScheme.secondary,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    )
                  : searchController.text.isNotEmpty
                      ? searchedProds.when(
                          error: (error, stackTrace) {
                            return FetchProductsLoading(
                              invalidateProvider:
                                  searchProductsNotifierProvider,
                              readProvider: searchProductsNotifierProvider,
                            );
                          },
                          loading: () {
                            return const CenterLoadingWidget(
                                label: "Fetching Products");
                          },
                          data: (products) {
                            return products.isEmpty
                                ? const Center(
                                    child: Text("No products found"),
                                  )
                                : FetchInventoryProducsData(
                                    products: products,
                                  );
                          },
                        )
                      : ref.watch(productCrudNotifierProvider).when(
                          error: (error, stackTrace) {
                            return FetchProductsLoading(
                              invalidateProvider: productCrudNotifierProvider,
                              readProvider: productCrudNotifierProvider,
                            );
                          },
                          loading: () {
                            return const CenterLoadingWidget(
                                label: "Fetching Products");
                          },
                          data: (products) {
                            return products.isEmpty
                                ? const Center(
                                    child: Text("No products in inventory"),
                                  )
                                : FetchInventoryProducsData(
                                    products: products,
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

class FetchInventoryProducsData extends ConsumerWidget {
  const FetchInventoryProducsData({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(itemsToSellNotifierProvider);
    final selectableRows = ref.watch(isSelectableRows);
    return DataTable2(
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
            'Status',
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
                        .read(itemsToSellNotifierProvider.notifier)
                        .toggleSelection(product);
                  },
            onLongPress: () {
              ref.read(isSelectableRows.notifier).update((state) => true);
              ref
                  .read(itemsToSellNotifierProvider.notifier)
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
                  context.go('/item_details/${product.productId}');
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
                ProductStatusWidget(product: product),
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
  }
}

class FetchProductsLoading extends ConsumerWidget {
  const FetchProductsLoading({
    super.key,
    required this.invalidateProvider,
    required this.readProvider,
  });
  final ProviderOrFamily invalidateProvider;
  final ProviderListenable readProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("An error occured loading products"),
          TextButton.icon(
            onPressed: () {
              ref.invalidate(productCrudNotifierProvider);
              ref.read(readProvider);
            },
            icon: const Icon(Icons.refresh),
            label: const Text("Refresh"),
          ),
        ],
      ),
    );
  }
}
