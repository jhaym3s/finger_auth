import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_developer_task/constant.dart';

class NextPage extends StatefulWidget {
  static const routeName = "/next_page";
  const NextPage({ Key? key }) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  bool switchValue = false;
  List<IconData> icons = [Icons.swap_horiz,Icons.arrow_upward_outlined,Icons.north_east,Icons.north,Icons.account_balance_wallet_outlined,Icons.timer];
  List<String> cardText= ["Swap Currency","Deposit money","Send money","Withdraw money","Pay your bills","Transaction history"];
  List<String> amountAndCurrency = ["680/€", "660/\$"];
  List<Color> textColors = [Color(0xFF27AE60),Color(0xFFE2B93B),];
  double amount = 10;
  Color switchColors(){
    if (switchValue){
      return Colors.white;
    }else return Colors.grey;
  }
  List<String> countries = ["GBP","EURO"];
  List<String> countryFlags = ["GB","EU"];
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:10,bottom:10),
                    child: Text("Hey Micheal \u{1f44B}",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
            Text("Welcome to SwapBeta, let's start swapping \nyour currencies.",style:TextStyle(color:Color(0xFF828282),fontSize: 16,height: 1.5) ,),

            Padding(
              padding: const EdgeInsets.only(top: 24,bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                   color: Colors.blue[800],
                   borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                height: 220,
                width: double.infinity,

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Wallet Balance \u{1f929}",style: TextStyle(fontSize: 18,color: Colors.white),),
                        Row(children: [
                          Text("NGN",style: TextStyle(fontSize:10,fontWeight:FontWeight.w400,color: switchValue?Colors.grey:Colors.white),),
                          Switch(onChanged: (value){
                              setState(() {
                                switchValue = value;
                              });
                          }, value: switchValue,
                          activeColor: Colors.blue,
                          activeTrackColor: Colors.green[100],
                          inactiveThumbColor: Colors.green,
                          inactiveTrackColor: Colors.blue[100],
                          dragStartBehavior: DragStartBehavior.down,
                          ),
                          Text("USD",style: TextStyle(color:switchColors(),fontSize:10,fontWeight:FontWeight.w400),),
                        ],)
                      ],),
                      RichText(
  text: TextSpan(
        text: "${!switchValue?"₦" "10,000" :"\$" "10,000"}",
        style: TextStyle(fontWeight: FontWeight.w700,fontSize:40,),
        children: const <TextSpan>[
          TextSpan(text: '.00', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20)),
        ],
  ),
),
        ElevatedButton(onPressed: (){}, child: Text("Fund my Wallet",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700),),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[900]),),)
        
]
                  ),
                )
              ),
            ),
            Container(
          height: 140,
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              //Container
              child: Container(
                width: 226.3,
                height: 140,
                decoration: BoxDecoration(
                  border:Border.all(width:1,color: Colors.grey[400]!),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    //Main
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:[
                          Row(
                            children: [
                              CircleAvatar(radius:15,backgroundColor:Colors.blue[100],child: Text(
                                countryFlags[index].toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
     (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397))
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(left:10),
                                child: Text(countries[index],style:TextStyle(color: Colors.black,fontWeight: FontWeight.w500,letterSpacing:1),),
                              ),
                            ],
                          ),
                        Row(
                          children:[
                            Text(amountAndCurrency[index],style:TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize:24),)
                          ]
                        ),
                       Text("+1.3%",style: TextStyle(color:textColors[index],fontWeight: FontWeight.w700,fontSize: 14),)
                         ]
                      ),
                      Image.asset(AssetsImages.graph)
                    ],
                  ),
                ),
              ),
              ),
               scrollDirection: Axis.horizontal,
            ),
        ),
           CustomGrid(),
            ],
        ),
      ),
    );
  }
}


class CustomGrid extends StatelessWidget {
   CustomGrid({ Key? key }) : super(key: key);


   List<IconData> icons = [Icons.swap_horiz,Icons.arrow_upward_outlined,Icons.north_east,Icons.north,Icons.account_balance_wallet_outlined,Icons.timer];
  List<String> cardText= ["Swap \nCurrency","Deposit \nmoney","Send \nmoney","Withdraw \nmoney","Pay your \nbills","Transaction \nhistory"];

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return  Container(
            height: 263.5,
            child: GridView.builder(
        shrinkWrap: false,
        itemCount: 6,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 93/96,
            crossAxisCount: 3,crossAxisSpacing: 5,mainAxisSpacing: 5,
        ),
        itemBuilder: ( context, index) {
            return GestureDetector(
              onTap: () {
              },
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      
    ),
                child: Container(
                  height: 20,
                  decoration: BoxDecoration(color: Colors.white,
                  border: Border.all(width: .2,color: Colors.blue),
                 borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          color: Colors.white,
                          child: Icon(icons[index],color: Colors.blue,)
                        ),
                        Text(cardText[index],style: TextStyle(color:Colors.black,fontSize: 12,fontWeight: FontWeight.w400),softWrap: true,)
                      ],
                    ),
                  ),
                ),
              ),
            );
        }),
          );
  }
}