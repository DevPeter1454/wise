import 'package:wise/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:wise/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:wise/ui/views/home/home_view.dart';
import 'package:wise/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wise/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:wise/ui/views/card/card_view.dart';
import 'package:wise/ui/views/recipients/recipients_view.dart';
import 'package:wise/ui/views/manage/manage_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: BottomNavView),
    MaterialRoute(page: CardView),
    MaterialRoute(page: RecipientsView),
    MaterialRoute(page: ManageView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
