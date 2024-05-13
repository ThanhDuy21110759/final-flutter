import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../contants.dart';
import '../order_page.dart';


class CupSizeContainer extends StatefulWidget {
  final ValueNotifier<sizeType> onSizeSelected;
  const CupSizeContainer({Key? key, required this.onSizeSelected}) : super(key: key);

  @override
  _CupSizeContainerState createState() => _CupSizeContainerState();
}

class _CupSizeContainerState extends State<CupSizeContainer> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Size',
            style: kProductNameStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CupSize(
                  isSelected: widget.onSizeSelected.value == sizeType.small,
                  cupImage: 'assets/images/size_small.svg',
                  onPress: () {
                    setState(() {
                      widget.onSizeSelected.value = sizeType.small;
                    });
                  },
                ),
                CupSize(
                  isSelected: widget.onSizeSelected.value == sizeType.medium,
                  cupImage: 'assets/images/size_medium.svg',
                  onPress: () {
                    setState(() {
                      widget.onSizeSelected.value = sizeType.medium;
                    });
                  },
                ),
                CupSize(
                  isSelected: widget.onSizeSelected.value == sizeType.large,
                  cupImage: 'assets/images/size_large.svg',
                  onPress: () {
                    setState(() {
                      widget.onSizeSelected.value = sizeType.large;
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

class CupSize extends StatelessWidget {
  final String cupImage;
  final bool isSelected;
  final VoidCallback onPress;

  const CupSize({
    Key? key,
    required this.cupImage,
    required this.isSelected,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            Opacity(
              opacity: isSelected ? 1 : 0.5,
              child: Container(
                child: SvgPicture.asset(cupImage),
              ),
            ),
            Opacity(
              opacity: isSelected ? 1 : 0,
              child: Container(
                margin: EdgeInsets.only(top: 12),
                height: 4,
                width: 20,
                color: kSecondaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}