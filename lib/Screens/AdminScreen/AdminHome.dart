import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/QuizProvider.dart';
import '../../styles/Styles.dart';
import '../connectivityWidget.dart';
import 'FirstTab.dart';
import 'SecondTab.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).requestFocus(FocusNode());

      },
      child: DefaultTabController(
        length: 2,
        child: ConnectivityWidget(
          child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  onTap: (val){
                    if(val == 1){
                      Provider.of<QuizProvider>(context,listen: false).reset();
                    }
                  },
                  tabs: [
                    Tab(icon: Icon(Icons.quiz)),
                    Tab(icon: Icon(Icons.add_comment_outlined)),
                  ],
                ),
                centerTitle: false,
                automaticallyImplyLeading: true,
                backgroundColor: Colors.blueGrey,
                leading: const BackButton(
                  color: Colors.white,
                ),
                title: Text(
                  'Admin',
                  style: Styles()
                      .normalS(fontW: FontWeight.normal, fontS: 22, color: white),
                ),
              ),
              body: Consumer<QuizProvider>(builder: (context, provider, child) {
                return    TabBarView(
                    children: [
                    FirstTab().firsttab(w:w),
                      SecondTab()
                  ],);
              })),
        ),
      ),
    );
  }
}
