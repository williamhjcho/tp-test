import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:nuds/nuds.dart';
import 'package:redux/redux.dart';
import 'package:transfer_points_testing/business/business.dart';

import '../common/error_screen.dart';
import '../utils/points_input_formatter.dart';
import 'details_summary_screen.dart';

class SummaryConnector extends StoreConnector<TransferPointsState, _ViewModel> {
  SummaryConnector({
    Key key,
    @required VoidCallback onNext,
    @required VoidCallback onEdit,
  }) : super(
          key: key,
          onInit: (store) => store.dispatch(FetchSummaryAction()),
          converter: (store) => _ViewModel(store),
          builder: (context, viewModel) {
            final appBar = TopBar();
            Widget child;
            if (viewModel.loading) {
              child = ShimmeringSummaryScreen(appBar: appBar);
            } else if (viewModel.error != null) {
              child = ErrorScreen(
                appBar: appBar,
                onAction: viewModel.onAction,
              );
            } else {
              child = DetailsSummaryScreen(
                appBar: appBar,
                onNext: onNext,
                onEdit: onEdit,
                points: viewModel.points,
              );
            }
            return child;
          },
        );
}

class _ViewModel {
  factory _ViewModel(Store<TransferPointsState> store) {
    final state = store.state;
    final formatter = PointsInputFormatter();

    return _ViewModel._(
      points: formatter.format(state.points),
      loading: state.summary.loading,
      error: state.summary.error,
      onAction: () => store.dispatch(FetchSummaryAction()),
    );
  }

  _ViewModel._({this.points, this.loading, this.error, this.onAction});

  final String points;
  final bool loading;
  final Object error;
  final VoidCallback onAction;
}
