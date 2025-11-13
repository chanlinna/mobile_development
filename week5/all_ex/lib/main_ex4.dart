import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFFEF7FF),
        appBar: AppBar(
          backgroundColor: Color(0xFF87C8F1),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.menu, color: Colors.white),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView(
            children: const [
              WeatherCard(
                city: 'Phnom Penh',
                minTemp: 10.0,
                maxTemp: 30.0,
                currentTemp: 12.2,
                weather: Weather.cloudy,
              ),
              WeatherCard(
                city: 'Paris',
                minTemp: 10.0,
                maxTemp: 40.0,
                currentTemp: 22.2,
                weather: Weather.sunnyCloudy,
              ),
              WeatherCard(
                city: 'Rome',
                minTemp: 10.0,
                maxTemp: 40.0,
                currentTemp: 45.2,
                weather: Weather.sunny,
              ),
              WeatherCard(
                city: 'Toulouse', 
                minTemp: 10.0, 
                maxTemp: 40.0, 
                currentTemp: 45.2, 
                weather: Weather.veryCloudy,
              ),
              
            ],
          ),
        ),
      ),
  ));
}

enum Weather {
  cloudy(Color(0xFFD389F6), Color(0xFF935DF4), 'assets/ex4/cloudy.png'),
  sunny(Color(0xFFE9719A), Color(0xFFE6466F), 'assets/ex4/sunny.png'),
  sunnyCloudy(Color(0xFF80EFD5), Color(0xFF3FDEAE), 'assets/ex4/sunnyCloudy.png'),
  veryCloudy(Color.fromARGB(255, 232, 156, 81), Color.fromARGB(255, 238, 203, 170), 'assets/ex4/veryCloudy.png');

  final Color color1;
  final Color color2;
  final String imagePath;

  const Weather(this.color1, this.color2, this.imagePath);
}

class WeatherCard extends StatelessWidget {
  final String city;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final Weather weather;

  const WeatherCard({
    super.key,
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 50,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [weather.color1, weather.color2],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -30,
              top: 0,
              bottom: -20,
              child: Container(
                width: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [weather.color1.withValues(alpha:0.5), weather.color2.withValues(alpha: 0.5)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(150),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white24,
                        backgroundImage: AssetImage(weather.imagePath),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            city,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Min $minTemp°C',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Max $maxTemp°C',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '$currentTemp°C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}