import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stock_manager_admin/src/features/inventory/domain/product_model.dart';
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
    await Future.delayed(const Duration(milliseconds: 2500));
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
      await _supabase.from('inventory').delete().eq('product_id', productId);
    } catch (e, st) {
      'error deleting product: $e: stacktrace: $st'.log();
      rethrow;
    }
  }
}

final supabaseInventoryProvider = Provider((ref) => SupabaseInventoryData());
