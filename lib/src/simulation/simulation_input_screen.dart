import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nuds/nuds.dart';
import 'package:provider/provider.dart';
import 'package:transfer_points_testing/src/simulation/simulation_bloc.dart';

import 'currenct_input_formatter.dart';

class SimulationInputScreen extends StatefulWidget {
  const SimulationInputScreen({
    Key key,
    @required this.onClose,
    @required this.onNext,
  }) : super(key: key);

  final VoidCallback onClose;
  final ValueChanged<String> onNext;

  @override
  _SimulationInputScreenState createState() => _SimulationInputScreenState();
}

class _SimulationInputScreenState extends State<SimulationInputScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {

    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SimulationBloc bloc = Provider.of(context);
    if (bloc.isLoading) {
      return ShimmeringInputScreen(
        appBar: TopBar(),
      );
    } else {
      return TextInputScreen(
        appBar: TopBar(leadingOnPressed: widget.onClose),
        title: 'Quantas milhas Smiles você precisa?',
        controller: controller,
        autofocus: true,
        errorText: null,
        helperText: 'Transfira até ${bloc.smiles} Smiles\n4 Rewards = 1 Smiles',
        inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly,
          CurrencyInputFormatter(),
        ],
        keyboardType: const TextInputType.numberWithOptions(
          decimal: false,
          signed: false,
        ),
        bottom: BottomButton(
          text: 'CONTINUAR',
          primary: true,
          onPressed: () => widget.onNext(controller.text),
        ),
      );
    }
  }


}
