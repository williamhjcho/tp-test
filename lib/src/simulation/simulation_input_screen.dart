import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuds/nuds.dart';
import 'package:transfer_points_testing/src/simulation/bloc/simulation_bloc.dart';

import 'currenct_input_formatter.dart';

class SimulationInputScreen extends StatefulWidget {
  const SimulationInputScreen({
    Key key,
    @required this.onClose,
    @required this.onNext,
  }) : super(key: key);

  final VoidCallback onClose;
  final ValueChanged<int> onNext;

  @override
  _SimulationInputScreenState createState() => _SimulationInputScreenState();
}

class _SimulationInputScreenState extends State<SimulationInputScreen> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final bloc = BlocProvider.of<SimulationBloc>(context)
      ..add(const RequestLoadSimulationEvent());
    controller.addListener(
        () => bloc.add(InputChangedEvent.input(controller.value.text)));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimulationBloc, SimulationState>(
      builder: (context, state) {
        final topBar = TopBar(leadingOnPressed: widget.onClose);
        if (state is InitialSimulationState) {
          return ShimmeringInputScreen(
            appBar: topBar,
          );
        } else if (state is SimulationLoadedState) {
          return TextInputScreen(
            appBar: topBar,
            title: 'Quantas milhas Smiles você precisa?',
            controller: controller,
            autofocus: true,
            errorText: state.errorMessage,
            helperText:
                'Transfira até ${state.transferableSmilesSize} Smiles\n${state.rewardsConversionRate} Rewards = 1 Smiles',
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
              onPressed:
                  state.validInput ? () => widget.onNext(state.value) : null,
            ),
          );
        }
        throw StateError('Unmapped state reached ${state.runtimeType}');
      },
    );
  }
}
