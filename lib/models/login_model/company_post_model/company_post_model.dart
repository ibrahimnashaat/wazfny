
class PostModel {
  String? title;
  String? requirements;
  String? description;
  String? email;
  String? image;
  String? uId;



  PostModel({
    required this.title,
    required this.email,
    required this.uId,
    required this.image,
    required this.description,
    required this.requirements,

  });

  PostModel.fromJson(Map<String ,dynamic > json){

    title = json['title'];
    email = json['email'];
    uId = json['uId'];
    image = json['image'];
    description = json['description'];
    requirements = json['requirements'];


  }

  Map<String, dynamic>  toMap (){

    return {
      'title' : title,
      'email' : email,
      'uId' : uId,
      'image':image,
      'description':description,
      'requirements':requirements,

    };

  }
}
