import 'package:scoped_model/scoped_model.dart';

class SimulationModel extends Model {
  bool _isLoading = false;
  String _smiles;

  bool get isLoading => _isLoading;

  String get smiles => _smiles;

  Future<void> loadSmilesData() async {
    _isLoading = true;
    notifyListeners();

    _smiles = await loadSmiles();
    _isLoading = false;
    notifyListeners();
  }
}

Future<String> loadSmiles() async =>
    Future.delayed(const Duration(seconds: 2), () => '2000');
