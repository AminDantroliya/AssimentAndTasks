import 'dart:io';
void main() {
  var choice;
  bool status=true;
    while(status==true)
    {
      print(">>>> Menu <<<<");
      print("<1> Equality");
      print("<2> String Copy");
      print("<3> Concat");
      print("<4> Show");
      print("<5> Reverse");
      print("<6> Palindrome");
      print("<7> Sub String");
      print("<8> Exit");
      print("\n\t  Enter Enter Your Choice:-->");
      choice=int.parse(stdin.readLineSync()!);
      switch(choice){ 
        case 1:
        {
          print("Enter Your String:-->");
          var n=stdin.readLineSync()!;
          if(n==n){
            print("$n");
            status=false;
          }
          else
          {
            status=false;
            print("Exit");
          }
        }
        break;
        case 2:
        {

        }
        break;
        case 3:
        {

        }
        break;
        case 4:
        {

        }
        break;
        case 5:
        {

        }
        break;
        case 6:
        {

        }
        break;
        case 7:
        {

        }
        break;
        case 8:
        {

        }
        break;

      }
    }
    
}