import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubits.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';
import 'package:travel_app/widgets/app_text.dart';

import '../widgets/responsive_button.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png",
  ];
  List imageUrls =[
    "https://img.lovepik.com/background/20211030/medium/lovepik-mountain-mobile-wallpaper-background-image_400367744.jpg",
    "https://wallpapershome.com/images/pages/ico_v/23931.jpg",
    "https://images.unsplash.com/photo-1521336575822-6da63fb45455?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8a2F5YWt8ZW58MHx8MHx8&w=1000&q=80"
  ];
  List textI=[
    "Discover","Discover","Discover",
  ];
  List textII=[
    "Mountains","Wildlife","Rivers"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(imageUrls[index]),//AssetImage("img/" + images[index]),
                      fit: BoxFit.cover)),
              child: Container(
                  margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(text: textI[index]),
                          AppText(text: textII[index], size: 30,color:index==2?Colors.white54:Colors.black54),
                          SizedBox(height: 20,),
                          Container(
                            width: 250,
                            child:
                              AppText(text: "Mountain hikes give you an incredible sense of freedom along with endurance test.",
                            color: index==0?Colors.black87:index==1?Colors.black87:Colors.white70,
                            size:14,
                              ),
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: (){
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                                width:200,
                                child: Row(children:[ ResponsiveButton(width:120,)])),
                          )
                        ],
                      ),
                      Column(
                        children: List.generate(3, (indexDots){
                          return Container(
                            margin: const EdgeInsets.only(bottom: 2),
                            width: 8,
                              height: index==indexDots?25:8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color:index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                            ),
                          );
                        }),
                      )
                    ],
                  )),
            );
          }),
    );
  }
}
