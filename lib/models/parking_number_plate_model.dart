import 'package:eviobeta/common_import.dart';

enum PlateShape {
  rect,
  halfRoundRect,
  fullRoundRect,
}

enum PlateSubtitlePosition {
  none,
  top,
  bottom,
}

class ParkingNumberPlateModel {
  static String defaultFont = 'Alata';

  String id = 'id';
  PlateShape shape = PlateShape.halfRoundRect;
  double width = 114;
  double height = 30;
  String title = '012.3456.7890';
  double titleSize = 30;
  String subtitle = 'PLEASE CONTACT THIS NUMBER';
  double subtitleSize = 12;
  PlateSubtitlePosition plateSubtitlePosition = PlateSubtitlePosition.top;
  String fontTitle = defaultFont;
  String fontSubtitle = defaultFont;
  Color textColor = white;
  Color? backgroundColor = deepBlue;
  String? backgroundAsset;
  String? material = 'deepBlue';

  Map<String, dynamic> toJson() => {
        'createAt': DateTime.now().toString(),
        ParkingNumberPlateModelKey.id: id,
        ParkingNumberPlateModelKey.shape: shape.toString(),
        ParkingNumberPlateModelKey.width: width,
        ParkingNumberPlateModelKey.height: height,
        ParkingNumberPlateModelKey.title: title,
        ParkingNumberPlateModelKey.titleSize: titleSize,
        ParkingNumberPlateModelKey.subtitle: subtitle,
        ParkingNumberPlateModelKey.subtitleSize: subtitleSize,
        ParkingNumberPlateModelKey.plateSubtitlePosition:
            plateSubtitlePosition.toString(),
        ParkingNumberPlateModelKey.fontTitle: fontTitle,
        ParkingNumberPlateModelKey.fontSubtitle: fontSubtitle,
        ParkingNumberPlateModelKey.textColor: textColor.toString(),
        ParkingNumberPlateModelKey.backgroundColor: backgroundColor.toString(),
        ParkingNumberPlateModelKey.backgroundAsset: backgroundAsset.toString(),
        ParkingNumberPlateModelKey.material: material.toString(),
      };
}

class ParkingNumberPlateModelKey {
  static get collectionKey => 'parkingnumberplates';
  static get id => 'id';
  static get shape => 'shape';
  static get width => 'width';
  static get height => 'height';
  static get title => 'title';
  static get titleSize => 'titleSize';
  static get subtitle => 'subtitle';
  static get subtitleSize => 'subtitleSize';
  static get plateSubtitlePosition => 'plateSubtitlePosition';
  static get fontTitle => 'fontTitle';
  static get fontSubtitle => 'fontSubtitle';
  static get textColor => 'textColor';
  static get backgroundColor => 'backgroundColor';
  static get backgroundAsset => 'backgroundAsset';
  static get material => 'material';
}
