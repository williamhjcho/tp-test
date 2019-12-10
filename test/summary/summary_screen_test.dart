import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nuds/nuds.dart';
import 'package:transfer_points_testing/src/summary/bloc/summary_bloc.dart';
import 'package:transfer_points_testing/src/summary/details_summary_screen.dart';

import '../test_app.dart';

class MockSummaryBloc extends MockBloc<SummaryEvent, SummaryState>
    implements SummaryBloc {}

void main() {
  group('Summary Screen', () {
    final MockSummaryBloc bloc = MockSummaryBloc();
    Widget widget;

    setUp(() {
      resetMockitoState();
      widget = createView(bloc, smiles: 10);
    });

    testWidgets('shimmer shows on loading', (WidgetTester tester) async {
      whenListen(
          bloc, Stream.fromIterable([null, const InitialSummaryState()]));

      await bootUpWidget(tester, widget);

      expect(find.byType(Shimmer), findsOneWidget);
    });

    testWidgets('loaded state shows correctly', (WidgetTester tester) async {
      whenListen(
          bloc,
          Stream.fromIterable([
            null,
            const InitialSummaryState(),
            const LoadedSummaryState(
                smilesClaiming: '2',
                rewardsUsed: '8',
                rewardsLeft: '0',
                rewardsConversionRate: 4)
          ]));

      await bootUpWidget(tester, widget);

      expect(find.text('2'), findsOneWidget);
      expect(find.text('8'), findsOneWidget);
      expect(find.text('0'), findsOneWidget);
      expect(find.text('4 Rewards = 1 milha'), findsOneWidget);
    });
  });
}

Widget createView(SummaryBloc bloc,
    {VoidCallback onPrevious, ValueChanged<int> onNext, int smiles}) {
  return TestApp(
      child: BlocProvider(
          create: (context) => bloc,
          child: DetailsSummaryScreen(
            onPrevious: onPrevious,
            onNext: onNext,
            transferableSmiles: smiles,
          )));
}

Future<void> bootUpWidget(WidgetTester tester, Widget widget) async {
  await tester.pumpWidget(widget);
  await tester.pump(Duration.zero);
}
