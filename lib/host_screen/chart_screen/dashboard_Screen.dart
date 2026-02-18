import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_connect/constant/const_color.dart';
import 'package:go_connect/constant/const_string.dart';
import 'package:go_connect/constant/dev_image_string.dart';
import 'package:go_connect/host_screen/chart_screen/controller/chart_screen_controller.dart';
import 'package:go_connect/utils/app_size.dart';
import 'package:go_connect/utils/gap.dart';
import 'widgets/bar_chart_earnings.dart';
import 'widgets/line_chart_user_growth.dart';

class DashboardScreen extends StatefulWidget {
   DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String selectedYear = "2023";
  final List<Map<String, dynamic>> data = [
    {
      "title":ConstString.totalEarnings,
      "value": "328,0 FCFA",
      "icon": Image.asset(DevImageString.dollerIcon),
      "bg": Color(0xffE9F3FF)
    },
    {
      "title": ConstString.totalBookings,
      "value": "328,0.",
      "icon": Image.asset(DevImageString.bookingIcon),
      "bg": Color(0xffF7F2FF)
    },
    {
      "title": ConstString.yourVehicles,
      "value": "04",
      "icon":  Image.asset(DevImageString.carIcon),
      "bg": Color(0xffFFDBDB)
    },
    {
      "title":  ConstString.yourVehicles,
      "value": "04",
      "icon":  Image.asset(DevImageString.carIconYollow),
      "bg": Color(0xffFFF7D7)
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ChartScreenController(),
      builder: (controller){
        return Scaffold(

          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Wrap(
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


                // =======================Earnings Chart --------------------------------------------
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(ConstString.revenueStatistics,style: TextStyle(fontSize: 20,color: Color(0xff101828),fontWeight: FontWeight.bold),),
                              Text(ConstString.month12PerformanceTracking),
                            ],
                          ),
                          _yearDropdown()
                        ],
                      ),

                      Gap(height: 12,),

                      Container(
                        alignment: Alignment.center,
                        height: 260,
                        child: EarningsBarChart(),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                        color: ConstColor.texttealColor,
                        borderRadius: BorderRadius.all(Radius.circular(360))
                      ),
                    ),
                    Gap(width: 5,),
                    Text(ConstString.earningsFCFA,style: TextStyle(fontSize: 12,color: ConstColor.texttealColor),)
                  ],
                ),
                Gap(height: 18,),

                //======================= User Growth Chart ----------------------------------------------
                Container(
                  width: AppSize.size.width*1,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(ConstString.userGrowth,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 6),
                      const Text(ConstString.month12PerformanceTracking,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _yearDropdown(),
                        ],
                      ),

                      Gap(height: 12,),

                      SizedBox(
                        height:260,
                        width: double.maxFinite,
                        child: UserGrowthLineChart(),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      decoration: BoxDecoration(
                          color: ConstColor.texttealColor,
                          borderRadius: BorderRadius.all(Radius.circular(360))
                      ),
                    ),
                    Gap(width: 5,),
                    Text(ConstString.earningsFCFA,style: TextStyle(fontSize: 12,color: ConstColor.texttealColor),)
                  ],
                ),
                Gap(height: 20,),
                // ============================this is Recent Payout =============================

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ConstString.recentPayout,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text(ConstString.viewAll,style: TextStyle(color: Color(0xFF009689)),)
                  ],
                ),

                Gap(height: 10,),

                SizedBox(
                  height:AppSize.size.height*0.25,
                  child: ListView.builder(itemBuilder: (context,index){

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFF00BBA7),
                                child: Text("SM",style: TextStyle(fontSize: 16,color: Colors.white),),
                              ),
                              Column(
                                children: [
                                  Text(ConstString.sarahMiller,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  Text(ConstString.teslaModel3,style: TextStyle(color:Color(0xFF6A7282) ),),
                                  Gap(height: 10,),
                                  Text(ConstString.nov20232024,style: TextStyle(color:Color(0xFF6A7282) ))
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(ConstString.fCFA135000,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xFF009689)),),

                                  Gap(height: 20,),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Color(0xFF0DC304)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 9,right: 8,top: 4,bottom: 2),
                                      child: Text(ConstString.completed,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                    ),

                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },itemCount: 5,),
                ),
                Gap(height: 20,),

                // ============================this is Upcoming Payout =============================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(ConstString.upcomingPayout,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    Text(ConstString.viewAll,style: TextStyle(color: Color(0xFF009689)),)
                  ],
                ),
                Gap(height: 10,),

                SizedBox(
                  height:AppSize.size.height*0.25,
                  child: ListView.builder(itemBuilder: (context,index){

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: Colors.grey)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Color(0xFF00BBA7),
                                child: Text("SM",style: TextStyle(fontSize: 16,color: Colors.white),),
                              ),
                              Column(
                                children: [
                                  Text(ConstString.sarahMiller,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  Text(ConstString.teslaModel3,style: TextStyle(color:Color(0xFF6A7282) ),),
                                  SizedBox(height: 10,),
                                  Text(ConstString.nov20232024,style: TextStyle(color:Color(0xFF6A7282) ))
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text(ConstString.fCFA135000,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold,color: Color(0xFF009689)),),

                                  Gap(height: 20,),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: Color(0xFFFECB00)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 9,right: 8,top: 4,bottom: 2),
                                      child: Text(ConstString.upcoming,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                                    ),

                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },itemCount: 2),
                ),

              ],
            ),
          ),
        );
      },
    );
  }


  //year Dropdown (2023)
  Widget _yearDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: const Color(0xffF2F2F2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: selectedYear,
          items: ["2023", "2024","2025", "2026", "2027","2028"].map((year) {
            return DropdownMenuItem(
              value: year,
              child: Text(year),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedYear = value!;

            });
          },
        ),
      ),
    );
  }
}

Widget _buildCard({
  required String title,
  required String value,
  required Widget icon,
  required Color bgColor,
}) {
  return Container(
    width: AppSize.size.width *0.455,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon Box
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha:  0.6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: icon,
            ),
            Gap(width: 4,),
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
            ),
          ],
        ),
        Gap(height: 10,),

        Text(
          value,
          style: TextStyle(
            fontSize: 16,
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
                Gap(width:  4,),
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






