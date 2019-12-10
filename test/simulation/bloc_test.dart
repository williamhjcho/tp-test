import 'package:flutter_test/flutter_test.dart';
import 'package:transfer_points_testing/src/simulation/bloc/simulation_bloc.dart';

void main() {
  group('Simulation', () {
    SimulationBloc bloc;

    setUp(() {
      bloc = SimulationBloc();
    });

    test('emits initial data', () {
      const initialSimulationState = InitialSimulationState();
      expect(bloc.initialState, initialSimulationState);
      expect(bloc, emits(initialSimulationState));
    });

    test('request load event loads data', () {
      expectLater(
          bloc,
          emitsInOrder(<SimulationState>[
            const InitialSimulationState(),
            loadedState()
          ]));

      bloc.add(const RequestLoadSimulationEvent());
    });

    test('smiles above max shows error', () {
      expectLater(
          bloc,
          emitsInOrder(<SimulationState>[
            const InitialSimulationState(),
            loadedState(),
            loadedState(
                validInput: false,
                value: SimulationBloc.fakeTransferableSmile + 1,
                errorMessage: SimulationBloc.errorMaxAllowedReachedMessage)
          ]));
      bloc.add(const RequestLoadSimulationEvent());
      bloc.add(InputChangedEvent.input(
          (SimulationBloc.fakeTransferableSmile + 1).toString()));
    });

    test('inputEvent replaces comma', () {
      expectLater(
          bloc,
          emitsInOrder(<SimulationState>[
            const InitialSimulationState(),
            loadedState(),
            loadedState(validInput: true, value: 2000)
          ]));
      bloc.add(const RequestLoadSimulationEvent());
      bloc.add(InputChangedEvent.input('2,000'));
    });
  });
}

SimulationLoadedState loadedState(
    {bool validInput = false, int value, String errorMessage}) {
  return SimulationLoadedState(SimulationBloc.fakeTransferableSmile,
      SimulationBloc.fakeRewardsConversion,
      validInput: validInput, value: value, errorMessage: errorMessage);
}
