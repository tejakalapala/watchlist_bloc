import 'package:flutter/material.dart';

class SelectSort extends StatefulWidget {
   const SelectSort(this.sendSortIndex, {super.key});
  final Function sendSortIndex;
  @override
  State<SelectSort> createState() => _SelectSortState();
}

class _SelectSortState extends State<SelectSort> {
  
  int sortIndex = 0;

  void _onDonePressed(){
    widget.sendSortIndex(sortIndex);
    Navigator.of(context).pop();
    
  }
  
  @override
  Widget build(BuildContext context) {
    
    return   Container(
          height: 250,
          padding: EdgeInsets.only(
                    top: 10,
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 10             
                     ),
                     
          child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                            Text("Sorting",style: Theme.of(context).textTheme.bodyLarge,),
                          TextButton(onPressed: (){
                            _onDonePressed();
                          }, child: const Text("Done",style: TextStyle(color: Colors.blue),))
                        ],
                      ),
                      
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Alphabetically"),
                          TextButton(onPressed: (){
                            setState(() {
                              sortIndex = 1;
                            });
                          }, 
                          child:  richText("A","Z",1)
                          ),
                          TextButton(onPressed: (){
                            setState(() {
                              sortIndex = 2;
                            });
                          }, 
                          child: richText("Z", "A",2)
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("UserId"),
                          TextButton(onPressed: (){
                            setState(() {
                              sortIndex = 3;
                            });
                          },
                          child:  Padding(
                            padding: const EdgeInsets.only(left:40.0),
                            child: richText("0", "9",3),
                          )
                         ),
                          TextButton(onPressed: (){
                            setState(() {
                              sortIndex = 4;
                            });
                          }, child:  
                          richText("9", "0",4)
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey,)
                  ],
                ),
        );
  }

  RichText richText(String first,String second,int index) {
    return RichText(
                          text:  TextSpan(
                            children: [
                               TextSpan(
                                text: first,
                                style: TextStyle(color:(sortIndex == index) ?Colors.blue: Theme.of(context).textTheme.bodySmall!.color)
                               ),
          
                               WidgetSpan(
              child: Icon(Icons.arrow_downward,color: (sortIndex == index) ?Colors.blue: Theme.of(context).textTheme.labelMedium!.color, size: 14),
          
          ),
          TextSpan(
            text: second,
            style: TextStyle(color:(sortIndex == index) ?Colors.blue:Theme.of(context).textTheme.bodySmall!.color)
          ),
                            ]
                          )
                        );
  }
}