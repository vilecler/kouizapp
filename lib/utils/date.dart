

// 2022-05-15T12:29:22.097Z
// 2002-02-27T19:00:00Z
DateTime? isoDateToDateTime(String? isoDate){
  if(isoDate == null || isoDate == 'null'){
    return null;
  }

  String date = isoDate.substring(0, isoDate.length - 13);
  date = date + 'Z';
  return DateTime.parse(date);
}