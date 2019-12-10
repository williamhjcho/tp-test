import 'package:flutter_test/flutter_test.dart';
import 'package:transfer_points_testing/src/simulation/simulation_model.dart';

void main() {
  group('SimulationModel', () {
    SimulationModel model;

    setUp(() {
      model = SimulationModel();
    });

    test('model loads data correctly', () async {
      await model.loadSmilesData();
      expect(model.smiles, '2000');
      expect(model.isLoading, false);
    });

    test('load flag is set', () {
      model.addListener(() {
        expect(model.smiles, isNull);
        expect(model.isLoading, true);
      });
      model.loadSmilesData();
    });
  });
}
