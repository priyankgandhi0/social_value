import '../generated/asset.dart';
import '../models/charity_card_model.dart';
import 'app_string.dart';

List<CharityCardModel> charityCard = [
  CharityCardModel(
    title: shelterText,
    desc: shelterDesc,
    image: ImageAssets.shelterImage,
    link: shelterLink,
  ),
  CharityCardModel(
    title: trussellText,
    desc: trussellDesc,
    image: ImageAssets.trusselImage,
    link: trussellLink,
  ),
  CharityCardModel(
    title: cysticText,
    desc: cysticDesc,
    image: ImageAssets.cfImage,
    link: cysticLink,
  ),
  CharityCardModel(
    title: teensUniteText,
    desc: teensUniteDesc,
    image: ImageAssets.teensUnitsImage,
    link: teensUniteLink,
  ),
];
