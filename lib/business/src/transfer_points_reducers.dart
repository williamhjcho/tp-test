import 'result/result_reducers.dart';
import 'simulation/simulation_reducer.dart';
import 'summary/summary_reducers.dart';
import 'transfer_points_state.dart';

TransferPointsState transferPointsReducer(
    TransferPointsState state, dynamic action) {
  return TransferPointsState(
    simulation: simulationReducer(state.simulation, action),
    summary: summaryReducer(state.summary, action),
    result: resultReducer(state.result, action),
  );
}
