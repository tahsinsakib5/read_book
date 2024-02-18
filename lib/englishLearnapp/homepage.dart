import 'package:flutter/material.dart';
import 'package:testprovider/englishLearnapp/data.dart';
import 'package:testprovider/englishLearnapp/readpage.dart';
import 'package:testprovider/englishLearnapp/secondpage.dart';
import 'package:testprovider/secondhomepage.dart';

class HomePageReadBook extends StatefulWidget {
  const HomePageReadBook({super.key});

  @override
  State<HomePageReadBook> createState() => _HomePageReadBookState();
}

class _HomePageReadBookState extends State<HomePageReadBook> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       
        appBar: AppBar(backgroundColor: Colors.pink,title:Text("Read English"),),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Akbar Story",style: TextStyle(fontSize:20),),

                    MaterialButton(onPressed: () {
                      
                    },child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 221, 221),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                        child: Text("See All"),
                      ),
                    ),)
                  ],
                ),
          
           Container(
            height:180,
             child: ListView.builder(scrollDirection:Axis.horizontal,shrinkWrap: true,itemCount:6,itemBuilder: (context, index) {
               return   InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Secondpagepageread(allstory: allstory)));
                },
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     
                              
                     child: Image.asset("assets/molla.jpg",fit: BoxFit.cover,),
                    ),
                 ),
               );
             },),
           ),
          
           
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Akbar Story",style: TextStyle(fontSize:18,fontWeight: FontWeight.w500),),

                    MaterialButton(onPressed: () {
                      
                    },child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 221, 221),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                        child: Text("See All"),
                      ),
                    ),)
                  ],
                ),
          
          
            Container(
            height: 200,
            
             child: ListView.builder(scrollDirection:Axis.horizontal,shrinkWrap: true,itemCount:6,itemBuilder: (context, index) {
               return 
                  
                   Column(
                     children: [
                       InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ReadPage(story: allstory[index]),));
                        },
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             height: 160,
                             
                                      
                             child: Image.asset("assets/story.jpg",fit: BoxFit.cover,),
                            ),
                         ),
                                 
                        
                       ),
                     
          
                   Text("Mulla Nasiruddin",style: TextStyle(fontWeight: FontWeight.w500),)
                 ],
               );
             },),
           ),
            
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Akbar Story",style: TextStyle(fontSize:18,fontWeight: FontWeight.w500),),

                    MaterialButton(onPressed: () {
                      
                    },child: Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 222, 221, 221),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                        child: Text("See All"),
                      ),
                    ),)
                  ],
                ),
          
          
             
          
            Container(
            height: 200,
             child: ListView.builder(scrollDirection:Axis.horizontal,shrinkWrap: true,itemCount:6,itemBuilder: (context, index) {
               return   InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReadPage(story: allstory[index]),));
                },
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         height: 150,
                                  
                         child: Image.asset("assets/akbar.jpg",fit: BoxFit.cover,),
                        ),
                     ),
                     Text("Akbar Birbal",style: TextStyle(fontWeight: FontWeight.w500),)
                   ],
                 ),
               );
             },),
           ),
                
           
            ],
          ),
        ),
      ),
    );
  }
}