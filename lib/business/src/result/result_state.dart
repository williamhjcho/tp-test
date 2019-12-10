import 'package:equatable/equatable.dart';

class ResultState extends Equatable {
  const ResultState({
    this.loading = true,
    this.error,
  })  : assert(loading != null),
        super();

  final bool loading;
  final Object error;

  @override
  List<Object> get props => [];

  ResultState copyWith({bool loading, Object error}) {
    return ResultState(
      loading: loading ?? this.loading,
      error: error,
    );
  }
}
