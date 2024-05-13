import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../contants.dart';

enum sugarNumber { zero, one, two, three }
sugarNumber selectedSugar = sugarNumber.zero;

class SugarContainer extends StatefulWidget {
  const SugarContainer({Key? key}) : super(key: key);

  @override
  _SugarContainerState createState() => _SugarContainerState();
}

class _SugarContainerState extends State<SugarContainer> {
  sugarNumber selectedSugar = sugarNumber.zero;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Sugar',
                style: kProductNameStyle,
              ),
              Opacity(
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
                Sugar(
                  sugarImage: 'assets/images/sugar_0.svg',
                  isSelected: selectedSugar == sugarNumber.zero,
                  onPress: () {
                    setState(() {
                      selectedSugar = sugarNumber.zero;
                    });
                  },
                ),
                Sugar(
                  sugarImage: 'assets/images/sugar_1.svg',
                  isSelected: selectedSugar == sugarNumber.one,
                  onPress: () {
                    setState(() {
                      selectedSugar = sugarNumber.one;
                    });
                  },
                ),
                Sugar(
                  sugarImage: 'assets/images/sugar_2.svg',
                  isSelected: selectedSugar == sugarNumber.two,
                  onPress: () {
                    setState(() {
                      selectedSugar = sugarNumber.two;
                    });
                  },
                ),
                Sugar(
                  sugarImage: 'assets/images/sugar_3.svg',
                  isSelected: selectedSugar == sugarNumber.three,
                  onPress: () {
                    setState(() {
                      selectedSugar = sugarNumber.three;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Sugar extends StatelessWidget {
  final String sugarImage;
  final bool isSelected;
  final VoidCallback onPress;

  const Sugar({
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