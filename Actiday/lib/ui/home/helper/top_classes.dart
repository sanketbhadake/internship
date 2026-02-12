
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/widgets/common_container.dart';
import '../../utils/widgets/common_text.dart';



class TopClasses extends StatefulWidget {



  const TopClasses({super.key});

  @override
  State<TopClasses> createState() => _TopClassesState();
}

class _TopClassesState extends State<TopClasses> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Stack(
            children: [
              Image.asset('assets/images/ic_banner.png'),
              Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                      child: Icon(Icons.favorite, color: Colors.pink, size: 18,)
                  )
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Weight Lift", style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),),
                    Text("Lady Fit", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200),),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.grey,size: 15,),
                        Text("Arabian Gulf st 2 km", softWrap: true, style: TextStyle(fontSize: 12, color: Colors.grey))
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


