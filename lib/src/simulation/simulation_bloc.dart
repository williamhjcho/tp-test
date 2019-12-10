import 'package:async/async.dart';
import 'package:flutter/material.dart';

class SimulationBloc with ChangeNotifier {
  SimulationBloc();

  List<CancelableOperation> operations = [];

  bool _isLoading;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  String _smiles;

  String get smiles => _smiles;

  set smiles(String smiles) {
    _smiles = smiles;
    notifyListeners();
  }

  Future<void> loadSmiles() async {
    isLoading = true;
    final operation = CancelableOperation.fromFuture(fakeGetSmiles());
    operation.value.then((value) {
      smiles = value.toString();
      isLoading = false;
    });
    operations.add(operation);
  }

  @override
  void dispose() {
    super.dispose();
    for (CancelableOperation operation in operations) {
      operation.cancel();
    }
    operations.clear();
  }
}

Future<int> fakeGetSmiles() async =>
    Future.delayed(const Duration(seconds: 2), () => 400);
