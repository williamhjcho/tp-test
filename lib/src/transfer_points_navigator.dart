import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nuds/nuds.dart';
import 'package:transfer_points_testing/src/summary/bloc/summary_bloc.dart';

import 'result/result_screen.dart';
import 'simulation/bloc/simulation_bloc.dart';
import 'simulation/simulation_input_screen.dart';
import 'summary/details_summary_screen.dart';

/// Simulating deep link call
Future<void> openTransferPoints(BuildContext context) {
  return Navigator.of(context).push(
    NuDSCardStackPageRoute<void>(
      builder: (context) => TransferPointsNavigator(),
    ),
  );
}

class TransferPointsNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final onClose = () => Navigator.of(context).pop();

    return Navigator(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return buildHome(settings, onClose: onClose);
          case '/summary':
            return buildSummary(settings);
          case '/result':
            return buildResult(settings, onClose: onClose);
        }
        return null;
      },
    );
  }

  Route<void> buildHome(RouteSettings settings, {VoidCallback onClose}) {
    return NuDSPageRoute<void>(
      settings: settings,
      builder: (context) => BlocProvider(
        create: (context) => SimulationBloc(),
        child: SimulationInputScreen(
          onClose: onClose,
          onNext: (value) {
            Navigator.of(context).pushNamed(
              '/summary',
              arguments: SummaryScreenArguments(value),
            );
          },
        ),
      ),
    );
  }

  Route<void> buildSummary(RouteSettings settings) {
    final SummaryScreenArguments args = settings.arguments;
    return NuDSPageRoute<void>(
      settings: settings,
      builder: (context) => BlocProvider(
        create: (context) => SummaryBloc(NumberFormat.decimalPattern()),
        child: DetailsSummaryScreen(
          transferableSmiles: args.transferableSmiles,
          onPrevious: () => Navigator.of(context).pop(),
          onNext: (smiles) =>
              Navigator.of(context)
                  .pushNamed(
                  '/result', arguments: ResultScreenArguments(smiles)),
        ),
      ),
    );
  }

  Route<void> buildResult(RouteSettings settings, {VoidCallback onClose}) {
    return NuDSPageRoute<void>(
      settings: settings,
      isBackGestureEnabled: false,
      builder: (context) => ResultScreen(onClose: onClose),
    );
  }
}
