class EventModel {
 int? id;
 String eventName;
 double price;
 String eventDescription;
 String date;
 String time;
 String address;
 String addressNumber;
 String addressComplement;
 String addressDistrict;
 int? userId;
 String eventType;


 Map<String, dynamic> toMap() {
  return {
   'id': id,
   'eventName': eventName,
   'price': price,
   'date': date,
   'eventDescription': eventDescription,
   'date': date,
   'time': time,
   'address': address,
   'addressNumber': addressNumber,
   'addressComplement': addressComplement,
   'addressDistrict': addressDistrict,
   'userId': userId,
   'eventType': eventType
  };
 }

 EventModel({
  required this.id,
  required this.eventName,
  required this.price,
  required this.eventDescription,
  required this.date,
  required this.time,
  required this.address,
  required this.addressNumber,
  required this.addressComplement,
  required this.addressDistrict,
  required this.userId,
  required this.eventType
 });


 factory EventModel.fromJson(Map<String, dynamic> json) {
  return EventModel(
      id: json['id'],
      eventName: json["eventName"],
      price: json["price"],
      date: json["date"],
      eventDescription: json["eventDescription"],
      time: json["time"],
      address: json["address"],
      addressNumber: json["addressNumber"],
      addressComplement: json["addressComplement"],
      addressDistrict: json["addressDistrict"],
      userId: json["userId"],
      eventType: json["eventType"]
  );
 }


}