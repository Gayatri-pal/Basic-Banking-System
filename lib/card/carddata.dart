import 'package:bankingapp/card/constants.dart';
class CardData {
  final int id;
  final String cardNumber;
  final String cardHolderName;
  final String cardExpiryDate;
  final String avatar;
  final myGradient;

  CardData(
      {
      this.id,
      this.cardNumber,
      this.cardHolderName,
      this.cardExpiryDate,
      this.avatar,
      this.myGradient});

  static List<CardData> cardDataList = [
    CardData(
      id: 0,
      cardNumber: "7418 5236 9854 4152",
      cardHolderName: "MS Dhoni",
      cardExpiryDate: "10/22",
      avatar: "MD",
      myGradient: Gradient0,
    ),
    CardData(
      id: 1,
      cardNumber: "7412 6665 1147 1258",
      cardHolderName: "MD Siraj",
      cardExpiryDate: "10/22",
      avatar: "MS",
      myGradient: Gradient1,
    ),
    CardData(
      id: 2,
      cardNumber: "7894 1258 7412 7896",
      cardHolderName: "Subhman Gill",
      cardExpiryDate: "10/22",
      avatar: "SG",
      myGradient: Gradient2,
    ),
    CardData(
      id: 3,
      cardNumber: "7894 1258 7412 7896",
      cardHolderName: "Rohit Sharma",
      cardExpiryDate: "10/22",
      avatar: "RS",
      myGradient: Gradient3,
    ),
    CardData(
      id: 4,
      cardNumber: "7894 1258 7412 7896",
      cardHolderName: "Mitali Raj",
      cardExpiryDate: "10/22",
      avatar: "MR",
      myGradient: Gradient4,
    ),
    CardData(
      id: 5,
      cardNumber: "7894 1258 7412 7896",
      cardHolderName: "Rishab Pant",
      cardExpiryDate: "10/22",
      avatar: "RP",
      myGradient: Gradient5,
    ),
    CardData(
      id: 6,
      cardNumber: "7894 1258 7412 7896",
      cardHolderName: "Virat",
      cardExpiryDate: "10/22",
      avatar: "VK",
      myGradient: Gradient6,
    ),
    CardData(
      id: 7,
      cardNumber: "7894 1258 7412 7896",
      cardHolderName: "Morgan",
      cardExpiryDate: "10/22",
      avatar: "M",
      myGradient: Gradient7,
    ),
    CardData(
        id: 8,
        cardNumber: "7894 1258 7412 7896",
        cardHolderName: "Bear Grylls",
        cardExpiryDate: "10/22",
        avatar: "BG",
        myGradient: Gradient8),
    CardData(
        id: 9,
        cardNumber: "7894 1258 7412 7896",
        cardHolderName: "Pat",
        cardExpiryDate: "10/22",
        avatar: "PC",
        myGradient: Gradient9),
  ];
}