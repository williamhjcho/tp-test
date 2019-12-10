import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';

import '../interactors/transfer_points_interactor.dart';
import '../transfer_points_actions.dart';
import '../transfer_points_state.dart';

class LoadSummaryAction {}

class LoadedSummaryAction with EquatableMixin {
  LoadedSummaryAction({this.error});

  final Object error;

  @override
  List<Object> get props => [error];
}

class FetchSummaryAction extends CallableTPThunkAction {
  @override
  dynamic call(
    Store<TransferPointsState> store,
    TransferPointsInteractor extraArgument,
  ) async {
    store.dispatch(LoadSummaryAction());

    try {
      final value = store.state.simulation.points;
      await extraArgument.loadSummary(value);
      store.dispatch(LoadedSummaryAction());
    } catch (error) {
      store.dispatch(LoadedSummaryAction(error: error));
    }
  }
}
