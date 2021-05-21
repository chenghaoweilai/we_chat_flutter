class Chat{
  final String name;
  final String message;
  final String imageUrl;

  Chat(this.name, this.message, this.imageUrl);

  factory Chat.formJson(Map json){
    return Chat(json['name'], json['message'], json['imageUrl']);
  }

}


