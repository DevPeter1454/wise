import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'recipients_viewmodel.dart';

class RecipientsView extends StatelessWidget {
  const RecipientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecipientsViewModel>.reactive(
      viewModelBuilder: () => RecipientsViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
