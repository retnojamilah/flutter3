class Data {
  String cid;
  String cnama;
  String calamat;
  String cemail;
  String cpekerjaan;
  String cquote;

  Data({
    required this.cid,
    required this.cnama,
    required this.calamat,
    required this.cemail,
    required this.cpekerjaan,
    required this.cquote
  });

  factory Data.fromJson(Map<String, dynamic>json ){
    return Data(
        cid: json['id'],
        cnama: json['nama'],
        calamat: json['alamat'],
        cemail: json['email'],
        cpekerjaan: json ['pekerjaan'],
        cquote: json['quote']);
  }

}