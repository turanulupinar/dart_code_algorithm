//Dart 2.0

extension MyExtension on String {
  String addMerhaba() {
    return "Merhaba $this";
  }
}

extension NumberToName on int {
  String get numberToName {
    switch (this) {
      case 1:
        return "Bir";
      case 2:
        return "İki";
      case 3:
        return "Üç";
      case 4:
        return "Dört";
      case 5:
        return "Beş";
      default:
        return "Sayının karşılığı yok";
    }
  }
}

// enum tipi bir status değerini tutmak için kullanılır genelde

enum Status { error, loading, success }

extension StatusExtension on Status {
  String translateStatus(String local) {
    if (local == "tr") {
      switch (this) {
        case Status.error:
          return "Hata oluştu!";

        case Status.loading:
          return "Yükleniyor!";
        case Status.success:
          return "İşlem başarılı!";
        default:
          return "Sonuç yok";
      }
    } else if (local == "en") {
      switch (this) {
        case Status.error:
          return "Error Occured!";

        case Status.loading:
          return "Loading!";
        case Status.success:
          return "Connection Succesfully!";
        default:
          return "No result";
      }
    } else {
      return "Dil desteklenmiyor";
    }
  }
}

class Connection {
  final String status;
  Connection(this.status);

  @override
  String toString() => 'status: $status';
}
