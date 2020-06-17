import 'package:flutter/material.dart';
import 'package:flutterjob/models/company.dart';
import '../constants.dart';

class CompanyTab extends StatelessWidget {
  final Company company;
  CompanyTab({this.company});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          SizedBox(height: 25.0,),
          Text("About Company", style:kTitleStyle.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 15.0,),
          Text(company.aboutCompany,style: kSubTitleStyle.copyWith(fontWeight: FontWeight.w300,height: 1.5,color: Color(0xFF5B5B5B)),)


        ],
      ),
      
      
    );
  }
}