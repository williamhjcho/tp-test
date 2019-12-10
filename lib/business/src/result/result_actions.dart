import 'package:equatable/equatable.dart';
import 'package:redux/redux.dart';

import '../interactors/transfer_points_interactor.dart';
import '../transfer_points_actions.dart';
import '../transfer_points_state.dart';

class LoadResultAction {}

class LoadedResultAction with EquatableMixin {
  LoadedResultAction({this.error});

  final Object error;

  @override
  List<Object> get props => [error];
}

class FetchResultAction extends CallableTPThunkAction {
  @override
  dynamic call(
    Store<TransferPointsState> store,
    TransferPointsInteractor extraArgument,
  ) async {
    store.dispatch(LoadResultAction());

    try {
      await extraArgument.loadResult();
      store.dispatch(LoadedResultAction());
    } catch (error) {
      store.dispatch(LoadedResultAction(error: error));
    }
  }
}
