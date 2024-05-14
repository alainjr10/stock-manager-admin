import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/common/widgets/buttons.dart';
import 'package:stock_manager_admin/src/common/widgets/center_loading_widget.dart';
import 'package:stock_manager_admin/src/common/widgets/dialogs.dart';
import 'package:stock_manager_admin/src/common/widgets/text_form_fields.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/product_model.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/widgets/product_details_tile_widget.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class ItemDetailsScrn extends HookConsumerWidget {
  const ItemDetailsScrn({super.key, required this.productId});
  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    final productNameController = useTextEditingController();
    final availableQtyController = useTextEditingController();
    final costPriceController = useTextEditingController();
    final sellingPriceController = useTextEditingController();
    final expiryDateController = useTextEditingController();
    DateTime? expiryDate;
    final productChanged = ref.watch(productUpdatedController);
    ref.listen(productCrudNotifierProvider, (_, state) async {
      if (!state.hasError && !state.isLoading) {
        'product added successfully'.log();
        'Successfully added product!!!'.showInfoToast;
        context.go('/');
        // ref.read(selectedProductProvider.notifier).state = null;
      } else if (state.hasError) {
        'Error adding sales: ${state.error}'.log();
      }
    });
    ref.listen(
      getProductByIdNotifierProvider(productId),
      (_, state) async {
        if (!state.hasError && !state.isLoading) {
          final selectedProduct = state.asData!.value;
          productNameController.text = selectedProduct.productName;
          availableQtyController.text = selectedProduct.availableQty.toString();
          costPriceController.text = selectedProduct.costPrice.toString();
          sellingPriceController.text = selectedProduct.sellingPrice.toString();
          expiryDateController.text = selectedProduct.expiryDate!.dateToString;
        }
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Details"),
      ),
      body: ref.watch(getProductByIdNotifierProvider(productId)).when(
            data: (selectedProduct) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 12),
                      child: Column(
                        children: [
                          40.vGap,
                          EditableItemDetailsTile(
                            label: "Product Name",
                            value: selectedProduct.productName,
                            controller: productNameController,
                            onChanged: (p0) {
                              if (p0 != selectedProduct.productName) {
                                ref
                                    .read(productUpdatedController.notifier)
                                    .update((state) => true);
                              } else {
                                ref
                                    .read(productUpdatedController.notifier)
                                    .update((state) => false);
                              }
                            },
                          ),
                          const ItemDetailsTileDivider(),
                          EditableItemDetailsTile(
                            label: "Stock Quantity",
                            value: selectedProduct.availableQty.toString(),
                            controller: availableQtyController,
                            inputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (p0) {
                              if (p0 !=
                                  selectedProduct.availableQty.toString()) {
                                ref
                                    .read(productUpdatedController.notifier)
                                    .update((state) => true);
                              } else {
                                ref
                                    .read(productUpdatedController.notifier)
                                    .update((state) => false);
                              }
                            },
                          ),
                          const ItemDetailsTileDivider(),
                          EditableItemDetailsTile(
                            label: "Cost Price",
                            value: selectedProduct.costPrice.toString(),
                            controller: costPriceController,
                            inputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (p0) {
                              if (p0 != selectedProduct.costPrice.toString()) {
                                ref
                                    .read(productUpdatedController.notifier)
                                    .update((state) => true);
                              } else {
                                ref
                                    .read(productUpdatedController.notifier)
                                    .update((state) => false);
                              }
                            },
                          ),
                          const ItemDetailsTileDivider(),
                          EditableItemDetailsTile(
                            label: "Selling Price",
                            value: selectedProduct.sellingPrice.toString(),
                            controller: sellingPriceController,
                            inputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (p0) {
                              if (p0 !=
                                  selectedProduct.sellingPrice.toString()) {
                                ref
                                    .read(productUpdatedController.notifier)
                                    .update((state) => true);
                              } else {
                                ref
                                    .read(productUpdatedController.notifier)
                                    .update((state) => false);
                              }
                            },
                          ),
                          const ItemDetailsTileDivider(),
                          EditableItemDetailsTile(
                            label: "Expiry Date",
                            value: selectedProduct.expiryDate!.dateToString,
                            controller: expiryDateController,
                            valueWidget: GestureDetector(
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2045),
                                ).then((value) {
                                  if (value != null) {
                                    expiryDate = value;
                                    expiryDateController.text =
                                        value.dateToString;
                                  }
                                });
                              },
                              child: AbsorbPointer(
                                child: ItemDetailsCustomInputFormField(
                                  controller: expiryDateController,
                                  hintText: "Select expiry date",
                                ),
                              ),
                            ),
                            onChanged: (p0) {
                              if (p0 !=
                                  selectedProduct.expiryDate!.dateToString) {
                                ref
                                    .read(productUpdatedController.notifier)
                                    .update((state) => true);
                              } else {
                                ref
                                    .read(productUpdatedController.notifier)
                                    .update((state) => false);
                              }
                            },
                          ),
                          const ItemDetailsTileDivider(),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: ref.watch(productCrudNotifierProvider).maybeWhen(
                          orElse: () {
                            return Row(
                              children: [
                                Expanded(
                                  child: MainBtns(
                                    size: size,
                                    onPressed: !productChanged
                                        ? null
                                        : () {
                                            FocusScope.of(context).unfocus();
                                            showAdaptiveDialog(
                                              context: context,
                                              builder: (context) {
                                                final updProduct = Product(
                                                  productId:
                                                      selectedProduct.productId,
                                                  productName:
                                                      productNameController
                                                          .text,
                                                  availableQty: int.parse(
                                                      availableQtyController
                                                          .text),
                                                  costPrice: double.parse(
                                                      costPriceController.text),
                                                  sellingPrice: double.parse(
                                                      sellingPriceController
                                                          .text),
                                                  expiryDate: expiryDate,
                                                  dateAdded:
                                                      selectedProduct.dateAdded,
                                                  dateModified: DateTime.now(),
                                                );
                                                return ProductActionDialog(
                                                  dialogTitle: "Update Product",
                                                  dialogContent:
                                                      "Are you sure you want to update this product?",
                                                  dialogActionBtnText: "Update",
                                                  onActionBtnPressed: () {
                                                    context.pop();
                                                    ref
                                                        .read(
                                                            productCrudNotifierProvider
                                                                .notifier)
                                                        .updateProduct(
                                                          updProduct,
                                                        );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                    btnText: "Update Product",
                                  ),
                                ),
                                16.hGap,
                                Expanded(
                                  child: MainBtns(
                                    size: size,
                                    backgroundColor: Colors.red,
                                    borderSideColor: Colors.red,
                                    onPressed: () {
                                      showAdaptiveDialog(
                                        context: context,
                                        builder: (context) {
                                          return ProductActionDialog(
                                            dialogTitle: "Delete Product",
                                            dialogContent:
                                                "Are you sure you want to delete this product?",
                                            dialogActionBtnText: "Delete",
                                            onActionBtnPressed: () {
                                              context.pop();
                                              ref
                                                  .read(
                                                      productCrudNotifierProvider
                                                          .notifier)
                                                  .deleteProduct(
                                                    selectedProduct.productId,
                                                  );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    btnText: "Delete Product",
                                  ),
                                ),
                              ],
                            );
                          },
                          loading: () => MainBtnLoading(
                            size: size,
                          ),
                        ),
                  ),
                ],
              );
            },
            loading: () =>
                const CenterLoadingWidget(label: "Fetching Product..."),
            error: (error, _) {
              'Error getting product: $error'.log();
              return Center(
                child: Text("Error getting product: $error"),
              );
            },
          ),
    );
  }
}
