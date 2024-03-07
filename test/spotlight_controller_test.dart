import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';
import 'package:tutorial_spotlight/spotlight_item.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('SpotlightController', () {
    late SpotlightController spotlightController;
    late List<GlobalKey> keys;
    bool onStartCalled = false;
    bool onDoneCalled = false;
    setUp(() {
      spotlightController = SpotlightController(
        onStart: () => onStartCalled = true,
        onDone: () => onDoneCalled = true,
      );
      keys = List.generate(3, (_) => GlobalKey());
    });

    test('start should initialise the controller and call onStart', () {
      expect(spotlightController.isActive, isFalse);
      expect(spotlightController.currentIndex, 0);
      expect(onStartCalled, isFalse);

      spotlightController.start(keys);

      expect(spotlightController.isActive, isTrue);
      expect(spotlightController.currentIndex, 0);
      expect(spotlightController.widgetKeys, equals(keys));
      expect(onStartCalled, isTrue);
    });

    test('dismiss should reset the controller and call onDismiss', () {
      bool onDismissCalled = false;
      spotlightController.activeConfig = SpotlightItemConfig(
          onDismiss: () => onDismissCalled = true,
          tooltip: (_, __) {
            return const SizedBox();
          });
      spotlightController.start(keys);
      spotlightController.dismiss();

      expect(spotlightController.isActive, isFalse);
      expect(spotlightController.widgetKeys.isEmpty, isTrue);
      expect(onDismissCalled, isTrue);
    });

    test(
        'next should increment currentIndex and call onNext if it is not the last item',
        () {
      bool onNextCalled = false;
      spotlightController.activeConfig = SpotlightItemConfig(
          onNext: () => onNextCalled = true,
          tooltip: (_, __) {
            return const SizedBox();
          });
      spotlightController.start(keys);
      spotlightController.next();

      expect(spotlightController.currentIndex, 1);
      expect(onNextCalled, isTrue);
    });

    test('next should call onDone when at the end', () {
      spotlightController.start(keys);
      spotlightController.next(); // currentIndex becomes 1
      spotlightController.next(); // currentIndex becomes 2
      spotlightController.next(); // onDone should be called

      expect(spotlightController.isActive, isFalse);
      expect(spotlightController.widgetKeys.isEmpty, isTrue);
      expect(onDoneCalled, isTrue);
    });
  });
}
