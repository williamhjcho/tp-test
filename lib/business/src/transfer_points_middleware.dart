import 'package:flutter/foundation.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'interactors/transfer_points_interactor.dart';
import 'transfer_points_actions.dart';
import 'transfer_points_state.dart';

List<Middleware<TransferPointsState>> buildMiddleware({
  @required TransferPointsInteractor interactor,
}) {
  return [
    _validateStore(),
    thunkMiddleware,
    ExtraArgumentThunkMiddleware<TransferPointsState, TransferPointsInteractor>(
      interactor,
    ),
  ];
}

/// Redux's Store doesn't have a 'isClosed' property, so this will have to
/// act as a initial condition before running through other middleware and
/// reducer(s).
Middleware<TransferPointsState> _validateStore() {
  bool isClosed = false;
  return (store, dynamic action, next) {
    if (action is CloseStoreAction) isClosed = true;
    if (!isClosed) next(action);
  };
}
