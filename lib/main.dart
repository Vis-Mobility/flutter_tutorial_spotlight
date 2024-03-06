import 'package:flutter/material.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';
import 'package:tutorial_spotlight/spotlight_item.dart';
import 'package:tutorial_spotlight/spotlight_holder.dart';
import 'package:tutorial_spotlight/spotlight_tooltip.dart';

final GlobalKey _one = GlobalKey();
final GlobalKey _two = GlobalKey();
final GlobalKey _three = GlobalKey();
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
                    tooltip: (controller) => SpotlightTooltip(
                        controller: controller,
                        title: 'ONE',
                        description: 'description1',
                        image: '',
                        step: 1,
                        totalSteps: 3),
                    child: Text('Text 1'),
                  ),
                  SpotlightItem(
                    key: _two,
                    tooltip: (controller) => SpotlightTooltip(
                        controller: controller,
                        title: 'TWO',
                        description: 'description2',
                        image: '',
                        step: 2,
                        totalSteps: 3),
                    child: Text('Text 2'),
                  ),
                  SpotlightItem(
                    key: _three,
                    tooltip: (controller) => Container(),
                    child: Text('Text 3'),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              controller.start([_one, _two, _three]);
            },
            child: const Icon(Icons.play_arrow),
          ),
        ),
      ),
    );
  }
}
