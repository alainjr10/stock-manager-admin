import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stock_manager_admin/src/features/add_item/presentation/screens/add_item_scrn.dart';
import 'package:stock_manager_admin/src/features/home/presentation/screens/homescreen.dart';
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
        routes: [
          GoRoute(
            path: 'add_item',
            builder: (context, state) {
              return const AddItemScreen();
            },
          ),
        ],
      ),
    ],
  );
  return router;
}
