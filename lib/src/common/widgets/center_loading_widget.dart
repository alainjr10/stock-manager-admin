import 'package:flutter/material.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class CenterLoadingWidget extends StatelessWidget {
  const CenterLoadingWidget({
    super.key,
    this.label,
  });
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (label != null) Text(label!),
          if (label != null) 8.vGap,
          CircularProgressIndicator.adaptive(
            backgroundColor: context.colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
