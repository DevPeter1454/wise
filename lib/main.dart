import 'package:flutter/material.dart';
import 'package:wise/app/app.bottomsheets.dart';
import 'package:wise/app/app.dialogs.dart';
import 'package:wise/app/app.locator.dart';
import 'package:wise/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

   
import 'package:wise/ui/common/app_constants.dart';
Future<void> main() async
    {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
   
  setupDialogUi();
  runApp(const MainApp
   ());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.startupView,
      title: kAppName,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
