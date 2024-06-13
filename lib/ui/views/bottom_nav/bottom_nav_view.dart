import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wise/ui/common/app_colors.dart';
import 'package:wise/ui/common/text_styles.dart';
import 'package:wise/ui/views/card/card_view.dart';
import 'package:wise/ui/views/home/home_view.dart';
import 'package:wise/ui/views/manage/manage_view.dart';
import 'package:wise/ui/views/recipients/recipients_view.dart';

import 'bottom_nav_viewmodel.dart';

class BottomNavView extends StatelessWidget {
  const BottomNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomNavViewModel>.reactive(
      viewModelBuilder: () => BottomNavViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: PageTransitionSwitcher(
          reverse: model.reverse,
          transitionBuilder: (child, animation, secondaryAnimation) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
              child: child,
            );
          },
          child: getViewForIndex(model.currentIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0XFF1D3108),
            selectedLabelStyle:
                kSubtitleRegularSmallTextStyle.copyWith(color: kcBlackColor),
            unselectedLabelStyle:
                kSubtitleRegularSmallTextStyle.copyWith(color: kcBlackColor),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.credit_card_outlined),
                label: 'Card',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline_rounded),
                label: 'Recipients',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'Manage',
              )
            ]),
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        return const CardView();
      case 2:
        return const RecipientsView();
      case 3:
        return const ManageView();
      default:
        return const HomeView();
    }
  }
}
