import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';

import '../interactors/transfer_points_interactor.dart';
import '../transfer_points_actions.dart';
import '../transfer_points_state.dart';

class LoadSimulationAction {}

class LoadedSimulationAction with EquatableMixin {
  LoadedSimulationAction({this.error});

  final Object error;

  @override
  List<Object> get props => [error];
}

class InputSimulationAction with EquatableMixin {
  InputSimulationAction(this.value);

  final int value;

  @override
  List<Object> get props => [value];
}

class FetchSimulationAction extends CallableTPThunkAction {
  @override
  dynamic call(
    Store<TransferPointsState> store,
    TransferPointsInteractor extraArgument,
  ) async {
    store.dispatch(LoadSimulationAction());
    try {
      await extraArgument.loadResult();
      store.dispatch(LoadedSimulationAction());
    } catch (error) {
      store.dispatch(LoadedSimulationAction(error: error));
    }
  }
}

dynamic fetchSimulationAction(
  Store<TransferPointsState> store,
  TransferPointsInteractor interactor,
) async {
  store.dispatch(LoadSimulationAction());
  try {
    await interactor.loadResult();
    store.dispatch(LoadedSimulationAction());
  } catch (error) {
    store.dispatch(LoadedSimulationAction(error: error));
  }
}
