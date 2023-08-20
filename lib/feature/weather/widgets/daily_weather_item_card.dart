import 'package:flutter/material.dart';
import 'package:open_weather/common/constants/ui_constants.dart';
import 'package:open_weather/model/daily_weather_info_model.dart';
import 'package:open_weather/utils/date_time_extension.dart';

class DailyWeatherItemCard extends StatelessWidget {
  const DailyWeatherItemCard({super.key, required this.dailyWeatherInfoModel});

  final DailyWeatherInfoModel dailyWeatherInfoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UIConstants.space8),
      margin: const EdgeInsets.symmetric(vertical: UIConstants.space4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green),
        borderRadius: UIConstants.radius10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(dailyWeatherInfoModel.date.formatToShortDate()),
          Image.network(
            dailyWeatherInfoModel.iconUrl,
            height: UIConstants.space40,
            width: UIConstants.space40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Min: ${dailyWeatherInfoModel.minTemperature}'),
              Text('Max: ${dailyWeatherInfoModel.maxTemperature}'),
              Text('Humidity: ${dailyWeatherInfoModel.humidity} %')
            ],
          )
        ],
      ),
    );
  }
}
