import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nuds/nuds.dart';
import 'package:transfer_points_testing/business/business.dart';

import '../common/error_screen.dart';
import 'result_screen.dart';

class ResultConnector extends StoreConnector<TransferPointsState, ResultState> {
  ResultConnector({
    Key key,
    VoidCallback onClose,
  }) : super(
          key: key,
          onInit: (store) => store.dispatch(FetchResultAction()),
          converter: (store) => store.state.result,
          builder: (context, viewModel) {
            final appBar = TopBar(
              leadingIcon: NuDSIcons.close,
              leadingOnPressed: onClose,
            );
            Widget child;
            if (viewModel.loading) {
              child = ShimmeringClosureScreen(appBar: appBar);
            } else if (viewModel.error != null) {
              child = ErrorScreen(
                appBar: appBar,
                onAction: () => TransferPointsStore.of(context)
                    .dispatch(FetchResultAction()),
              );
            } else {
              child = ResultScreen(appBar: appBar, onNext: onClose);
            }
            return child;
          },
        );
}
