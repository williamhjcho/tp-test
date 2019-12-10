import 'package:scoped_model/scoped_model.dart';

class DetailSummaryModel extends Model {
  DetailSummaryModel(this._miles);

  final int _miles;
  bool _isLoading;

  int _rewardsUsed;
  int _rewardsLeft;
  int _rewardsRate;

  String get miles => _miles.toString();

  bool get isLoading => _isLoading;

  String get rewardsUsed => _rewardsUsed.toString();

  String get rewardsLeft => _rewardsLeft.toString();

  String get rewardsRate => _rewardsRate.toString();

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();

    final futureRewardsLeft =
        _getRewardsLeft().then((value) => _rewardsLeft = value);
    final futureRewardsUsed =
        _getRewardsUsed().then((value) => _rewardsUsed = value);
    final futureRewardsRate =
        _getRewardsRate().then((value) => _rewardsRate = value);

    await Future.wait(
        [futureRewardsLeft, futureRewardsRate, futureRewardsUsed]);
    _isLoading = false;
    notifyListeners();
  }
}

Future<int> _getRewardsUsed() =>
    Future.delayed(const Duration(seconds: 5), () => 1000);

Future<int> _getRewardsLeft() =>
    Future.delayed(const Duration(seconds: 5), () => 0);

Future<int> _getRewardsRate() =>
    Future.delayed(const Duration(seconds: 5), () => 4);
