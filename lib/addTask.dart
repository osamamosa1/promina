import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  String taskDate, start, end;
  int selectedCategory=0;
  List Category = ['Development', 'Research', 'Design', 'BackEnd'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(height: 3,width: 25,color: Colors.black,),
                      SizedBox(height: 7,),
                      Container(height: 3,width: 15,color: Colors.black,)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create New Task',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Image.asset('images/tasks.png',height: MediaQuery.of(context).size.width*0.15,)
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Text(
              'Task name',
              style: TextStyle(color: Color(0xff349dcb)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              style: TextStyle(fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                  errorBorder: UnderlineInputBorder(borderSide: BorderSide(color:Color(0xff349dcb))),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff349dcb))),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xff349dcb))))
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select Category',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text('see all')
              ],
            ),
          ),
          InkWell(
            child: Container(
              padding: EdgeInsets.only(left: 15),
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) => Row(
                        children: [
                          InkWell(
                            onTap: (){
                              setState(() {
                                selectedCategory=index;
                              });
                            },
                            child: Container(
                              padding:
                                  EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: (selectedCategory==index) ? Color(0xff349dcb) : Colors.white,
                                  border: Border.all(color: Color(0xff349dcb), width: 1),
                                  borderRadius: BorderRadius.circular(15)),
                              height: MediaQuery.of(context).size.width*0.1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('${Category[index]}',
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width*0.03,
                                          color: (selectedCategory==index )
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
          ),
          SizedBox(height: MediaQuery.of(context).size.width*0.02,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('date',style: TextStyle(color: Color(0xff349dcb)),),
                      InkWell(
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2021),
                                  lastDate: DateTime(2030))
                              .then((date) => setState(() {
                            taskDate = date.day.toString() +
                                '/${date.month.toString()}' +
                                '/${date.year.toString()}';
                                  }));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 2))),
                          child: (taskDate != null)
                              ? Text(taskDate.toString(),style: TextStyle(fontWeight: FontWeight.bold),)
                              : Text(''),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2030))
                        .then((date) => setState(() {
                              taskDate = date.day.toString() +
                                  '/${date.month.toString()}' +
                                  '/${date.year.toString()}';
                            }));
                  },
                  child: CircleAvatar(
                    backgroundColor:  Color(0xff349dcb),
                    radius: MediaQuery.of(context).size.width*0.08,
                    child: Icon(
                      Icons.calendar_month,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.width*0.08,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text('start time',style: TextStyle(color: Color(0xff349dcb))),
                      InkWell(
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((time) => setState(() {
                                    start = time.hour.toString() +
                                        ':' +
                                        time.minute.toString();
                                  }));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 2))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                            Expanded(child: SizedBox()),
                              (start != null)
                                  ? Text(start.toString(),style: TextStyle(fontWeight: FontWeight.bold))
                                  : Text(''),Expanded(child: SizedBox()),
                              Icon(Icons.keyboard_arrow_down_sharp,size: 40,color: Color(0xff349dcb),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('end time',style: TextStyle(color: Color(0xff349dcb))),
                      InkWell(
                        onTap: () {
                          showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((time) => setState(() {
                                    end = time.hour.toString() +
                                        ':' +
                                        time.minute.toString();
                                  }));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 15),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.black, width: 2))),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: SizedBox()),
                              (end != null)
                                  ? Text(end.toString(),style: TextStyle(fontWeight: FontWeight.bold))
                                  : Text(''),Expanded(child: SizedBox()),
                              Icon(Icons.keyboard_arrow_down_sharp,size: 40,color: Color(0xff349dcb),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25,),
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Text(
              'Description',
              style: TextStyle(color: Color(0xff349dcb)),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: TextFormField(
              decoration: InputDecoration(
                  errorBorder: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder()),
            ),
          ),
          SizedBox(height:25),
          InkWell(
            onTap: () async {

            },
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width*0.6,
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 8),
                decoration: BoxDecoration(
                    color: Color(0xff349dcb),
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child: Text(
                      'Create task',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          color: Colors.white),
                    )),
              ),
            ),
          ),
          SizedBox(height:25),

        ],
      ),
    );
  }
}
