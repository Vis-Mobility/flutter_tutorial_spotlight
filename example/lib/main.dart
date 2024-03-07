import 'package:example/tooltip/spotlight_tooltip.dart';
import 'package:example/tooltip/spotlight_tooltip_arrow.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/tutorial_spotlight.dart';

final GlobalKey _zero = GlobalKey();
final GlobalKey _one = GlobalKey();
final GlobalKey _two = GlobalKey();
final GlobalKey _three = GlobalKey();
final GlobalKey _four = GlobalKey();
final GlobalKey _five = GlobalKey();
final SpotlightController controller = SpotlightController(
  onStart: () => print('Started'),
  onDone: () => print('Done'),
);

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final spotlightItems = [
    _zero,
    _one,
    _two,
    _three,
    _four,
    _five,
  ];

  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpotlightHolder(
        controller: controller,
        child: SpotlightItem(
          key: _zero,
          config: SpotlightItemConfig(
            tooltip: (controller, tooltipPosition) => SpotlightTooltip(
              controller: controller,
              position: tooltipPosition,
              title: 'ZERO',
              description: 'description0',
              image: '',
              showSteps: false,
              step: spotlightItems.indexOf(_zero) + 1,
              totalSteps: spotlightItems.length,
            ),
            showSpotlight: false,
          ),
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 200),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SpotlightItem(
                      key: _one,
                      config: SpotlightItemConfig(
                        tooltip: (controller, tooltipPosition) =>
                            SpotlightTooltip(
                          controller: controller,
                          position: tooltipPosition,
                          title: 'ONE',
                          description: 'description1',
                          image: '',
                          step: spotlightItems.indexOf(_one),
                          totalSteps: spotlightItems.length - 1,
                          arrowDirection: SpotlightTooltipArrowDirection.up,
                        ),
                        padding: EdgeInsets.all(8.0),
                        borderRadius: 10.0,
                        tooltipVerticalOffset: 10,
                      ),
                      child: Text('Text 1'),
                    ),
                    SpotlightItem(
                      key: _two,
                      config: SpotlightItemConfig(
                        tooltip: (controller, tooltipPosition) =>
                            SpotlightTooltip(
                          controller: controller,
                          position: tooltipPosition,
                          title: 'TWO',
                          description: 'description2',
                          image: '',
                          step: spotlightItems.indexOf(_two),
                          totalSteps: spotlightItems.length - 1,
                          arrowDirection: SpotlightTooltipArrowDirection.up,
                        ),
                        padding: EdgeInsets.all(8.0),
                        borderRadius: 10.0,
                        tooltipVerticalOffset: 10,
                        onNext: () => print('Next'),
                        onDismiss: () => print('Dismiss'),
                      ),
                      child: Text('Text 2'),
                    ),
                    SpotlightItem(
                      key: _three,
                      config: SpotlightItemConfig(
                        tooltip: (controller, builder) => SpotlightTooltip(
                          controller: controller,
                          position: builder,
                          title: 'THREE',
                          description: 'description3',
                          image: '',
                          step: spotlightItems.indexOf(_three),
                          totalSteps: spotlightItems.length - 1,
                          arrowDirection: SpotlightTooltipArrowDirection.down,
                        ),
                        padding: EdgeInsets.all(8.0),
                        borderRadius: 10.0,
                        tooltipVerticalOffset: 10,
                      ),
                      child: Text('Text 3'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(width: 30),
                        SpotlightItem(
                          key: _four,
                          config: SpotlightItemConfig(
                            tooltip: (controller, tooltipPosition) =>
                                SpotlightTooltip(
                              controller: controller,
                              position: tooltipPosition,
                              title: 'FOUR',
                              description: 'description4',
                              image: '',
                              step: spotlightItems.indexOf(_four),
                              totalSteps: spotlightItems.length - 1,
                              arrowDirection:
                                  SpotlightTooltipArrowDirection.down,
                            ),
                            padding: EdgeInsets.all(8.0),
                            borderRadius: 10.0,
                            tooltipVerticalOffset: 10,
                            tooltipHorizontalPosition:
                                SpotlightTooltipHorizontalPosition.alignLeft,
                            tooltipHorizontalOffset: 2,
                          ),
                          child: Text('Text 4'),
                        ),
                        const Spacer(),
                        SpotlightItem(
                          key: _five,
                          config: SpotlightItemConfig(
                            tooltip: (controller, tooltipPosition) =>
                                SpotlightTooltip(
                              controller: controller,
                              position: tooltipPosition,
                              title: 'FIVE',
                              description: 'description5',
                              image: '',
                              step: spotlightItems.indexOf(_five),
                              totalSteps: spotlightItems.length - 1,
                              arrowDirection:
                                  SpotlightTooltipArrowDirection.down,
                            ),
                            padding: EdgeInsets.all(8.0),
                            borderRadius: 10.0,
                            tooltipVerticalOffset: 10,
                            tooltipHorizontalPosition:
                                SpotlightTooltipHorizontalPosition.alignRight,
                            tooltipHorizontalOffset: 2,
                          ),
                          child: Text('Text 5'),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller.start(spotlightItems);
              },
              child: const Icon(Icons.play_arrow),
            ),
          ),
        ),
      ),
    );
  }
}
