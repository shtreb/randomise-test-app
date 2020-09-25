class Friend {
  String gender;
  Name name;
  Location location;
  String email;
  Login login;
  CustomDate dob;
  CustomDate registered;
  String phone;
  String cell;
  ID id;
  String nat;

  Friend({
    String gender,
    Name name,
    Location location,
    String email,
    Login login,
    CustomDate dob,
    CustomDate registered,
    String phone,
    String cell,
    ID id,
    String nat,
  }) :
      gender = gender ?? '',
      name = name ?? Name(),
      location = location ?? Location(),
      email = email ?? '',
      login = login ?? Login(),
      dob = dob ?? CustomDate(),
      registered = registered ?? CustomDate(),
      phone = phone ?? '',
      cell = cell ?? '',
      id = id ?? ID(),
      nat = nat ?? '';

  static Friend fromJson(_json) {
    if(_json == null) return null;
    return Friend(
      gender: _json['gender'],
      name: Name.fromJson(_json['name']),
      location: Location.fromJson(_json['location']),
      email: _json['email'],
      login: Login.fromJson(_json['login']),
      dob: CustomDate.fromJson(_json['dob']),
      registered: CustomDate.fromJson(_json['registered']),
      phone: _json['phone'],
      cell: _json['cell'],
      id: ID.fromJson(_json['id']),
      nat: _json['nat']
    );
  }

  static List<Friend> fromListJson(_json) {
    if(!(_json is List)) return [];
    return (_json as List).map((e) => Friend.fromJson(e)).toList();
  }
}

class Name {
  String name;
  String first;
  String last;

  Name({
    String name,
    String first,
    String last
  }) :
      name = name ?? '',
      first = first ?? '',
      last = last ?? '';

  static Name fromJson(_json) {
    if(_json == null) return Name();
    return Name(
      name: _json['name'],
      first: _json['first'],
      last: _json['last']
    );
  }
}

class Location {

  Street street;
  String city;
  String state;
  String country;
  num postCode;
  Coordinates coordinates;
  TimeZone timeZone;

  Location({
    Street street,
    String city,
    String state,
    String country,
    num postCode,
    Coordinates coordinates,
    TimeZone timeZone
  }) :
      street = street ?? Street(),
      city = city ?? '',
      state = state ?? '',
      country = country ?? '',
      postCode = postCode ?? 0,
      coordinates = coordinates ?? Coordinates(),
      timeZone = timeZone ?? '';

  static Location fromJson(_json) {
    if(_json == null) return Location();
    return Location(
      street: Street.fromJson(_json['street']),
      city: _json['city'],
      state: _json['state'],
      country: _json['country'],
      postCode: _json['postCode'],
      coordinates: Coordinates.fromJson(_json['coordinates']),
      timeZone: TimeZone.fromJson(_json['timeZone']),
    );
  }

}

class Street {
  num number;
  String name;

  Street({
    num number,
    String name
  }) :
      number = number ?? 0,
      name = name ?? '';

  static Street fromJson(_json) {
    if(_json == null) return Street();
    return Street(
      number: _json['number'],
      name: _json['name']
    );
  }
}

class Coordinates {
  String latitude;
  String longitude;

  Coordinates({
    String latitude,
    String longitude,
  }) :
      latitude = latitude ?? '.0',
      longitude = longitude ?? '.0';

  static Coordinates fromJson(_json) {
    if(_json == null) return Coordinates();
    return Coordinates(
      latitude: _json['latitude'],
      longitude: _json['longitude']
    );
  }
}

class TimeZone {
  String offset;
  String description;

  TimeZone({
    String offset,
    String description
  }) :
      offset = offset ?? '',
      description = description ?? '';

  static TimeZone fromJson(_json) {
    if(_json == null) return TimeZone();
    return TimeZone(
      offset: _json['offset'],
      description: _json['description'],
    );
  }
}

class Login {
  String uuid;
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  Login({
    String uuid,
    String username,
    String password,
    String salt,
    String md5,
    String sha1,
    String sha256
  }) :
      uuid = uuid ?? '',
      username = username ?? '',
      password = password ?? '',
      salt = salt ?? '',
      md5 = md5 ?? '',
      sha1 = sha1 ?? '',
      sha256 = sha256 ?? '';

  static fromJson(_json) {
    if(_json == null) return Login();
    return Login(
      uuid: _json['uuid'],
      username: _json['username'],
      password: _json['password'],
      salt: _json['password'],
      md5: _json['md5'],
      sha1: _json['sha1'],
      sha256: _json['sha256']
    );
  }

}

class CustomDate {
  String date;
  num age;

  CustomDate({
    String date,
    num age,
  }) :
      date = date ?? '',
      age = age ?? 0;

  static fromJson(_json) {
    if(_json == null) return CustomDate();
    return CustomDate(
      date: _json['date'],
      age: _json['age']
    );
  }
}

class ID {
  String name;
  String value;

  ID({
    String name,
    String value
  }) :
      name = name ?? '',
      value = value ?? '';

  static ID fromJson(_json) {
    if(_json == null) return ID();
    return ID(
      name: _json['name'],
      value: _json['value']
    );
  }
}

class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture({
    String large,
    String medium,
    String thumbnail
  }) :
      large = large ?? '',
      medium = medium ?? '',
      thumbnail = thumbnail ?? '';

  static Picture fromJson(_json) {
    if(_json == null) return Picture();
    return Picture(
      large: _json['large'],
      medium: _json['medium'],
      thumbnail: _json['thumbnail']
    );
  }
}
