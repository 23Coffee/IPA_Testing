import 'package:flutter/material.dart';
import 'package:project_dormlander/screen/MeterChart.dart';

class MeterUsageScreen extends StatelessWidget {
  const MeterUsageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        title: const Text(
          "Meter Usage",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Filters",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Month",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 31, 31, 31),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButton<String>(
                          value: "January",
                          onChanged: (value) {},
                          items: ["January", "February", "March", "April"]
                              .map((month) => DropdownMenuItem<String>(
                                    value: month,
                                    child: Text(
                                      month,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          dropdownColor: const Color.fromARGB(255, 31, 31, 31),
                          underline: const SizedBox(),
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Year",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 31, 31, 31),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: DropdownButton<String>(
                          value: "2025",
                          onChanged: (value) {},
                          items: ["2024", "2025", "2026"]
                              .map((year) => DropdownMenuItem<String>(
                                    value: year,
                                    child: Text(
                                      year,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          dropdownColor: const Color.fromARGB(255, 31, 31, 31),
                          underline: const SizedBox(),
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: const [
                  MeterCard(
                    title: "Electric Meter",
                    iconPath: 'assets/lightning.png',
                    usage: "125 kWh",
                    circleColor: Colors.amber,
                  ),
                  SizedBox(height: 24),
                  MeterCard(
                    title: "Water Meter",
                    iconPath: 'assets/drop.png',
                    usage: "85 m³",
                    circleColor: Colors.cyan,
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 39, 39, 39),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  // Navigate to UsageChartScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsageChartScreen(),
                    ),
                  );
                },
                child: const Text(
                  "View Usage Chart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// MeterCard Widget remains the same
class MeterCard extends StatelessWidget {
  final String title;
  final String iconPath;
  final String usage;
  final Color circleColor;

  const MeterCard({
    Key? key,
    required this.title,
    required this.iconPath,
    required this.usage,
    required this.circleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: circleColor.withOpacity(0.2),
                border: Border.all(
                  color: circleColor,
                  width: 8,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  iconPath,
                  width: 32,
                  height: 32,
                ),
                const SizedBox(height: 8),
                Text(
                  usage,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
