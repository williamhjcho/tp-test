part of 'summary_bloc.dart';

@immutable
abstract class SummaryState {
  const SummaryState();
}

@immutable
class InitialSummaryState extends SummaryState {
  const InitialSummaryState();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is InitialSummaryState && runtimeType == other.runtimeType;

  @override
  int get hashCode => 0;
}

@immutable
class LoadedSummaryState extends SummaryState {
  const LoadedSummaryState(
      {@required this.smilesClaiming,
      @required this.rewardsUsed,
      @required this.rewardsLeft,
      @required this.rewardsConversionRate})
      : assert(smilesClaiming != null),
        assert(rewardsUsed != null),
        assert(rewardsLeft != null),
        assert(rewardsConversionRate != null);

  final String smilesClaiming;
  final String rewardsUsed;
  final String rewardsLeft;
  final int rewardsConversionRate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LoadedSummaryState &&
              runtimeType == other.runtimeType &&
              smilesClaiming == other.smilesClaiming &&
              rewardsUsed == other.rewardsUsed &&
              rewardsLeft == other.rewardsLeft &&
              rewardsConversionRate == other.rewardsConversionRate;

  @override
  int get hashCode =>
      smilesClaiming.hashCode ^
      rewardsUsed.hashCode ^
      rewardsLeft.hashCode ^
      rewardsConversionRate.hashCode;
}
