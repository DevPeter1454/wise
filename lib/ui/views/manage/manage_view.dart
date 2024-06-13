import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'manage_viewmodel.dart';

class ManageView extends StatelessWidget {
  const ManageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ManageViewModel>.reactive(
      viewModelBuilder: () => ManageViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
