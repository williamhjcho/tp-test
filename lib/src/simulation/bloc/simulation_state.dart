part of 'simulation_bloc.dart';

@immutable
abstract class SimulationState {
  const SimulationState();
}

@immutable
class InitialSimulationState extends SimulationState {
  const InitialSimulationState();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is InitialSimulationState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

@immutable
class SimulationLoadedState extends SimulationState {
  const SimulationLoadedState(
      this.transferableSmilesSize, this.rewardsConversionRate,
      {@required this.validInput, this.value, this.errorMessage})
      : assert(transferableSmilesSize != null),
        assert(rewardsConversionRate != null),
        assert(validInput != null);

  static const notInputtedErrorMessage = '!@#%&';

  final int transferableSmilesSize;
  final int rewardsConversionRate;
  final bool validInput;
  final String errorMessage;
  final int value;

  SimulationLoadedState copyWith(
      {int transferableSmilesSize,
      int rewardsConversionRate,
      bool validInput,
      String errorMessage = notInputtedErrorMessage,
      int value}) {
    return SimulationLoadedState(
        transferableSmilesSize ?? this.transferableSmilesSize,
        rewardsConversionRate ?? this.rewardsConversionRate,
        validInput: validInput ?? this.validInput,
        value: value ?? this.value,
        errorMessage: errorMessage == notInputtedErrorMessage
            ? this.errorMessage
            : errorMessage);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SimulationLoadedState &&
              runtimeType == other.runtimeType &&
              transferableSmilesSize == other.transferableSmilesSize &&
              rewardsConversionRate == other.rewardsConversionRate &&
              validInput == other.validInput &&
              errorMessage == other.errorMessage &&
              value == other.value;

  @override
  int get hashCode =>
      transferableSmilesSize.hashCode ^
      rewardsConversionRate.hashCode ^
      validInput.hashCode ^
      errorMessage.hashCode ^
      value.hashCode;
}
