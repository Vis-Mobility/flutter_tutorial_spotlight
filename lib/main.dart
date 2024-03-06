import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/enums.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';
import 'package:tutorial_spotlight/spotlight_item.dart';
import 'package:tutorial_spotlight/spotlight_holder.dart';
import 'package:tutorial_spotlight/spotlight_tooltip.dart';

final GlobalKey _one = GlobalKey();
final GlobalKey _two = GlobalKey();
final GlobalKey _three = GlobalKey();
final GlobalKey _four = GlobalKey();
final GlobalKey _five = GlobalKey();
final SpotlightController controller = SpotlightController();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SpotlightHolder(
        controller: controller,
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
                      tooltip: (controller) => SpotlightTooltip(
                        controller: controller,
                        title: 'ONE',
                        description: 'description1',
                        image: '',
                        step: 1,
                        totalSteps: 3,
                      ),
                      padding: EdgeInsets.all(8.0),
                      borderRadius: 10.0,
                    ),
                    child: Text('Text 1'),
                  ),
                  SpotlightItem(
                    key: _two,
                    config: SpotlightItemConfig(
                      tooltip: (controller) => SpotlightTooltip(
                          controller: controller,
                          title: 'TWO',
                          description: 'description2',
                          image: '',
                          step: 2,
                          totalSteps: 3),
                    ),
                    child: Text('Text 2'),
                  ),
                  SpotlightItem(
                    key: _three,
                    config: SpotlightItemConfig(
                      tooltip: (controller) => SpotlightTooltip(
                          controller: controller,
                          title: 'THREE',
                          description: 'description3',
                          image: '',
                          step: 3,
                          totalSteps: 3),
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
                          tooltip: (controller) => SpotlightTooltip(
                              controller: controller,
                              title: 'FOUR',
                              description: 'description4',
                              image: '',
                              step: 4,
                              totalSteps: 5),
                          tooltipHorizontalPosition:
                              SpotlightTooltipHorizontalPosition.alignLeft,
                        ),
                        child: Text('Text 4'),
                      ),
                      const Spacer(),
                      SpotlightItem(
                        key: _five,
                        config: SpotlightItemConfig(
                          tooltip: (controller) => SpotlightTooltip(
                              controller: controller,
                              title: 'FIVE',
                              description: 'description5',
                              image: '',
                              step: 5,
                              totalSteps: 5),
                          tooltipHorizontalPosition:
                              SpotlightTooltipHorizontalPosition.alignRight,
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
              // controller.start([_one, _two, _three, _four, _five]);
              controller.start([_three, _four, _five]);
            },
            child: const Icon(Icons.play_arrow),
          ),
        ),
      ),
    );
  }
}
