import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Providers/QuizProvider.dart';
import '../../styles/Styles.dart';
import '../../widget/Button.dart';
import '../../widget/TextFormfield.dart';
import 'SecondTab.dart';

class FirstTab {
  firsttab({required double w}) {
    return Consumer<QuizProvider>(builder: (context, provider, child) {
      return Container(
          child: provider.questionResponse != null &&
                  provider.questionResponse!.question!.isNotEmpty
              ? ListView.builder(
                  itemCount: provider.questionResponse!.question!.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                          color: Colors.grey.shade50,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topRight: Radius.circular(80),
                          )),
                          // shape: const RoundedRectangleBorder(
                          //   borderRadius:
                          //   BorderRadius.all(Radius.circular(7.0)),
                          // ),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Question : ${provider.questionResponse!.question![index].qstn}",
                                  style: Styles().normalS(
                                      fontW: FontWeight.w500,
                                      fontS: 18,
                                      color: black),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Options :",
                                  style: Styles().normalS(
                                      fontW: FontWeight.w500,
                                      fontS: 18,
                                      color: black),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "1.  ${provider.questionResponse!.question![index].option1}",
                                      style: Styles().normalS(
                                          fontW: FontWeight.w500,
                                          fontS: 18,
                                          color: black),
                                    ),
                                    Text(
                                      "2.  ${provider.questionResponse!.question![index].option2}",
                                      style: Styles().normalS(
                                          fontW: FontWeight.w500,
                                          fontS: 18,
                                          color: black),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "3.  ${provider.questionResponse!.question![index].option3}",
                                      style: Styles().normalS(
                                          fontW: FontWeight.w500,
                                          fontS: 18,
                                          color: black),
                                    ),
                                    Text(
                                      "4.  ${provider.questionResponse!.question![index].option4}",
                                      style: Styles().normalS(
                                          fontW: FontWeight.w500,
                                          fontS: 18,
                                          color: black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Answer : ${provider.questionResponse!.question![index].answer}",
                                  style: Styles().normalS(
                                      fontW: FontWeight.w500,
                                      fontS: 18,
                                      color: black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.edit),
                                      color: Colors.black,
                                      onPressed: () {
                                        provider.setEditData(
                                            data: provider.questionResponse!
                                                .question![index]);
                                        showDialog(
                                          context: context,
                                          builder: (context2) {
                                            return Dialog(
                                              insetPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Card(
                                                        color: Colors.grey[100],
                                                        elevation: 5,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .all(
                                                          Radius.circular(10),
                                                        )),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(50.0),
                                                          child: Column(
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Question : ",
                                                                    style: Styles().normalS(
                                                                        fontW: FontWeight
                                                                            .w400,
                                                                        fontS:
                                                                            18,
                                                                        color:
                                                                            black),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Textformfield().radiusT(
                                                                      w: w,
                                                                      controller:
                                                                          provider
                                                                              .qstn,
                                                                      kType: TextInputType
                                                                          .text,
                                                                      hint:
                                                                          "Enter Question",
                                                                      onT:
                                                                          () {},
                                                                      read:
                                                                          false)
                                                                ],
                                                              ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Option A : ",
                                                                    style: Styles().normalS(
                                                                        fontW: FontWeight
                                                                            .w400,
                                                                        fontS:
                                                                            18,
                                                                        color:
                                                                            black),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Textformfield().radiusT(
                                                                      w: w,
                                                                      controller:
                                                                          provider
                                                                              .option1,
                                                                      kType: TextInputType
                                                                          .text,
                                                                      hint:
                                                                          "Enter Option A",
                                                                      onT:
                                                                          () {},
                                                                      read:
                                                                          false)
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Option B : ",
                                                                    style: Styles().normalS(
                                                                        fontW: FontWeight
                                                                            .w400,
                                                                        fontS:
                                                                            18,
                                                                        color:
                                                                            black),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Textformfield().radiusT(
                                                                      w: w,
                                                                      controller:
                                                                          provider
                                                                              .option2,
                                                                      kType: TextInputType
                                                                          .text,
                                                                      hint:
                                                                          "Enter Option B",
                                                                      onT:
                                                                          () {},
                                                                      read:
                                                                          false)
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Option C : ",
                                                                    style: Styles().normalS(
                                                                        fontW: FontWeight
                                                                            .w400,
                                                                        fontS:
                                                                            18,
                                                                        color:
                                                                            black),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Textformfield().radiusT(
                                                                      w: w,
                                                                      controller:
                                                                          provider
                                                                              .option3,
                                                                      kType: TextInputType
                                                                          .text,
                                                                      hint:
                                                                          "Enter Option C",
                                                                      onT:
                                                                          () {},
                                                                      read:
                                                                          false)
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Option D : ",
                                                                    style: Styles().normalS(
                                                                        fontW: FontWeight
                                                                            .w400,
                                                                        fontS:
                                                                            18,
                                                                        color:
                                                                            black),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Textformfield().radiusT(
                                                                      w: w,
                                                                      controller:
                                                                          provider
                                                                              .option4,
                                                                      kType: TextInputType
                                                                          .text,
                                                                      hint:
                                                                          "Enter Option D",
                                                                      onT:
                                                                          () {},
                                                                      read:
                                                                          false)
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    "Answer   : ",
                                                                    style: Styles().normalS(
                                                                        fontW: FontWeight
                                                                            .w400,
                                                                        fontS:
                                                                            18,
                                                                        color:
                                                                            black),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  Textformfield().radiusT(
                                                                      w: w,
                                                                      controller:
                                                                          provider
                                                                              .answer,
                                                                      kType: TextInputType
                                                                          .text,
                                                                      hint:
                                                                          "Enter Answer",
                                                                      onT:
                                                                          () {},
                                                                      read:
                                                                          false)
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 50,
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Button().button(
                                                                      action: () {
                                                                        provider.editQuestion(
                                                                            context,
                                                                            provider.questionResponse!.question![index]);
                                                                      },
                                                                      txt: "UPDATE",
                                                                      context: context,
                                                                      color: Colors.blueGrey)
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      color: Colors.black,
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context2) {
                                            return Dialog(
                                              insetPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Do you want to delete the question?",
                                                        style: Styles().normalS(
                                                            fontW:
                                                                FontWeight.w500,
                                                            fontS: 20,
                                                            color: black),
                                                      ),
                                                      const SizedBox(
                                                        height: 40,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Button().button(
                                                              action: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              txt: "No",
                                                              context: context,
                                                              color: Colors
                                                                  .blueGrey),
                                                          const SizedBox(
                                                            width: 30,
                                                          ),
                                                          Button().button(
                                                              action: () {
                                                                Navigator.pop(
                                                                    context);
                                                                provider.deleteQuestion(
                                                                    context,
                                                                    provider
                                                                        .questionResponse!
                                                                        .question![index]);
                                                              },
                                                              txt: "YES",
                                                              context: context,
                                                              color: Colors
                                                                  .blueGrey),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                    );
                  },
                )
              : provider.questionResponse != null &&
                      provider.questionResponse!.question!.isEmpty
                  ? Center(
                      child: Text(
                      "No Questions Available !!!",
                      style: TextStyle(
                          color: primary1,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                    ))
                  : Center(child: CircularProgressIndicator()));
    });
  }
}
