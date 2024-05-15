import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager_admin/src/features/add_item/presentation/screens/add_item_scrn.dart';
import 'package:stock_manager_admin/src/features/add_item/presentation/screens/confirm_item_details.dart';
import 'package:stock_manager_admin/src/features/home/presentation/screens/homescreen.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/screens/product_details.dart';
import 'package:stock_manager_admin/src/features/inventory/presentation/view_models/inventory_providers.dart';
import 'package:stock_manager_admin/src/features/sales/presentation/screens/sales_scrn.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';
part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  // final shellNavigatorKey = GlobalKey<NavigatorState>();
  final router = GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeScreen();
        },
        onExit: (context, state) {
          'Exiting HomeScreen'.log();
          if (ref.watch(isSelectableRows)) {
            ref.read(itemsToSellNotifierProvider.notifier).clearProducts();
            ref.read(isSelectableRows.notifier).update((state) => false);
            'dont pop out now'.log();
            return false;
          } else {
            'now pop out'.log();
            return true;
          }
        },
        routes: [
          GoRoute(
            path: 'add_item',
            builder: (context, state) {
              return const AddItemScreen();
            },
            routes: [
              GoRoute(
                path: 'confirm_item_details',
                builder: (context, state) {
                  return const ConfirmItemDetails();
                },
              ),
            ],
          ),
          GoRoute(
            path: 'item_details/:item_id',
            builder: (context, state) {
              final productId = state.pathParameters['item_id']!;
              return ItemDetailsScrn(
                productId: productId,
              );
            },
          ),
          GoRoute(
              path: 'sales',
              builder: (context, state) {
                return const SalesScrn();
              })
        ],
      ),
    ],
  );
  return router;
}
