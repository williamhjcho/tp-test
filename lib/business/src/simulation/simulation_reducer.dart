import 'package:redux/redux.dart';

import 'simulation_actions.dart';
import 'simulation_state.dart';

final simulationReducer = combineReducers<SimulationState>([
  TypedReducer<SimulationState, LoadSimulationAction>(_loading),
  TypedReducer<SimulationState, LoadedSimulationAction>(_loaded),
  TypedReducer<SimulationState, InputSimulationAction>(_input),
]);

SimulationState _loading(SimulationState state, dynamic action) {
  return state.copyWith(loading: true, error: null);
}

SimulationState _loaded(SimulationState state, LoadedSimulationAction action) {
  return state.copyWith(loading: false, error: action.error);
}

SimulationState _input(SimulationState state, InputSimulationAction action) {
  return state.copyWith(points: action.value);
}
