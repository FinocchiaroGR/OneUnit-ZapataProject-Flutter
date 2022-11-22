import 'dart:math';
import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:app/widgets/atoms/Typography.dart';
import 'package:app/styles/colors.dart' as app_colors;

class AppSwitch extends StatefulWidget {
  const AppSwitch({super.key});

  @override
  State<StatefulWidget> createState() => _AppSwitchState();
}

class _AppSwitchState extends State<AppSwitch> {
  int value = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppTypography(
          text: 'Selecciona Modo',
          align: TextAlign.center,
          color: app_colors.primary,
          type: 'body1',
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          AnimatedToggleSwitch<int>.size(
            current: value,
            values: const [0, 1, 2],
            iconOpacity: 1,
            selectedIconOpacity: 1,
            indicatorSize: const Size.square(89.0),
            iconAnimationType: AnimationType.onHover,
            indicatorAnimationType: AnimationType.onHover,
            iconBuilder: (value, size) {
              if (value == 0) {
                return const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AppTypography(
                    text: 'PARKING',
                    align: TextAlign.center,
                    type: "body2",
                    color: app_colors.secondary,
                  ),
                );
              } else if (value == 1) {
                IconData data = Icons.gpp_bad;
                return Icon(
                  data,
                  size: min(size.width, size.height),
                  color: app_colors.secondary,
                );
              } else {
                return const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AppTypography(
                    text: 'VALET',
                    align: TextAlign.center,
                    type: "body2",
                    color: app_colors.secondary,
                  ),
                );
              }
            },
            height: 40,
            borderWidth: 0.0,
            borderColor: Colors.transparent,
            innerColor: Colors.transparent,
            colorBuilder: (i) {
              return app_colors.primary;
            },
            onChanged: (i) => setState(() => value = i),
          ),
        ]),
      ],
    );
  }
}
