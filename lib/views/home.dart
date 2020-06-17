import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterjob/models/company.dart';
import 'package:flutterjob/widgets/company_card.dart';
import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'job_detail.dart';


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilver,
      appBar: AppBar(
        actions: <Widget>[
          SvgPicture.asset('assets/user.svg',width: 25.0,color: kBlack,),
          SizedBox(width: 18.0,),
        ],
        backgroundColor: kSilver,
        elevation: 0.0,
        leading: Padding(
          child: SvgPicture.asset('assets/drawer.svg',color: kBlack,),
          padding: EdgeInsets.only(left:18.0,top:12.0,bottom:12,right:12)),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 25.0,),
              Text("Hi Rahul \n Find your Dream Job",style: kPageTitleStyle,),
              SizedBox(height: 25.0,),
              Container(width: double.infinity,
                height: 50.0,
                margin: EdgeInsets.only(right:18),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        cursorColor: kBlack,
                        decoration: InputDecoration(
                          icon: Icon(Icons.search,size: 25.0,color: kBlack,),
                          border: InputBorder.none,
                          hintText: "Search for job",
                          hintStyle: kSubTitleStyle.copyWith(color: Colors.black38),
                        ),
                      ),
                    )),

                    Container(
                      width: 50.0,
                       height: 50.0,
                       margin: EdgeInsets.only(left:12),
                       decoration: BoxDecoration(
                         color: kBlack,
                         borderRadius: BorderRadius.circular(12),

                       ),
                       child: Icon(FontAwesomeIcons.slidersH,color: Colors.white,),
                    ),
                  ],
                ),
              ),

              SizedBox( height: 25,),
              Text("Popular Company",style: kTitleStyle,),
              SizedBox(height: 15.0,),
              Container(
                width: double.infinity,
                height: 190,
                child: ListView.builder(
                  itemCount: companyList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder:(context,index){
                    Company company = companyList[index];
                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>JobDetail(company: company,)
                        ));
                      },
                      child: CompanyCard(company: company,));

                  }),
              ),

              SizedBox(height: 35.0,),
              Text("Recent Jobs",style:kTitleStyle),
              ListView.builder(
                itemCount: recentList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context,index){
                  var recent = recentList[index];
                  return Card(
                    elevation: 0.0,
                    margin: EdgeInsets.only(right: 18,top: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ListTile(
                      leading: Container(width: 50.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: AssetImage(recent.image),
                          fit: BoxFit.cover
                        )
                      ),
                      ),
                      title: Text(recent.job,style: kTitleStyle,),
                      subtitle: Text('${recent.companyName}   (${recent.mainCriteria})'),
                      trailing: Icon(Icons.more_vert,color: kBlack,),
                    ),  
                  );
                }),
                SizedBox(height: 35.0,)
            ],
          ),
        ),
      ),
      
      
    );
  }
}