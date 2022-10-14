import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizapp/widget/Button.dart';

import '../../Providers/QuizProvider.dart';
import '../../styles/Styles.dart';
import '../../widget/TextFormfield.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<QuizProvider>(context,listen: false).reset();
  }
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Consumer<QuizProvider>(
        builder: (context, provider, child) {
          return GestureDetector(
            onTap: (){
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Center(
              child: SingleChildScrollView(
                child: SizedBox(width: w/1.2,
                  child: Card(
                      color: Colors.grey[100],
                      elevation: 5,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(130),
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          children: [
                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Question : ",style: Styles().normalS(fontW: FontWeight.w400, fontS: 18, color: black),),
                                SizedBox(width: 10,),
                                Textformfield().radiusT(w: w, controller: provider.qstn, kType: TextInputType.text, hint: "Enter Question", onT: (){}, read: false)
                              ],
                            ),
                            const SizedBox(height: 25,),
                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Option A : ",style: Styles().normalS(fontW: FontWeight.w400, fontS: 18, color: black),),
                                SizedBox(width: 10,),
                                Textformfield().radiusT(w: w, controller: provider.option1, kType: TextInputType.text, hint: "Enter Option A", onT: (){}, read: false)
                              ],
                            ),
                            SizedBox(height: 25,),

                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Option B : ",style: Styles().normalS(fontW: FontWeight.w400, fontS: 18, color: black),),
                                SizedBox(width: 10,),
                                Textformfield().radiusT(w: w, controller: provider.option2, kType: TextInputType.text, hint: "Enter Option B", onT: (){}, read: false)
                              ],
                            ),
                            SizedBox(height: 25,),

                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Option C : ",style: Styles().normalS(fontW: FontWeight.w400, fontS: 18, color: black),),
                                SizedBox(width: 10,),
                                Textformfield().radiusT(w: w, controller: provider.option3, kType: TextInputType.text, hint: "Enter Option C", onT: (){}, read: false)
                              ],
                            ),
                            SizedBox(height: 25,),

                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Option D : ",style: Styles().normalS(fontW: FontWeight.w400, fontS: 18, color: black),),
                                SizedBox(width: 10,),
                                Textformfield().radiusT(w: w, controller: provider.option4, kType: TextInputType.text, hint: "Enter Option D", onT: (){}, read: false)
                              ],
                            ),
                            SizedBox(height: 25,),

                            Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Answer   : ",style: Styles().normalS(fontW: FontWeight.w400, fontS: 18, color: black),),
                                SizedBox(width: 10,),
                                Textformfield().radiusT(w: w, controller: provider.answer, kType: TextInputType.text, hint: "Enter Answer", onT: (){}, read: false)

                              ],
                            ),

                            SizedBox(height: 50,),
                            Row(mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Button().button(action: (){
                                  provider.addQuestion(context);
                                }, txt: "SAVE", context: context, color: Colors.blueGrey)
                              ],
                            )




                          ],
                        ),
                      )),
                ),
              ),
            ),
          );


        });
  }
}
