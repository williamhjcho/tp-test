part of 'simulation_bloc.dart';

@immutable
abstract class SimulationEvent {
  const SimulationEvent();

  Future<SimulationState> apply(
      {SimulationState currentState, SimulationBloc bloc});
}

@immutable
class RequestLoadSimulationEvent extends SimulationEvent {
  const RequestLoadSimulationEvent();

  @override
  Future<SimulationState> apply(
      {SimulationState currentState, SimulationBloc bloc}) {
    return Future.value(
      const SimulationLoadedState(SimulationBloc.fakeTransferableSmile,
          SimulationBloc.fakeRewardsConversion,
          validInput: false),
    );
  }
}

@immutable
class InputChangedEvent extends SimulationEvent {
  const InputChangedEvent(this.value);

  final int value;

  static InputChangedEvent input(String input) {
    if (input.isEmpty) {
      return const InputChangedEvent(null);
    }
    return InputChangedEvent(int.parse(input.replaceAll(',', '')));
  }

  @override
  Future<SimulationState> apply(
      {SimulationState currentState, SimulationBloc bloc}) {
    final SimulationLoadedState current = currentState;
    return Future.value(current.copyWith(
        validInput:
        value != null && value <= SimulationBloc.fakeTransferableSmile,
        value: value,
        errorMessage: bloc._inputError(value)));
  }
}
