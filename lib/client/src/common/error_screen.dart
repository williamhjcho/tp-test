import 'package:flutter/material.dart';
import 'package:nuds/nuds.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key key,
    this.appBar,
    @required this.onAction,
  }) : super(key: key);

  final PreferredSizeWidget appBar;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Screen.raw(
      appBar: appBar,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: ErrorMessage(
          icon: NuDSIcons.warning,
          text: 'Some error occurred',
          actionTitle: 'RETRY',
          onAction: onAction,
        ),
      ),
    );
  }
}
