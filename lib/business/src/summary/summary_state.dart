import 'package:equatable/equatable.dart';

class SummaryState extends Equatable {
  const SummaryState({this.loading = true, this.error})
      : assert(loading != null),
        super();

  final bool loading;
  final Object error;

  SummaryState copyWith({bool loading, Object error}) {
    return SummaryState(
      loading: loading ?? this.loading,
      error: error,
    );
  }

  @override
  List<Object> get props => [loading, error];
}
