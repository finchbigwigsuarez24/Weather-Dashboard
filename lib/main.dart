import 'package:flutter/material.dart';

void main() 
{
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
        scaffoldBackgroundColor: const Color(0xFFE9EDF2),
      ),
      routes: 
      {
        "/home": (context) => const WeatherDashboard(),
      },
      home: const WeatherDashboard(),
    );
  }
}

class WeatherDashboard extends StatefulWidget 
{
  const WeatherDashboard({super.key});

  @override
  State<WeatherDashboard> createState() => _WeatherDashboardState();
}

class _WeatherDashboardState extends State<WeatherDashboard> 
{
  final List<Map<String, dynamic>> forecastData = 
  [
    {"time": "10:00", "temp": "26°C", "icon": Icons.wb_sunny},
    {"time": "11:00", "temp": "27°C", "icon": Icons.wb_sunny},
    {"time": "12:00", "temp": "25°C", "icon": Icons.filter_drama},
    {"time": "13:00", "temp": "24°C", "icon": Icons.foggy},
    {"time": "14:00", "temp": "24°C", "icon": Icons.wb_sunny},
    {"time": "15:00", "temp": "23°C", "icon": Icons.grain},
    {"time": "16:00", "temp": "22°C", "icon": Icons.cloud},
    {"time": "17:00", "temp": "22°C", "icon": Icons.grain},
  ];

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      body: SafeArea
      (
        child: Column
        (
          children: 
          [
            const SizedBox(height: 20),

            const Text
            (
              "Weather Dashboard",
              style: TextStyle
              (
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            Expanded
            (
              child: SingleChildScrollView
              (
                child: Column
                (
                  children: 
                  [
                    Container
                    (
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration
                      (
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column
                      (
                        children: 
                        [
                          Row
                          (
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: 
                            [
                              const Icon(Icons.filter_drama, size: 72, color: Colors.orange),
                              const SizedBox(width: 20),
                              Column
                              (
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const 
                                [
                                  Text
                                  (
                                    "25°C",
                                    style: TextStyle
                                    (
                                      fontSize: 42,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text
                                  (
                                    "Cloudy with a chance of sunshine",
                                  ),
                                  Text
                                  (
                                    "Cebu City, Philippines",
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Container
                          (
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration
                            (
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GridView.count
                            (
                              crossAxisCount: 4,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              children: forecastData.map((item) 
                              {
                                return ForecastCard
                                (
                                  item["time"] as String,
                                  item["temp"] as String,
                                  item["icon"] as IconData,
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container
            (
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: 
                [
                  NavItem
                  (
                    Icons.home, "Home", true, () 
                    {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  ),

                  NavItem
                  (
                    Icons.search, "Search", false, () 
                    {
                      ScaffoldMessenger.of(context).showSnackBar
                      (
                        const SnackBar
                        (
                          content: Text("Search clicked 🔍"),
                        ),
                      );
                    }
                  ),

                  NavItem
                  (
                    Icons.person, "Profile", false, () 
                    {
                      ScaffoldMessenger.of(context).showSnackBar
                      (
                        const SnackBar
                        (
                          content: Text("Profile clicked 👤"),
                        ),
                      );
                    }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ForecastCard extends StatelessWidget 
{
  final String time;
  final String temp;
  final IconData icon;

  const ForecastCard(this.time, this.temp, this.icon, {super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      decoration: BoxDecoration
      (
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8),
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
          const SizedBox(height: 5),
          Icon(icon, size: 22, color: Colors.orange),
          const SizedBox(height: 5),
          Text
          (
            temp,
            style: const TextStyle(fontWeight: FontWeight.bold,),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget 
{
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const NavItem(this.icon, this.label, this.active, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) 
  {
    return GestureDetector
    (
      onTap: onTap,
      child: Column
      (
        children: 
        [
          CircleAvatar
          (
            radius: 22,
            backgroundColor: active ? Colors.blue : Colors.grey, // Active: Blue, Inactive: Gray
            child: Icon(icon, color: Colors.white, size: 22),
          ),

          const SizedBox(height: 6),

          Text
          (
            label,
            style: TextStyle
            (
              fontSize: 12,
              color: active ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}