import 'package:flutter/material.dart';
import 'package:wise/ui/common/app_colors.dart';

class ContainerWidget extends StatelessWidget {
  final Widget topWidget;
  final Widget bottomWidget;
  const ContainerWidget({
    super.key,
    required this.topWidget,
    required this.bottomWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 225,
      decoration: const BoxDecoration(
          color: customGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [topWidget, bottomWidget],
        ),
      ),
    );
  }
}
