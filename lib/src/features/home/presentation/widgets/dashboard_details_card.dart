import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stock_manager_admin/src/utils/constants/constants.dart';
import 'package:stock_manager_admin/src/utils/extensions/extensions.dart';

class DashboardDetailsCard extends ConsumerWidget {
  const DashboardDetailsCard({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.bgColor,
    required this.provider,
    this.providerHasTwoOutputs = false,
  });
  final String label;
  final String value;
  final IconData icon;
  final Color bgColor;
  final AsyncValue provider;
  final bool providerHasTwoOutputs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 120,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(
                    icon,
                    size: 20,
                  ),
                ),
              ),
              8.vGap,
              provider.maybeWhen(
                data: (data) {
                  return Text(
                    '$value${providerHasTwoOutputs ? data.$1.toString() : data.toString()}',
                    style: context.titleMedium.bold700,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  );
                },
                loading: () {
                  return const CardDataLoadingShimmer();
                },
                orElse: () => const Text("0"),
              ),
              6.vGap,
              Text(
                label,
                style: context.bodySmall.secondaryColor,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardDataLoadingShimmer extends StatelessWidget {
  const CardDataLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Opacity(
        opacity: 0.8,
        child: Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: Colors.white,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Loading',
                style: context.titleMedium.bold700,
              )
            ],
          ),
        ),
      ),
    );
  }
}
