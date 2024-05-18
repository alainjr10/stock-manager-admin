import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/common/widgets/buttons.dart';
import 'package:stock_manager_admin/src/common/widgets/text_form_fields.dart';
import 'package:stock_manager_admin/src/features/add_item/presentation/view_models/add_item_providers.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';
import 'package:uuid/uuid.dart';

class AddItemScreen extends ConsumerStatefulWidget {
  const AddItemScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends ConsumerState<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _productNameController = TextEditingController();
  final _costPriceController = TextEditingController();
  final _sellingPriceController = TextEditingController();
  // final  _productBrandController = TextEditingController();
  final _quantityController = TextEditingController();
  final _safetyStockController = TextEditingController(text: "5");
  final _expiryDateController = TextEditingController();
  DateTime _expiryDate = DateTime(2040);
  final uuid = const Uuid();
  @override
  void initState() {
    super.initState();
    _expiryDateController.text = _expiryDate.dateToString;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final selectedItems = ref.watch(itemsToSellNotifierProvider);
    double totalPrice = 0;
    totalPrice = selectedItems.fold<double>(
        totalPrice,
        (previousValue, element) =>
            previousValue + element.sellingPrice * element.orderQty);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        ref.read(selectedProductProvider.notifier).state = null;
        context.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Product"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      12.vGap,
                      // Text(
                      //   "Product Image",
                      //   style: context.labelMedium,
                      // ),
                      // 8.vGap,
                      // SizedBox(
                      //   height: 150,
                      //   width: size.width,
                      //   child: DecoratedBox(
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(8),
                      //       border: Border.all(
                      //         color: context.colorScheme.onPrimaryContainer,
                      //       ),
                      //     ),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         Icon(
                      //           Icons.photo_library_outlined,
                      //           size: 40,
                      //           color: context.colorScheme.onPrimaryContainer,
                      //         ),
                      //         12.vGap,
                      //         Text(
                      //           "Upload product image",
                      //           style: context.labelSmall,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // 16.vGap,

                      // DropdownButtonFormField(
                      //   decoration: InputDecoration(
                      //     hintText: "Select product category",
                      //     hintStyle: TextStyle(color: Colors.grey.shade400),
                      //   ),
                      //   items: [
                      //     // Replace with your actual categories
                      //     DropdownMenuItem(
                      //         value: "Electronics", child: Text("Electronics")),
                      //     DropdownMenuItem(
                      //         value: "Clothing", child: Text("Clothing")),
                      //     // ... more categories
                      //   ],
                      //   onChanged: (value) {},
                      // ),

                      const SizedBox(height: 16),

                      // Product Name, Brand, Quantity Fields
                      CustomInputField(
                        controller: _productNameController,
                        mainLabel: "Product name",
                        hintText: "Input product name",
                      ),
                      16.vGap,
                      CustomInputField(
                        controller: _costPriceController,
                        mainLabel: "Cost Price",
                        hintText: "XAF...",
                        inputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      16.vGap,
                      CustomInputField(
                        controller: _sellingPriceController,
                        mainLabel: "Selling Price",
                        hintText: "XAF...",
                        inputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      // 16.vGap,
                      // CustomInputField(
                      //   mainLabel: "Product Brand",
                      //   hintText: "Input product brand",
                      // ),
                      16.vGap,
                      CustomInputField(
                        controller: _quantityController,
                        mainLabel: "Quantity available",
                        hintText: "Input quantity available",
                        inputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      16.vGap,
                      CustomInputField(
                        controller: _safetyStockController,
                        mainLabel: "Safety stock",
                        hintText: "Input safety stock",
                        inputType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                      16.vGap,
                      // Add expiry date that uses a datepicker
                      GestureDetector(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2045),
                          ).then((value) {
                            if (value != null) {
                              _expiryDate = value;
                              _expiryDateController.text = value.dateToString;
                            }
                          });
                        },
                        child: AbsorbPointer(
                          child: CustomInputField(
                            controller: _expiryDateController,
                            mainLabel: "Expiry Date",
                            hintText: "Select expiry date",
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
            8.vGap,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: MainBtns(
                size: size,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final product = Product(
                      productId: uuid.v4(),
                      productName: _productNameController.text,
                      costPrice: int.parse(_costPriceController.text),
                      sellingPrice: int.parse(_sellingPriceController.text),
                      availableQty: int.parse(_quantityController.text),
                      safetyStock: int.parse(_safetyStockController.text),
                      imageUrl: "",
                      expiryDate: _expiryDate,
                      dateAdded: DateTime.now(),
                      dateModified: DateTime.now(),
                    );
                    ref.read(selectedProductProvider.notifier).state = product;
                    context.go("/add_item/confirm_item_details");
                  }
                },
                btnText: "Next",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
