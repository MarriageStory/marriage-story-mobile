import 'package:flutter/cupertino.dart';
import '../constants/theme.dart';

class DetailFormat extends StatelessWidget {
  const DetailFormat(
      {super.key, required this.label, required this.keterangan});

  final String keterangan;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          keterangan,
          style: fontNunito.copyWith(
            color: colorGrey,
            fontWeight: regular,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: fontNunito.copyWith(
            color: colorBlack,
            fontWeight: extraBold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
