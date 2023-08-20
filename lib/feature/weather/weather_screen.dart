import 'package:flutter/material.dart';
import 'package:open_weather/common/constants/ui_constants.dart';
import 'package:open_weather/feature/weather/bloc/weather_bloc.dart';
import 'package:open_weather/feature/weather/bloc/weather_state.dart';
import 'package:open_weather/feature/weather/widgets/error_weather_widget.dart';

import 'package:open_weather/feature/weather/widgets/weather_loaded_widget.dart';
import 'package:provider/provider.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<WeatherBloc>(
      create: (_) => WeatherBlocImpl(),
      builder: (context, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              top: UIConstants.space40,
              left: UIConstants.space24,
              right: UIConstants.space24,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Input city',
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(UIConstants.space24),
                      ),
                    ),
                    onSubmitted: (cityName) async {
                      await Provider.of<WeatherBloc>(context, listen: false)
                          .loadWeatherByAddres(cityName);
                    },
                  ),
                  StreamBuilder(
                    stream: Provider.of<WeatherBloc>(context, listen: false)
                        .currentState,
                    builder: (context, snapshot) {
                      final data = snapshot.data;
                      if (data != null) {
                        if (data is WeatherLoadingState) {
                          return const CircularProgressIndicator(
                            color: Colors.orange,
                          );
                        } else if (data is WeatherLoadedState) {
                          return WeatherLoadedWidget(
                            weatherData: data,
                          );
                        } else if (data is PermissionDeniedState) {
                          return const ErrorWeatherWidget(
                            errorText:
                                'Location permission does not granted. Please Input city name in the text field above to get information about weather',
                          );
                        } else if (data is WeatherErrorLoadState) {
                          return const ErrorWeatherWidget(
                              errorText: 'Something wrong Please try later');
                        }
                      }
                      return const SizedBox();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
