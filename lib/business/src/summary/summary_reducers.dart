import 'summary_actions.dart';
import 'summary_state.dart';

SummaryState summaryReducer(SummaryState state, dynamic action) {
  if (action is LoadSummaryAction) {
    state = state.copyWith(loading: true, error: null);
  } else if (action is LoadedSummaryAction) {
    state = state.copyWith(loading: false, error: action.error);
  }
  return state;
}
