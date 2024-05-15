import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class LocalInventoryData {
  Future<List<Product>> getInventoryProducts() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    // return Future.error("error");
    return availableInventory;
  }

  Future<Product> getProductById(String productId) async {
    await Future.delayed(const Duration(milliseconds: 2500));
    return availableInventory
        .firstWhere((element) => element.productId == productId);
  }

  Future<void> addProduct(Product product) async {
    await Future.delayed(const Duration(milliseconds: 2500));
    availableInventory.add(product);
  }

  Future<void> updateProduct(Product product) async {
    await Future.delayed(const Duration(milliseconds: 2500));
    final index = availableInventory
        .indexWhere((element) => element.productId == product.productId);
    availableInventory[index] = product;
    'updated product is: ${availableInventory[index].toString()}'.log();
  }

  Future<void> deleteProduct(String productId) async {
    await Future.delayed(const Duration(milliseconds: 2500));
    availableInventory.removeWhere((element) => element.productId == productId);
  }

  List<Product> availableInventory = [
    Product(
      productId: "1",
      productName: "Milk",
      costPrice: 2500,
      sellingPrice: 3200,
      availableQty: 50,
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),
      expiryDate: DateTime(2028, 9, 12),
    ),
    Product(
      productId: "2",
      productName: "Office Table",
      costPrice: 60000,
      sellingPrice: 75000,
      availableQty: 27,
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),
      expiryDate: DateTime(2029, 2, 04),
    ),
    Product(
      productId: "3",
      productName:
          "22\" Bezeless Dell monitor with the bezels absent and absentesas because of dyceman kakaraka aka jaburat",
      costPrice: 33000,
      sellingPrice: 45000,
      availableQty: 40,
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),
      expiryDate: DateTime(2025, 05, 28),
    ),
  ];
}

final localInventoryProvider = Provider((ref) => LocalInventoryData());
