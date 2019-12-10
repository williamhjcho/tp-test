import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'interactors/transfer_points_interactor.dart';
import 'transfer_points_middleware.dart';
import 'transfer_points_reducers.dart';
import 'transfer_points_state.dart';

class TransferPointsStore extends Store<TransferPointsState> {
  TransferPointsStore({
    @required TransferPointsInteractor interactor,
  }) : super(
          transferPointsReducer,
          initialState: const TransferPointsState(),
          middleware: buildMiddleware(interactor: interactor),
        );

  static Store<TransferPointsState> of(BuildContext context) =>
      StoreProvider.of<TransferPointsState>(context);
}
