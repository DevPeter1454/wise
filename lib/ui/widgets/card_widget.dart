import 'package:flutter/material.dart';
import 'package:wise/ui/common/app_colors.dart';
import 'package:wise/ui/common/text_styles.dart';
import 'package:wise/ui/common/ui_helpers.dart';

class CardWidget extends StatelessWidget {
  final String text;
  final String url;
  final bool? hasSpace;
  const CardWidget({
    super.key,
    required this.text,
    required this.url,
    this.hasSpace = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 225,
        width: 200,
        decoration: BoxDecoration(
            color: const Color(0XFFFBEB7C),
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: kSubtitleTextStyle.copyWith(
                      color: kcBlackColor, fontSize: 18),
                ),
                hasSpace == true ? verticalSpaceMedium : verticalSpaceTiny,
                Center(child: Image.network(url, height: 150))
              ]),
        ));
  }
}
