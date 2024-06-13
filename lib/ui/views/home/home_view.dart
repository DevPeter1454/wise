import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/svg.dart';

import 'package:skeletonizer/skeletonizer.dart';
import 'package:stacked/stacked.dart';
import 'package:wise/ui/common/app_colors.dart';
import 'package:wise/ui/common/app_constants.dart';
import 'package:wise/ui/common/app_strings.dart';
import 'package:wise/ui/common/text_styles.dart';
import 'package:wise/ui/common/ui_helpers.dart';
import 'package:wise/ui/widgets/card_widget.dart';
import 'package:wise/ui/widgets/container_widget.dart';
import 'package:wise/ui/widgets/custom_button.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Skeletonizer(
        enabled: viewModel.isLoading,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        badges.Badge(
                          position: badges.BadgePosition.topEnd(top: 2, end: 0),
                          showBadge: true,
                          child: CircleAvatar(
                            child: Text(accountUserString,
                                style: kBodyTextStyle.copyWith(
                                    color: kcBlackColor)),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 75,
                              decoration: BoxDecoration(
                                  color: const Color(0xFFAEE67F),
                                  borderRadius: BorderRadius.circular(16)),
                              child: Center(
                                  child: Text(earnString,
                                      style: kBodyTextStyle.copyWith(
                                          color: kcBlackColor))),
                            ),
                            IconButton.filled(
                                iconSize: 16,
                                icon: Icon(
                                  viewModel.isAmountVisible
                                      ? Icons.remove_red_eye
                                      : Icons.password,
                                  color: kcBlackColor,
                                ),
                                onPressed: () => viewModel.setIsAmountVisible(),
                                style: IconButton.styleFrom(
                                    backgroundColor: customGreyColor,
                                    minimumSize: const Size.fromRadius(10))),
                          ],
                        )
                      ],
                    ),
                    verticalSpaceMedium,
                    Skeletonizer(
                      enabled: viewModel.isLoading,
                      child: Text(
                        homeString,
                        style: kHeading2TextStyle.copyWith(fontSize: 32),
                      ),
                    ),
                    verticalSpaceTiny,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomButton(
                          icon: Icons.arrow_upward,
                          text: sendString,
                          onPressed: () {},
                          backgroundColor: kcPrimaryColor,
                        ),
                        horizontalSpaceSmall,
                        CustomButton(
                          icon: Icons.add,
                          text: addMoneyString,
                          onPressed: () {},
                          backgroundColor: customGreyColor,
                        ),
                        horizontalSpaceSmall,
                        CustomButton(
                          icon: Icons.arrow_downward,
                          text: requestString,
                          onPressed: () {},
                          backgroundColor: customGreyColor,
                        )
                      ],
                    ),
                    verticalSpaceSmall,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ContainerWidget(
                            topWidget: Row(children: [
                              Skeletonizer(
                                enabled: viewModel.isLoading,
                                child: CircleAvatar(
                                  child: SvgPicture.network(
                                    flagUrl,
                                    placeholderBuilder: (context) {
                                      return const CircularProgressIndicator();
                                    },
                                  ),
                                ),
                              ),
                              horizontalSpaceTiny,
                              Text(
                                usdString,
                                style: kSubtitleRegularTextStyle,
                              )
                            ]),
                            bottomWidget: Text(
                              viewModel.isAmountVisible ?amountString :hiddenString ,
                              style: kHeading2TextStyle.copyWith(
                                  color: kcBlackColor),
                            ),
                          ),
                          horizontalSpaceMedium,
                          ContainerWidget(
                            topWidget: Row(children: [
                              IconButton.filled(
                                  style: IconButton.styleFrom(
                                      backgroundColor: const Color(0XFFDDDFDA)),
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.add,
                                    color: kcBlackColor,
                                  )),
                              horizontalSpaceTiny,
                              Text(
                                openString,
                                style: kSubtitleRegularTextStyle,
                              )
                            ]),
                            bottomWidget: Text(
                             exploreString,
                              style: kSmallRegularTextStyle.copyWith(
                                  color: kcBlackColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    verticalSpaceMedium,
                    Skeletonizer(
                      enabled: viewModel.isLoading,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                             transactionString,
                              style: kHeading2TextStyle.copyWith(
                                  color: kcBlackColor),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(seeAllString,
                                  style: kSubtitleTextStyle.copyWith(
                                      color: kcBlackColor,
                                      decoration: TextDecoration.underline)),
                            )
                          ]),
                    ),
                    verticalSpaceTiny,
                    Skeletonizer(
                      enabled: viewModel.isLoading,
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: const CircleAvatar(
                          backgroundColor: customGreyColor,
                          child: Icon(Icons.add),
                        ),
                        title: Text(
                          titleString,
                          style:
                              kSubtitleTextStyle.copyWith(color: kcBlackColor),
                        ),
                        subtitle: Text(cancelledString,
                            style: kSmallRegularTextStyle.copyWith(
                                color: kcBlackColor)),
                        trailing: Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  transactionAmount,
                                  style: kSubtitleTextStyle.copyWith(
                                      color: kcBlackColor),
                                ),
                                verticalSpaceTiny,
                                Text(
                                  subchargeAmount,
                                  style: kBodyRegularTextStyle.copyWith(
                                      color: kcBlackColor),
                                )
                              ]),
                        ),
                      ),
                    ),
                    verticalSpaceMedium,
                    Skeletonizer(
                      enabled: viewModel.isLoading,
                      child: Text(
                        spendAnywhere,
                        style: kHeading2TextStyle.copyWith(color: kcBlackColor),
                      ),
                    ),
                    verticalSpaceMedium,
                    Container(
                      height: 460,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: viewModel.isLoading
                              ? Colors.grey.shade300
                              : const Color(0XFF1D3108),
                          borderRadius: BorderRadius.circular(16)),
                      child: Column(children: [
                        verticalSpaceSmall,
                        Image.network(
                          wisePayImage,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            );
                          },
                        ),
                        verticalSpaceSmall,
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(spendImageText,
                              style: kHeading1TextStyle.copyWith(
                                color: Colors.white,
                                fontSize: 36,
                              )),
                        )
                      ]),
                    ),
                    verticalSpaceMedium,
                    Skeletonizer(
                      enabled: viewModel.isLoading,
                      child: Text(
                        doMoreString,
                        style: kHeading2TextStyle.copyWith(color: kcBlackColor),
                      ),
                    ),
                    verticalSpaceMedium,
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CardWidget(
                              text: sendAndRequest,
                              url: wiseImageA),
                          horizontalSpaceMedium,
                          CardWidget(
                            text: autoConvert,
                            url: wiseImageB,
                            hasSpace: true,
                          ),
                          horizontalSpaceMedium,
                          CardWidget(
                            text: setUpDebits,
                            hasSpace: true,
                            url: wiseImageD,
                          ),
                          horizontalSpaceMedium,
                          CardWidget(
                              text: scheduleTransfer,
                              url: wiseImageC),
                        ],
                      ),
                    ),
                    verticalSpaceSmall,
                  ],
                )),
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
