import 'package:redux_thunk/redux_thunk.dart';

import 'interactors/transfer_points_interactor.dart';
import 'transfer_points_state.dart';

class CloseStoreAction {}

abstract class CallableTPThunkAction
    implements
        CallableThunkActionWithExtraArgument<TransferPointsState,
            TransferPointsInteractor> {}
