import 'package:flutter/material.dart';
import 'package:open_weather/feature/weather/widgets/daily_weather_item_card.dart';

import '../../../model/daily_weather_info_model.dart';

class DailyWeatherListWidget extends StatelessWidget {
  const DailyWeatherListWidget({
    super.key,
    required this.dailyListInfo,
  });

  final List<DailyWeatherInfoModel> dailyListInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: dailyListInfo
          .map(
            (dailyInfo) => DailyWeatherItemCard(
              dailyWeatherInfoModel: dailyInfo,
            ),
          )
          .toList(),
    );
  }
}
