import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Testing App Performance Tests', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('log in test', () async {
      final operationsTimeline = await driver.traceAction(() async {

        final itemFinder = find.byValueKey('Text');

        await driver.waitFor(find.text('Login'));
        expect(await driver.getText(itemFinder),'Login');

      });

      final operationsSummary = TimelineSummary.summarize(operationsTimeline);
      await operationsSummary.writeSummaryToFile('Login_operations', pretty: true);
      await operationsSummary.writeTimelineToFile('Login_operations', pretty: true);
    });

    /*test('User login page', () async {
      final listFinder = find.byType('Center');

      final scrollingTimeline = await driver.traceAction(() async {
        await driver.scroll(listFinder, 0, -7000, Duration(seconds: 1));
        await driver.getCenter(listFinder.);
      });

      final scrollingSummary = TimelineSummary.summarize(scrollingTimeline);
      await scrollingSummary.writeSummaryToFile('User Login', pretty: true);
      await scrollingSummary.writeTimelineToFile('User Login', pretty: true);
    });*/
  });
}