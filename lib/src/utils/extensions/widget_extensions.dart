import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension Spacing on num {
  // vertical spacing
  SizedBox get vGap => SizedBox(height: toDouble().h);
  SizedBox get hGap => SizedBox(width: toDouble().w);
  SizedBox get gap => const SizedBox.shrink();
}
