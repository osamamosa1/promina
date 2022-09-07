import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addTask.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List Week = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];
  List Task = ['Team meeting', 'Call the stylest', 'Check mail'];
  int selectedDay=0;
  List Details = [
    'Discuss all question\n about the new project',
    'agree on an evening \n look',
    'write to the manager'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:Color(0xff349dcb),
        body: ListView(
          children: [
            Container(
              height: 65,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: Container(
                          color: Color(0xff349dcb),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25))),
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.8,
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                        Container(
                          padding: EdgeInsets.only(left: 25,bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(height: 3,width: 25,color: Colors.black,),
                            SizedBox(height: 7,),
                            Container(height: 3,width: 15,color: Colors.black,)
                          ],
                        )),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Stack(
                                  children: [
                                    Icon(Icons.notifications),
                                    Positioned(
                                      right: 2,bottom: 2,
                                      child: Container(height: 5,width: 5,decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.red
                                      ),),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xff349dcb),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25))),
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: 100,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25))),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'My Task',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddTask()));
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff349dcb)),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'today',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'monday, 1 june',
                          style: TextStyle(color: Color(0xff349dcb)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 30,
                        itemBuilder: (context, index) => Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      selectedDay=index;
                                    });
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: (selectedDay==index)
                                            ? Color(0xff349dcb)
                                            : Colors.white,
                                        border: Border.all(
                                            color: Color(0xff349dcb), width: 1),
                                        borderRadius: BorderRadius.circular(15)),
                                    height: 60,
                                    width: 60,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: (index==selectedDay)
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                        Text('${Week[(index) % 7]}',
                                            style: TextStyle(
                                                fontSize: 8,
                                                color: (selectedDay==index)
                                                    ? Colors.white
                                                    : Color(0xff349dcb)))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                )
                              ],
                            )),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                  ),
                  Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.50,
                      decoration: BoxDecoration(
                          color: Color(0xff349dcb),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(25))),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.09),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.50,
                        child: Scrollbar(
                            isAlwaysShown: true,
                            scrollbarOrientation: ScrollbarOrientation.left,
                            child: ListView.builder(
                              padding: EdgeInsets.all(0),

                              itemCount: 10,
                              itemBuilder: (context, index) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width *
                                          0.75,
                                      padding: EdgeInsets.only(top: 25,left: 25,right: 25),
                                      child: Stack(
                                        children: [
                                          Card(
                                            color: Colors.white,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              height: 100,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  (index%3==0)? Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: Row(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Expanded(child: Container(child: Image.asset('images/person2.jpg'))),
                                                            SizedBox(height: 3,),
                                                            Expanded(child: Container(
                                                                width: 24,
                                                                child: Image.asset('images/person1.jpg',fit: BoxFit.fill,))),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                                            Expanded(child: Container(child: Image.asset('images/person3.png'))),
                                                            SizedBox(height: 3,),
                                                            Icon(Icons.add_box_rounded)
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ):Container(
                                                    height: 50,
                                                      width: 50,
                                                      child: Image.asset('images/task${index%3}.png',fit: BoxFit.fill,)),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '${Task[index % 3]}',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                          '${Details[index % 3]}',
                                                          style: TextStyle(
                                                              fontSize: 8,
                                                              color:
                                                              Color(0xff349dcb))),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            top: 90,
                                            left: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.36,
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 30,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.26,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  20),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  20))),
                                              child: Text(
                                                '${(index + 10) % 13} pm',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            )),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
