import 'package:flutter/material.dart';
import 'package:flutterjob/models/company.dart';
import '../constants.dart';

import 'company_tab.dart';
import 'description_tab.dart';

class JobDetail extends StatelessWidget {
  final Company company;
  JobDetail({this.company});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSilver,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: kSilver,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: kBlack,),onPressed: (){
          Navigator.pop(context);
        },),
        title: Text(company.companyName,style: kTitleStyle,),
      ),
      body: DefaultTabController( 
        length: 2,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 18,vertical: 15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0),topRight: Radius.circular(40)),

          ),
          child: Column(
            children: <Widget>[
              Container(
                constraints: BoxConstraints(maxHeight: 250),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 70.0,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage(company.image),fit: BoxFit.cover)
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Text(company.job,style: kTitleStyle.copyWith(fontWeight: FontWeight.bold),),
                    SizedBox( height: 15.0,),
                    Text(company.sallary,style: kSubTitleStyle,),
                    SizedBox( height: 15.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: company.tag.map((e) => Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: kBlack.withOpacity(.5)
                          )
                        ),
                        child: Text(e,style: kSubTitleStyle,),
                      )).toList()
                    ),

                    SizedBox(height: 25.0,),

                    Material(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        side: BorderSide(color: kBlack.withOpacity(.2))
                      ),
                      child: TabBar(
                        unselectedLabelColor: kBlack,
                        indicator: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(12)
                        ),
                        tabs: [
                          Tab(text: "Description",),
                          Tab(text: "Company",),
                        ],),
                    ),


                  ],
                ),
              ),

              Expanded(
                child:TabBarView(children: [
                  DescriptionTab(company: company,),
                  CompanyTab(company: company,),
                ]) ),
            ],
          ),
        ),

      ),
      bottomNavigationBar: PreferredSize(
        child: Container(
          padding: EdgeInsets.only(left: 18.0,bottom: 25,right: 18.0),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  border:Border.all(color: kBlack.withOpacity(.5)),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Icon(Icons.bookmark_border,color: kBlack,),
              ),

              SizedBox(width: 15.0,),
              Expanded(child: SizedBox(
                height: 50.0,
                child: RaisedButton(
                  onPressed: (){},
                  color: kBlack,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text("Apply for Job",style:kTitleStyle.copyWith(color: Colors.white),
                ),
              )),),
            ],
          ),
        ),
         preferredSize: Size.fromHeight(60.0)),
      
    );
  }
}