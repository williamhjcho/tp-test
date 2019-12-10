import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nuds/nuds.dart';
import 'package:transfer_points_testing/business/business.dart';

import '../common/error_screen.dart';
import 'simulation_input_screen.dart';

class SimulationConnector
    extends StoreConnector<TransferPointsState, SimulationState> {
  SimulationConnector({
    Key key,
    @required VoidCallback onClose,
    @required VoidCallback onNext,
  }) : super(
          key: key,
          onInit: (store) => store.dispatch(FetchSimulationAction()),
          converter: (store) => store.state.simulation,
          builder: (context, state) {
            final appBar = TopBar(leadingOnPressed: onClose);
            Widget child;
            if (state.loading) {
              child = ShimmeringInputScreen(
                appBar: appBar,
              );
            } else if (state.error != null) {
              child = ErrorScreen(
                appBar: appBar,
                onAction: () =>
                    _dispatchAction(context, FetchSimulationAction()),
              );
            } else {
              child = SimulationInputScreen(
                appBar: appBar,
                onNext: (value) {
                  _dispatchAction(context, InputSimulationAction(value));
                  onNext();
                },
              );
            }

            return child;
          },
        );

  static void _dispatchAction(BuildContext context, dynamic action) {
    TransferPointsStore.of(context).dispatch(action);
  }
}
