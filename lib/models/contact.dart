class Contact{
  String? id,name,number,img;
  Contact({  this.id,
   this.name,
   this.number,
   this.img
  });
  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['Contacts'];
    img = json['url'];
  }
}