import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/inventory_models.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseInventoryData {
  final _supabase = Supabase.instance.client;
  Future<List<Product>> getInventoryProducts() async {
    try {
      final data =
          await _supabase.from('inventory').select().count(CountOption.exact);
      final products = data.data.map((e) {
        return Product.fromJson(e);
      }).toList();
      return products;
    } catch (e, st) {
      'error getting inventory products: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<Product> getProductById(String productId) async {
    try {
      final data = await _supabase
          .from('inventory')
          .select()
          .eq('product_id', productId)
          .limit(1)
          .single();
      final product = Product.fromJson(data);
      return product;
    } catch (e, st) {
      'error getting product by id: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      await _supabase.from('inventory').upsert(product.toJson());
    } catch (e, st) {
      'error adding product: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<void> updateProduct(Product product) async {
    try {
      await _supabase
          .from('inventory')
          .update(product.toJson())
          .eq('product_id', product.productId);
    } catch (e, st) {
      'error updating product: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      // we don't delete, let's just update the is_active field to false
      // await _supabase.from('inventory').delete().eq('product_id', productId);
      await _supabase
          .from('inventory')
          .update({'is_active': false}).eq('product_id', productId);
    } catch (e, st) {
      'error deleting product: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  // get total active products in inventory. that is, products with is_active and each product * their stock qty
  Future<(int, int)> getTotalActiveProducts(int durationCode) async {
    try {
      // final endDate = DateTime.now();
      final startDate = durationCode.startDate;
      final data = await _supabase
          .from('inventory')
          .select('stock_qty')
          .eq('is_active', true)
          .gt('stock_qty', 0)
          .gte('created_at', startDate)
          .count(CountOption.exact);
      final total = data.data.fold<int>(
          0,
          (previousValue, element) =>
              previousValue + element['stock_qty'] as int);
      return (total, data.count);
    } catch (e, st) {
      'error getting total active products: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  /// CHECK [extensions/num.dart] extension FOR THE DURATION CODES and [startDate] extension
  Future<(int, int)> getTotalSoldProducts(int durationCode) async {
    try {
      final startDate = durationCode.startDate;
      final data = await _supabase
          .from('sales')
          .select('qty_sold')
          .gte('created_at', startDate)
          .count(CountOption.exact);
      final total = data.data.fold<int>(
          0,
          (previousValue, element) =>
              previousValue + element['qty_sold'] as int);
      return (total, data.count);
    } catch (e, st) {
      'error getting total sold products: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<int> getLowStockProductsCount(int durationCode) async {
    try {
      // final endDate = DateTime.now();
      final startDate = durationCode.startDate;
      final data = await _supabase
          .from('inventory')
          .select('stock_qty, safety_stock')
          .eq('is_active', true)
          .gt('stock_qty', 0)
          .eq('is_critical_stock', true)
          .gte('created_at', startDate)
          .count(CountOption.exact);
      return data.count;
    } catch (e, st) {
      'error getting total active products: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  // now let's calculate sales value for a given duration
  Future<int> getTotalSalesValue(int durationCode) async {
    try {
      DateTime startDate = durationCode.startDate;

      final data = await _supabase
          .from('sales')
          .select('selling_price, qty_sold')
          .gte('created_at', startDate)
          .count(CountOption.exact);
      final total = data.data.fold<int>(
          0,
          (previousValue, element) =>
              previousValue +
              ((element['selling_price'] as int) *
                  (element['qty_sold'] as int)));
      return total;
    } catch (e, st) {
      'error getting total sales value: $e: stacktrace: $st'.log();
      rethrow;
    }
  }

  Future<int> getTotalProfitWithinDuration(int durationCode) async {
    try {
      DateTime startDate = durationCode.startDate;

      final data = await _supabase
          .from('sales')
          .select('selling_price, qty_sold, inventory(cost_price)')
          .gte('created_at', startDate)
          .count(CountOption.exact);
      final total = data.data.fold<int>(
          0,
          (previousValue, element) => previousValue +
              ((element['selling_price'] as int) -
                      element['inventory']['cost_price'] as int) *
                  element['qty_sold'] as int);
      return total;
    } catch (e, st) {
      'error getting total profit: $e: stacktrace: $st'.log();
      rethrow;
    }
  }
}

final supabaseInventoryProvider = Provider((ref) => SupabaseInventoryData());
