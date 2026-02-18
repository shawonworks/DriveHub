import 'package:flutter/material.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';

class CardDesign extends StatelessWidget {
  CardDesign({super.key});

  final List<Map<String, dynamic>> data = [
    {
      "title": "Total Earnings",
      "value": "328,000 FCFA",
      "icon": Icons.attach_money,
      "bg": Color(0xffdff0ff)
    },
    {
      "title": "Total Bookings",
      "value": "358",
      "icon": Icons.event_note,
      "bg": Color(0xfff0e8ff)
    },
    {
      "title": "Your Vehicles",
      "value": "04",
      "icon": Icons.directions_car,
      "bg": Color(0xffffe4e4)
    },
    {
      "title": "Your Vehicles",
      "value": "04",
      "icon": Icons.directions_car,
      "bg": Color(0xfffff6d6)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: data.map((item) {
            return _buildCard(
              title: item["title"],
              value: item["value"],
              icon: item["icon"],
              bgColor: item["bg"],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    required String value,
    required IconData icon,
    required Color bgColor,
  }) {
    return Container(
      width: AppSize.size.width*0.445,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Box
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(.6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 26, color: Colors.black87),
          ),
          Gap(height: 10,),

          Text(
            title,
            style: TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),

          Gap(height: 8,),

          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          Gap(height: 6,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
               ConstString.thisMonth,
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
              Row(
                children: [
                  Icon(Icons.trending_up, color: Colors.green, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "+23.5%",
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
