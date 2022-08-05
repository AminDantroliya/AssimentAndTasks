import'dart:io';
main()
{
    final today_price = 4783;
    double total_price,net_amount,p_qty;
    String? f_name,l_name,gender,yn;
    int age;

    print("\n\t\t ------------------------------------\n");
    print("\n\t\t >>>* WELCOME TO KALYAN JWELLERS *<<<\n\n");
    print("\t\t ------------------------------------");
    print("\n Enter Your First Name:-->");
    f_name=stdin.readLineSync()!;
    print("\n Enter Your Last Name:-->");
    l_name=stdin.readLineSync()!;
    print("\n Enter Your Gender:-->");
    gender=stdin.readLineSync()!;
    
    if(gender=='M')
    {
        gender='m';
    }
    else if(gender=='F')
    {
        gender='f';
    }
    else if(gender != 'm' && gender != 'f')
    {
        print("\n ::: INVILIDE GENDER :::");
    }
    switch(gender)
    {
        case 'm':
        {
            print("\n\t Enter Your AGE:-->");
            age=int.parse(stdin.readLineSync()!);
            if(age >= 65)
            {
                print("\t\t >>>* YOUR DISCOUNT AVABLE *<<<\n");
                print("\t----------------------\n");
                print("\t 1 LK \t 2 LK \t 3 LK");
                print("\t  10% \t   20% \t 30%\n");
                print("\t----------------------\n");
                print("\n DO YOU  WONT TO PURCHES 'Y'or'N'");
                yn=stdin.readLineSync()!;
                if( yn == 'y' || yn =='Y')
                {
                    print("\n\t HOW MENY PURCHES PRODECT:-->");
                    p_qty=double.parse(stdin.readLineSync()!);
                    print("\t ************************** ");
                    print("\n\t Totle Price:-->${total_price=today_price*p_qty}");
                    if(total_price >= 10000 && total_price <= 100000)
                    {
                        print("\n\t >> DISCOUNT IS 10% <<");
                        print("\n\t PAYBLE AMOUNT :-->${net_amount=(total_price*10)/100}");
                        print("\t ************************** ");
                    }
                    else if(total_price > 100000 && total_price < 300000)
                    {
                        print("\n\t >> DISCOUNT IS 20% <<");
                        print("\n\t PAYBLE AMOUNT :-->${net_amount=(total_price*20)/100}");
                        print("\t ************************** ");
                    }
                    else if(total_price >= 300000)
                    {
                        print("\n\t >> DISCOUNT IS 30% <<");
                        print("\n\t PAYBLE AMOUNT :-->${net_amount=(total_price*30)/100}");
                        print("\t ************************** ");
                    }
                    else
                    {
                        print("\n\t PAYBLE PRICE:-->${total_price=today_price*p_qty}");
                        print("\t ************************** ");
                    }
                }
            }
            else if(age >=0 && age < 65)
            {
                print("\n\t\t >>>* YOUR DISCOUNT AVABLE *<<<");
                print("\n\t 1 LK \t 2 LK \t 3 LK");
                print("\t  05% \t   15% \t 25%");
                print("\n\t DO YOU WONT TO PURCHES 'Y'or'N'");
                yn=stdin.readLineSync()!;
                if( yn == 'y' || yn =='Y')
                {
                    print("\n\t HOW MENY PURCHES PRODECT:-->");
                    print("\t------------------------");
                    p_qty=double.parse(stdin.readLineSync()!);
                    print("\t ************************** ");
                    print("\t Totle Price:-->${total_price=today_price*p_qty}");
                    if(total_price >= 10000 && total_price <= 100000)
                    {
                        print("\t >> DISCOUNT IS 05% <<");
                        print("\t PAYBLE AMOUNT :-->${net_amount=(total_price*5)/100}");
                        print("\t ************************** ");
                    }
                    else if(total_price > 100000 && total_price < 300000)
                    {
                        print("\t >> DISCOUNT IS 15% <<");
                        print("\t PAYBLE AMOUNT :-->${net_amount=(total_price*15)/100}");
                        print("\t ************************** ");
                    }
                    else if(total_price >= 300000)
                    {
                        
                        print("\t >> DISCOUNT IS 25% <<");
                        print("\t PAYBLE AMOUNT :-->${net_amount=(total_price*25)/100}");
                        print("\t ************************** ");
                    }
                    else
                    {
                        print("\n\t PAYBLE PRICE:-->${total_price=today_price*p_qty}");
                        print("\t ************************** ");
                    }
                }
                else
                {
                    print("\n\t >>>* THANKES FOR COMMING MY SHOP *<<<");
                }   
            }
            else
            {
                print("\n\t >> INVALIDE AGE <<");
                print("\n\t >>>* THANKES FOR COMMING MY SHOP *<<<");
            }
        }
        break;
        case 'f':
        {
            print("\n\t Enter Your AGE:-->");
            age=int.parse(stdin.readLineSync()!);         
            if(age >= 65)
            {
                print("\t\t-------------------------------");
                print("\t\t >>>* YOUR DISCOUNT AVABLE *<<<");
                print("\t\t-------------------------------");
                print("\t---------------------------------");
                print("\n\t 1 LK \t 2 LK \t 3 LK");
                print("\t  20% \t   30% \t 40%");
                print("\t---------------------------------");
                print("\n\t DO YOU WONT TO PURCHES 'Y'or'N'");
                yn=stdin.readLineSync()!;
                if( yn == 'y' || yn =='Y')
                {
                    print("\n\t HOW MENY PURCHES PRODECT:-->");
                    p_qty=double.parse(stdin.readLineSync()!);
                    print("\t ************************** ");
                    print("\t Totle Price:-->${total_price=today_price*p_qty}");

                    if(total_price >= 10000 && total_price <= 100000)
                    {
                        print("\t >> DISCOUNT IS 20% <<");
                        print("\t PAYBLE AMOUNT :-->${net_amount=(total_price*20)/100}");
                        print("\t ************************** ");
                    }
                    else if(total_price > 100000 && total_price < 300000)
                    {
                        print("\t >> DISCOUNT IS 30% <<");
                        print("\t PAYBLE AMOUNT :-->${net_amount=(total_price*30)/100}");
                        print("\t ************************** ");
                    }
                    else if(total_price >= 300000)
                    {
                        print("\t >> DISCOUNT IS 40% <<");
                        print("\t PAYBLE AMOUNT :-->${net_amount=(total_price*40)/100}");
                        print("\t ************************** ");
                    }
                    else
                    {
                        print("\t PAYBLE PRICE:-->${total_price=today_price*p_qty}");
                        print("\t ************************** ");
                    }
                }
            }
            else if(age >=0 && age < 65)
            {
                print("\n\t\t >>>* YOUR DISCOUNT AVABLE *<<<");
                print("\n\t 1 LK \t 2 LK \t 3 LK");
                print("\t  15% \t   25% \t 35%");
                print("\n\t DO YOU WONT TO PURCHES 'Y'or'N'");
                yn=stdin.readLineSync()!;
                if( yn == 'y' || yn =='Y')
                {
                    print("\n\t HOW MENY PURCHES PRODECT:-->");
                    p_qty=double.parse(stdin.readLineSync()!);
                    print("\t ************************** ");
                    print("\t Totle Price:-->${total_price=today_price*p_qty}");
                    if(total_price >= 10000 && total_price <= 100000)
                    {
                        
                        print("\t >> DISCOUNT IS 15% <<");
                        print("\t PAYBLE AMOUNT :-->${net_amount=(total_price*15)/100}");
                        print("\t ************************** ");
                    }
                    else if(total_price > 100000 && total_price < 300000)
                    {
                        print("\t >> DISCOUNT IS 25% <<");
                        print("\n\t PAYBLE AMOUNT :-->${net_amount=(total_price*25)/100}");
                        print("\t ************************** ");
                    }
                    else if(total_price >= 300000)
                    {
                        print("\t >> DISCOUNT IS 35% <<");
                        print("\t PAYBLE AMOUNT :-->${net_amount=(total_price*35)/100}");
                        print("\t ************************** ");
                    }
                    else
                    {
                        print("\t PAYBLE PRICE:-->${total_price=today_price*p_qty}");
                        print("\t ************************** ");
                    }
                }
                else
                {
                    print("\n\t >>>* THANKES FOR COMMING MY SHOP *<<<");
                }   
            }
            else
            {
                print("\n\t >> INVALIDE AGE <<");
                print("\n\t >>>* THANKES FOR COMMING MY SHOP *<<<");
            }
        }
        break;
    }
    print("\t ------------------------------------ ");
    print("\n\t >>>* THANKES FOR COMMING MY SHOP *<<<");
    print("\n\t ------------------------------------ ");
}