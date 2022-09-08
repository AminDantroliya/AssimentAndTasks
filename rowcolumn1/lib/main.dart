import 'package:flutter/material.dart';
void main() {
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          backgroundColor: Color.fromRGBO(207, 106, 5, 1),
          title: Center(
            child: Text("Row/Col",
            style: TextStyle(color: Colors.black,
            fontSize: 35,
            ),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 255, 235, 52),
        body: Container(
           color: Colors.yellow,
           child: Column(
            children: [
              
              Container(
                height: 1,
                color: Colors.black,
              ),
              Container(
                color: Color.fromRGBO(207, 106, 5, 1),
                height: 60,
                
               child:Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                      Icon(
                        Icons.arrow_back,
                        size: 50,
                        ),
                          Text("Layout\n\nrow"),
                        Icon(
                        Icons.arrow_forward,
                        size: 50,
                        ),
                         Icon(
                        Icons.arrow_back,
                        size: 50,
                        ),
                          Text("Main Axis Alignment\n         Space\n         around"),
                        Icon(
                        Icons.arrow_forward,
                        size: 50,
                        ),
                ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              Container(
                color: Color.fromRGBO(207, 106, 5, 1),
                height: 60,
                
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                      Icon(
                        Icons.arrow_back,
                        size: 50,
                        ),
                          Text("Main Axis Size\n\n Max"),
                        Icon(
                        Icons.arrow_forward,
                        size: 50,
                        ),
                         Icon(
                        Icons.arrow_back,
                        size: 50,
                        ),
                        Text("Cross Axis\n Alignment\nStretch"),
                        Icon(
                        Icons.arrow_forward,
                        size: 50,
                        ),
                ],
                ),
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              Container(
                margin: EdgeInsets.all(35),
                height: 500,
                alignment:Alignment.center,
                child: Row(
                  children: [
                    Icon(Icons.stars,size: 80,
                        
                    ),
                    Icon(Icons.stars,size: 150,),
                    Icon(Icons.stars,size: 80,),
                  ],
                
                ),
              ),
            ],
            ) ,
          ),
        ),
         );
  }
}