enum days{
  Sunday,
  Monday,
  Tuesday,
  wednesday,
  thursday,
  Friday,
  Saturday
}
void main(){
  var today =days.Saturday;
  switch (today){
    case days.Sunday:
      print("Today is sunday");
    case days.Monday:
      print("Today is Monday");

    case days.Tuesday:
      print("Today is Tuesday");
    case days.wednesday:
      print("Today is Wednesday");

    case days.thursday:
     print("Today is Thursday");
    case days.Friday:
      print("Today is Friday");

    case days.Saturday:
      print("Today is Saturday");

  }
}