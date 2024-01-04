// To parse this JSON data, do
//
//     final annonceurModel = annonceurModelFromJson(jsonString);

import 'dart:convert';

AnnonceurModel annonceurModelFromJson(String str) =>
    AnnonceurModel.fromJson(json.decode(str));

String annonceurModelToJson(AnnonceurModel data) => json.encode(data.toJson());

class AnnonceurModel {
  String? accessToken;
  String? tokenType;
  Annonceur? annonceur;

  AnnonceurModel({
    this.accessToken,
    this.tokenType,
    this.annonceur,
  });

  factory AnnonceurModel.fromJson(Map<String, dynamic> json) => AnnonceurModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        annonceur: json["annonceur"] == null
            ? null
            : Annonceur.fromJson(json["annonceur"]),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "annonceur": annonceur?.toJson(),
      };
}

class Annonceur {
  int? id;
  String? nomPrenoms;
  String? phone1;
  String? phone2;
  String? sexe;
  int? parrain;
  dynamic quartierId;
  dynamic communeId;
  dynamic userId;
  int? statutGeneriqueId;
  String? createdBy;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Annonceur({
    this.id,
    this.nomPrenoms,
    this.phone1,
    this.phone2,
    this.sexe,
    this.parrain,
    this.quartierId,
    this.communeId,
    this.userId,
    this.statutGeneriqueId,
    this.createdBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Annonceur.fromJson(Map<String, dynamic> json) => Annonceur(
        id: json["id"],
        nomPrenoms: json["nom_prenoms"],
        phone1: json["phone1"],
        phone2: json["phone2"],
        sexe: json["sexe"],
        parrain: json["parrain"],
        quartierId: json["quartier_id"],
        communeId: json["commune_id"],
        userId: json["user_id"],
        statutGeneriqueId: json["statut_generique_id"],
        createdBy: json["created_by"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nom_prenoms": nomPrenoms,
        "phone1": phone1,
        "phone2": phone2,
        "sexe": sexe,
        "parrain": parrain,
        "quartier_id": quartierId,
        "commune_id": communeId,
        "user_id": userId,
        "statut_generique_id": statutGeneriqueId,
        "created_by": createdBy,
        "deleted_at": deletedAt,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
