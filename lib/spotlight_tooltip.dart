import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tutorial_spotlight/spotlight_controller.dart';

class SpotlightTooltip extends StatelessWidget {
  final SpotlightController controller;
  final String title;
  final String description;
  final String image;
  final int step;
  final int totalSteps;

  const SpotlightTooltip({
    Key? key,
    required this.controller,
    required this.title,
    required this.description,
    required this.image,
    required this.step,
    required this.totalSteps,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(31),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 93,
                decoration: BoxDecoration(
                  color: Colors.blue.shade300,
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
              if (totalSteps > 1)
                SmoothPageIndicator(
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
              const SizedBox(height: 10),
              _actionButton(context),
              _dismissButton(context),
              const SizedBox(height: 6),
            ],
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
          // if (step == totalSteps) {
          // } else {}
          controller.next();
        },
      ),
    );
  }

  Widget _dismissButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextButton(
        onPressed: () {
          controller.dismiss();
        },
        child: Text('Dismiss'),
      ),
    );
  }
}
