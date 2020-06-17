import 'package:flutter/material.dart';
import 'package:flutterjob/models/company.dart';
import '../constants.dart';

class DescriptionTab extends StatelessWidget {
  final Company company;
  DescriptionTab({this.company});
  @override
  Widget build(BuildContext context) {
    return Container(
     child: ListView(
       children: <Widget>[
         SizedBox(height: 25.0,),
         Text("About the Opportnity",style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),),
         SizedBox(height: 15.0,),
         Text(company.jobOpportunity,style: kSubTitleStyle.copyWith(
           height: 1.5,
           fontWeight: FontWeight.w300,
           color: Color(0xFF5B5B5B),

         ),),

         SizedBox(height: 25.0,),

         Text("Job Responsibilies",style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),),
         SizedBox(height: 15.0,),
         Column(
           children: company.jobResponsbilities.map((e) => Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text("- ",style:kPageTitleStyle),
               Expanded(child: Text("$e\n",style:kSubTitleStyle.copyWith(fontWeight: FontWeight.w300,height: 1.5,color: Color(0xFF5B5B5B))))
             ],
           )).toList(),
         ),
       ],
     ),
      
    );
  }
}