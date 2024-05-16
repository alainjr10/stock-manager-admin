import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stock_manager_admin/src/features/home/presentation/widgets/home_drawer_list_tile.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class HomeScreenDrawer extends StatelessWidget {
  const HomeScreenDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            onTap: () {
              context.go('/');
            },
          ),
          HomeDrawerListTile(
            title: "Sales",
            icon: Icons.production_quantity_limits_outlined,
            onTap: () {
              context.go('/sales');
            },
          ),
          HomeDrawerListTile(
            title: "Inventory Management",
            icon: Icons.inventory_outlined,
            onTap: () {
              context.go('/inventory');
            },
          ),
        ],
      ),
    );
  }
}
