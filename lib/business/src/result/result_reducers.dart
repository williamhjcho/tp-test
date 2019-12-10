import 'result_actions.dart';
import 'result_state.dart';

ResultState resultReducer(ResultState state, dynamic action) {
  if (action is LoadResultAction) {
    state = state.copyWith(loading: true, error: null);
  } else if (action is LoadedResultAction) {
    state = state.copyWith(loading: false, error: action.error);
  }
  return state;
}
