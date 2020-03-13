// Challenge 1
// Longest Streak
// Create a function that takes an array of objects with date property and return the
// "longest streak" (i.e. number of consecutive days in a row).
//
// Example
// longestStreak([
//   {
//   "date": "2019-09-18"
//   },
//   {
//   "date": "2019-09-19"
//   },
//   {
//   "date": "2019-09-20"
//   },
//   {
//   "date": "2019-09-26"
//   },
//   {
//   "date": "2019-09-27"
//   },
//   {
//   "date": "2019-09-30"
//   }
// ]) ➞ 3


// Challenge 2
// This problem was asked by Microsoft.
//
// Given a dictionary as a list of words and a string made up of those words (no spaces),
// return the original sentence in a list. If there is more than one possible
// reconstruction, return any of them. If there is no possible reconstruction,
// then return null.
//
// For example, given the set of words 'quick', 'brown', 'the', 'fox', and the
// string "thequickbrownfox", you should return ['the', 'quick', 'brown', 'fox'].
//
// Given the set of words 'bed', 'bath', 'bedbath', 'and', 'beyond', and the
// string "bedbathandbeyond", return either ['bed', 'bath', 'and', 'beyond] or
// ['bedbath', 'and', 'beyond'].


int longestStreak(List<Map<String, String>> myList){
  int count = 0;
  int prevCount = 0;
  myList.sort((a, b) => (b["date"]).compareTo(a["date"]));
  List<Map<String, String>> newList = (myList.reversed.toList());
  print(newList);
  print(DateTime.parse("2019-09-18"));
  if(myList.isEmpty){
    return 0;
  }
  if(myList.length == 1) {
    return 1;
  }

  for(int i = 0; i< newList.length - 1; i++ ){
    print(DateTime.parse(newList[i]["date"]).difference(DateTime.parse(newList[i+1]["date"])));
   if( DateTime.parse(newList[i]["date"]).difference(DateTime.parse(newList[i+1]["date"])).toString() == "-24:00:00.000000"){

     count++;
   }
   else {
     if(count > prevCount){
       prevCount = count;
       count = 0;
     }
   }
  }
  print (prevCount+1);
  return prevCount+1;
}


List <String> reconstruction(List<String> words, String str ){

  if(str.isEmpty){
    return [];
  }
  for(int i=1; i<=str.length; i++){
    String testString=str.substring(0,i);

    if(words.contains(testString)){
      List<String> result = reconstruction(words, str.substring(i));
      if(result != null){
         result.add(testString);
         return result;
      }
    }
  }

  return null;

}



void main() {
  longestStreak([
    {
      "date": "2019-09-18"
    },
    {
      "date": "2019-09-19"
    },
    {
      "date": "2019-09-20"
    },
    {
      "date": "2019-09-26"
    },
    {
      "date": "2019-09-27"
    },
    {
      "date": "2019-09-30"
    }
  ]);

  print(reconstruction( ['quick', 'brown', 'the', 'fox'], "thequickbrownfox",));

}


