import 'package:flutter/material.dart';
import 'package:nuds/nuds.dart';

import 'result/result_connector.dart';
import 'simulation/simulation_connector.dart';
import 'summary/summary_connector.dart';

class TransferPointsNavigator extends StatelessWidget {
  const TransferPointsNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onClose = () => Navigator.of(context).pop();

    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return buildSimulation(settings, onClose: onClose);
          case '/summary':
            return buildSummary(settings);
          case 'result':
            return buildResult(settings, onClose: onClose);
        }
        return null;
      },
    );
  }

  Route<void> buildSimulation(RouteSettings settings, {VoidCallback onClose}) {
    return NuDSPageRoute<void>(
      settings: settings,
      builder: (context) => SimulationConnector(
        onClose: onClose,
        onNext: () => Navigator.of(context).pushNamed('/summary'),
      ),
    );
  }

  Route<void> buildSummary(RouteSettings settings) {
    return NuDSPageRoute<void>(
      settings: settings,
      builder: (context) => SummaryConnector(
        onNext: () => Navigator.of(context).pushNamed('result'),
        onEdit: () => Navigator.of(context).popUntil(ModalRoute.withName('/')),
      ),
    );
  }

  Route<void> buildResult(RouteSettings settings, {VoidCallback onClose}) {
    return NuDSPageRoute<void>(
      settings: settings,
      isBackGestureEnabled: false,
      builder: (context) => ResultConnector(onClose: onClose),
    );
  }
}
