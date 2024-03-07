import 'package:example/tooltip/spotlight_tooltip_arrow.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';
import 'package:tutorial_spotlight/spotlight_item.dart';

class SpotlightTooltip extends StatelessWidget {
  final SpotlightController controller;
  final SpotlightTooltipPosition position;
  final String title;
  final String description;
  final String image;
  final bool showSteps;
  final int step;
  final int totalSteps;
  final SpotlightTooltipArrowDirection arrowDirection;

  static final Color topBackgroundColor = Colors.blue.shade300;
  static final Color bottomBackgroundColor = Colors.white;

  const SpotlightTooltip({
    Key? key,
    required this.controller,
    required this.position,
    required this.title,
    required this.description,
    required this.image,
    this.showSteps = true,
    required this.step,
    required this.totalSteps,
    this.arrowDirection = SpotlightTooltipArrowDirection.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: position.left,
          top: position.top,
          right: position.right,
          bottom: position.bottom,
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(31),
                child: Container(
                  decoration: BoxDecoration(
                    color: bottomBackgroundColor,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 93,
                        decoration: BoxDecoration(
                          color: topBackgroundColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          height: 56,
                          child: Text(title),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          height: 69,
                          child: Text(description),
                        ),
                      ),
                      const SizedBox(height: 6),
                      _pageIndicator(context),
                      const SizedBox(height: 10),
                      _actionButton(context),
                      _dismissButton(context),
                      const SizedBox(height: 6),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        if (arrowDirection != SpotlightTooltipArrowDirection.none)
          IgnorePointer(
            child: SpotlightTooltipArrow(
              pointTo: position.pointTo,
              direction: arrowDirection,
              color: _arrowColor(context, arrowDirection),
            ),
          ),
      ],
    );
  }

  Widget _pageIndicator(BuildContext context) {
    return SizedBox(
      height: 8,
      child: Visibility(
        visible: totalSteps > 1 && showSteps,
        child: SmoothPageIndicator(
          controller: PageController(initialPage: step - 1),
          count: totalSteps,
          effect: ColorTransitionEffect(
            dotWidth: 8,
            dotHeight: 8,
            activeDotColor: Colors.blue.shade700,
            dotColor: Colors.grey.shade300,
            spacing: 7,
          ),
        ),
      ),
    );
  }

  Widget _actionButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: FilledButton(
        child: Text(step == totalSteps ? 'Done' : 'Next'),
        onPressed: () {
          controller.next();
        },
      ),
    );
  }

  Widget _dismissButton(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Visibility(
        visible: step != totalSteps,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: TextButton(
            onPressed: () {
              controller.dismiss();
            },
            child: Text('Dismiss'),
          ),
        ),
      ),
    );
  }

  Color _arrowColor(
      BuildContext context, SpotlightTooltipArrowDirection direction) {
    switch (direction) {
      case SpotlightTooltipArrowDirection.up:
        return topBackgroundColor;
      case SpotlightTooltipArrowDirection.down:
        return bottomBackgroundColor;
      case SpotlightTooltipArrowDirection.none:
        return Colors.transparent;
    }
  }
}
