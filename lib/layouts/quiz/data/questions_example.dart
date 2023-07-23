

import '../model/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    "There are ___ levels of heading in HTML ?",
    {
      "Three": false,
      "Four": false,
      "Five": false,
      "Six": true,
    },
  ),
  QuestionModel("The decimal range of network address for class B network is between ?", {
    "127-190": false,
    "128-190": false,
    "128-191": true,
    "None of the above": false,
  }),
  QuestionModel("What is the Full Form of the SPX ?", {
    "Sequenced Packet Exchange": true,
    "Sequence Packet Exchange": false,
    "Sequenced Packets Exchange": false,
    "None of the above": false,
  }),
  QuestionModel("The Full form Of the MIME is :", {
    "Multipurpose Internet Mail Extensions": true,
    "Multiple Internet Mail Extensions": false,
    "Multiple Internet Mails Extensions": false,
    "None of the above": false,
  }),
  QuestionModel("The Major components of the Web browser are ?", {
    "Menu bar": false,
    "Toolbar": false,
    "Location": false,
    "All of the Above": true,
  }),

];
