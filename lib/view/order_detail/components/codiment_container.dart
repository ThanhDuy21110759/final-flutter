import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../contants.dart';
import '../../../entity/response/CondimentResponse.dart';

enum condimentNumber { zero, one, two, three }

extension CondimentNumberExtension on condimentNumber {
  int get value {
    switch (this) {
      case condimentNumber.zero:
        return 0;
      case condimentNumber.one:
        return 1;
      case condimentNumber.two:
        return 2;
      case condimentNumber.three:
        return 3;
      default:
        return 0;
    }
  }
}
condimentNumber selectedSugar = condimentNumber.zero;

class CondimentContainer extends StatefulWidget {
  final Condiment condiment;
  final ValueChanged<int> onSelectedAmountChanged;

  const CondimentContainer({
    Key? key,
    required this.condiment,
    required this.onSelectedAmountChanged,
  }) : super(key: key);

  @override
  _CondimentContainerState createState() => _CondimentContainerState();
}

class _CondimentContainerState extends State<CondimentContainer> {
  int selectedSugar = 0;

  void handlePress(int amount) {
    setState(() {
      selectedSugar = amount;
    });
    widget.onSelectedAmountChanged(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '${widget.condiment.name}',
                style: kProductNameStyle,
              ),
              const Opacity(
                opacity: 0.4,
                child: Text(
                  ' (in cubes)',
                  style: kProductNameStyle,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CondimentDetail(
                  sugarImage: 'assets/images/sugar_0.svg',
                  isSelected: selectedSugar == 0,
                  onPress: () => handlePress(0),
                ),
                CondimentDetail(
                  sugarImage: 'assets/images/sugar_1.svg',
                  isSelected: selectedSugar == 1,
                  onPress: () => handlePress(1),
                ),
                CondimentDetail(
                  sugarImage: 'assets/images/sugar_2.svg',
                  isSelected: selectedSugar == 2,
                  onPress: () => handlePress(2),
                ),
                CondimentDetail(
                  sugarImage: 'assets/images/sugar_3.svg',
                  isSelected: selectedSugar == 3,
                  onPress: () => handlePress(3),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CondimentDetail extends StatelessWidget {
  final String sugarImage;
  final bool isSelected;
  final VoidCallback onPress;

  const CondimentDetail({
    Key? key,
    required this.sugarImage,
    required this.isSelected,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Opacity(
              opacity: isSelected ? 1 : 0.5,
              child: Container(
                child: SvgPicture.asset(sugarImage),
              ),
            ),
            Opacity(
              opacity: isSelected ? 1 : 0,
              child: Container(
                margin: EdgeInsets.only(top: kDefaultPadding),
                height: 4,
                width: 15,
                color: kSecondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}