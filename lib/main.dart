import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp
    (
      title: 'Weather Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData
      (
        colorScheme: ColorScheme.fromSeed
        (
          seedColor: const Color(0xFF4A90E2),
          brightness: Brightness.light,
        ),
      ),
      home: const MyHomePage(title: 'Weather Dashboard'),
    );
  }
}

class MyHomePage extends StatelessWidget 
{
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: SafeArea
      (
        child: SingleChildScrollView
        (
          child: Padding
          (
            padding: const EdgeInsets.all(16.0),

            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,

              children: 
              [
                const Padding
                (
                  padding: EdgeInsets.only(bottom: 24.0),
                  
                  child: Center
                  (
                    child: Text
                    (
                      'Weather Dashboard',

                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Container
                (
                  padding: const EdgeInsets.all(24),

                  decoration: BoxDecoration
                  (
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Row
                  (
                    children: 
                    [
                      Column
                      (
                        children: 
                        [
                          Icon(Icons.cloud_queue, size: 80, color: Colors.orange.shade400),
                        ],
                      ),

                      const SizedBox(width: 24),

                      Expanded
                      (
                        child: Column
                        (
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: 
                          [
                            const Text
                            (
                              '25°C',
                              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                            ),

                            const Text
                            (
                              'Cloudy with a chance of sunshine',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),

                            const Text
                            (
                              'London, UK',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Hourly Forecast
                Container
                (
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration
                  (
                    color: const Color(0xFFD4E0F0),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: GridView.count
                  (
                    crossAxisCount: 4,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: 
                    [
                      _buildForecastCard('10:00', Icons.wb_sunny, 26),
                      _buildForecastCard('11:00', Icons.wb_sunny, 27),
                      _buildForecastCard('13:00', Icons.wb_sunny, 25),
                      _buildForecastCard('13:00', Icons.cloud_queue, 24),
                      _buildForecastCard('10:00', Icons.wb_sunny, 25),
                      _buildForecastCard('14:00', Icons.cloud_queue, 24),
                      _buildForecastCard('14:00', Icons.cloud_queue, 23),
                      _buildForecastCard('15:00', Icons.grain, 22),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar
      (
        items: const 
        [
          BottomNavigationBarItem
          (
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem
          (
            icon: Icon(Icons.search),
            label: 'Search',
          ),

          BottomNavigationBarItem
          (
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFF4A90E2),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildForecastCard(String time, IconData icon, int temp) 
  {
    return Container
    (
      decoration: BoxDecoration
      (
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),

      child: Column
      (
        mainAxisAlignment: MainAxisAlignment.center,

        children: 
        [
          Text
          (
            time,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),

          const SizedBox(height: 8),

          Icon(icon, size: 24, color: Colors.orange),

          const SizedBox(height: 8),
          
          Text
          (
            '$temp°C',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
