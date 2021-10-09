import 'package:eviobeta/models/parking_number_plate_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_import.dart';

class PlateModelWidget extends StatelessWidget {
  final ParkingNumberPlateModel product;
  final bool hasShadow;
  final Size? fixSize;
  final double fontScale;

  const PlateModelWidget(
    this.product, {
    Key? key,
    this.hasShadow = true,
    this.fixSize,
    this.fontScale = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double productSizeFactor = (Get.width - 20) / 150;
    double borderRadius = 3.r;
    if (product.shape == PlateShape.halfRoundRect) {
      borderRadius = 20.r;
    } else if (product.shape == PlateShape.fullRoundRect) {
      borderRadius = product.height * productSizeFactor / 2;
    }
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (product.plateSubtitlePosition == PlateSubtitlePosition.top)
            _plateSubtitle(),
          _plateTitle(),
          if (product.plateSubtitlePosition == PlateSubtitlePosition.bottom)
            _plateSubtitle(),
        ],
      ),
      width: fixSize == null
          ? product.width * productSizeFactor
          : fixSize!.width * productSizeFactor,
      height: fixSize == null
          ? product.height * productSizeFactor
          : fixSize!.height * productSizeFactor,
      decoration: BoxDecoration(
        color: product.backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: hasShadow
            ? [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5.r,
                  offset: Offset(1.5.r, 1.5.r), // Shadow position
                ),
              ]
            : null,
        image: product.backgroundAsset == null
            ? null
            : DecorationImage(
                image: AssetImage(
                  product.backgroundAsset!,
                ),
                fit: BoxFit.cover),
      ),
    );
  }

  Widget _plateTitle() {
    return Text(
      product.title,
      style: GoogleFonts.getFont(
        product.fontTitle,
        fontSize: product.titleSize.sp * fontScale,
        color: product.textColor,
      ),
      overflow: TextOverflow.clip,
    );
  }

  Widget _plateSubtitle() {
    return Text(
      product.subtitle,
      style: GoogleFonts.getFont(
        product.fontSubtitle,
        fontSize: product.subtitleSize.sp * fontScale,
        color: product.textColor,
      ),
      overflow: TextOverflow.clip,
    );
  }
}
