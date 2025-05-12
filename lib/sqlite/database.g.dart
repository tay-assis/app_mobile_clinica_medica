// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AddressesTable extends Addresses
    with TableInfo<$AddressesTable, Address> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AddressesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _streetMeta = const VerificationMeta('street');
  @override
  late final GeneratedColumn<String> street = GeneratedColumn<String>(
    'street',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _neighborhoodMeta = const VerificationMeta(
    'neighborhood',
  );
  @override
  late final GeneratedColumn<String> neighborhood = GeneratedColumn<String>(
    'neighborhood',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
    'city',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stateMeta = const VerificationMeta('state');
  @override
  late final GeneratedColumn<String> state = GeneratedColumn<String>(
    'state',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 2,
      maxTextLength: 2,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _zipCodeMeta = const VerificationMeta(
    'zipCode',
  );
  @override
  late final GeneratedColumn<int> zipCode = GeneratedColumn<int>(
    'zip_code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    street,
    neighborhood,
    city,
    state,
    zipCode,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'addresses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Address> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('street')) {
      context.handle(
        _streetMeta,
        street.isAcceptableOrUnknown(data['street']!, _streetMeta),
      );
    } else if (isInserting) {
      context.missing(_streetMeta);
    }
    if (data.containsKey('neighborhood')) {
      context.handle(
        _neighborhoodMeta,
        neighborhood.isAcceptableOrUnknown(
          data['neighborhood']!,
          _neighborhoodMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_neighborhoodMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
        _cityMeta,
        city.isAcceptableOrUnknown(data['city']!, _cityMeta),
      );
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    if (data.containsKey('state')) {
      context.handle(
        _stateMeta,
        state.isAcceptableOrUnknown(data['state']!, _stateMeta),
      );
    } else if (isInserting) {
      context.missing(_stateMeta);
    }
    if (data.containsKey('zip_code')) {
      context.handle(
        _zipCodeMeta,
        zipCode.isAcceptableOrUnknown(data['zip_code']!, _zipCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_zipCodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Address map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Address(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      street:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}street'],
          )!,
      neighborhood:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}neighborhood'],
          )!,
      city:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}city'],
          )!,
      state:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}state'],
          )!,
      zipCode:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}zip_code'],
          )!,
    );
  }

  @override
  $AddressesTable createAlias(String alias) {
    return $AddressesTable(attachedDatabase, alias);
  }
}

class Address extends DataClass implements Insertable<Address> {
  final int id;
  final String street;
  final String neighborhood;
  final String city;
  final String state;
  final int zipCode;
  const Address({
    required this.id,
    required this.street,
    required this.neighborhood,
    required this.city,
    required this.state,
    required this.zipCode,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['street'] = Variable<String>(street);
    map['neighborhood'] = Variable<String>(neighborhood);
    map['city'] = Variable<String>(city);
    map['state'] = Variable<String>(state);
    map['zip_code'] = Variable<int>(zipCode);
    return map;
  }

  AddressesCompanion toCompanion(bool nullToAbsent) {
    return AddressesCompanion(
      id: Value(id),
      street: Value(street),
      neighborhood: Value(neighborhood),
      city: Value(city),
      state: Value(state),
      zipCode: Value(zipCode),
    );
  }

  factory Address.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Address(
      id: serializer.fromJson<int>(json['id']),
      street: serializer.fromJson<String>(json['street']),
      neighborhood: serializer.fromJson<String>(json['neighborhood']),
      city: serializer.fromJson<String>(json['city']),
      state: serializer.fromJson<String>(json['state']),
      zipCode: serializer.fromJson<int>(json['zipCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'street': serializer.toJson<String>(street),
      'neighborhood': serializer.toJson<String>(neighborhood),
      'city': serializer.toJson<String>(city),
      'state': serializer.toJson<String>(state),
      'zipCode': serializer.toJson<int>(zipCode),
    };
  }

  Address copyWith({
    int? id,
    String? street,
    String? neighborhood,
    String? city,
    String? state,
    int? zipCode,
  }) => Address(
    id: id ?? this.id,
    street: street ?? this.street,
    neighborhood: neighborhood ?? this.neighborhood,
    city: city ?? this.city,
    state: state ?? this.state,
    zipCode: zipCode ?? this.zipCode,
  );
  Address copyWithCompanion(AddressesCompanion data) {
    return Address(
      id: data.id.present ? data.id.value : this.id,
      street: data.street.present ? data.street.value : this.street,
      neighborhood:
          data.neighborhood.present
              ? data.neighborhood.value
              : this.neighborhood,
      city: data.city.present ? data.city.value : this.city,
      state: data.state.present ? data.state.value : this.state,
      zipCode: data.zipCode.present ? data.zipCode.value : this.zipCode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Address(')
          ..write('id: $id, ')
          ..write('street: $street, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('zipCode: $zipCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, street, neighborhood, city, state, zipCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Address &&
          other.id == this.id &&
          other.street == this.street &&
          other.neighborhood == this.neighborhood &&
          other.city == this.city &&
          other.state == this.state &&
          other.zipCode == this.zipCode);
}

class AddressesCompanion extends UpdateCompanion<Address> {
  final Value<int> id;
  final Value<String> street;
  final Value<String> neighborhood;
  final Value<String> city;
  final Value<String> state;
  final Value<int> zipCode;
  const AddressesCompanion({
    this.id = const Value.absent(),
    this.street = const Value.absent(),
    this.neighborhood = const Value.absent(),
    this.city = const Value.absent(),
    this.state = const Value.absent(),
    this.zipCode = const Value.absent(),
  });
  AddressesCompanion.insert({
    this.id = const Value.absent(),
    required String street,
    required String neighborhood,
    required String city,
    required String state,
    required int zipCode,
  }) : street = Value(street),
       neighborhood = Value(neighborhood),
       city = Value(city),
       state = Value(state),
       zipCode = Value(zipCode);
  static Insertable<Address> custom({
    Expression<int>? id,
    Expression<String>? street,
    Expression<String>? neighborhood,
    Expression<String>? city,
    Expression<String>? state,
    Expression<int>? zipCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (street != null) 'street': street,
      if (neighborhood != null) 'neighborhood': neighborhood,
      if (city != null) 'city': city,
      if (state != null) 'state': state,
      if (zipCode != null) 'zip_code': zipCode,
    });
  }

  AddressesCompanion copyWith({
    Value<int>? id,
    Value<String>? street,
    Value<String>? neighborhood,
    Value<String>? city,
    Value<String>? state,
    Value<int>? zipCode,
  }) {
    return AddressesCompanion(
      id: id ?? this.id,
      street: street ?? this.street,
      neighborhood: neighborhood ?? this.neighborhood,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (street.present) {
      map['street'] = Variable<String>(street.value);
    }
    if (neighborhood.present) {
      map['neighborhood'] = Variable<String>(neighborhood.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (state.present) {
      map['state'] = Variable<String>(state.value);
    }
    if (zipCode.present) {
      map['zip_code'] = Variable<int>(zipCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AddressesCompanion(')
          ..write('id: $id, ')
          ..write('street: $street, ')
          ..write('neighborhood: $neighborhood, ')
          ..write('city: $city, ')
          ..write('state: $state, ')
          ..write('zipCode: $zipCode')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _firebaseUidMeta = const VerificationMeta(
    'firebaseUid',
  );
  @override
  late final GeneratedColumn<String> firebaseUid = GeneratedColumn<String>(
    'firebase_uid',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'NOT NULL CHECK(type IN (\'PATIENT\', \'CLINIC\'))',
  );
  @override
  List<GeneratedColumn> get $columns => [id, email, firebaseUid, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('firebase_uid')) {
      context.handle(
        _firebaseUidMeta,
        firebaseUid.isAcceptableOrUnknown(
          data['firebase_uid']!,
          _firebaseUidMeta,
        ),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      firebaseUid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}firebase_uid'],
      ),
      type:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}type'],
          )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String email;
  final String? firebaseUid;
  final String type;
  const User({
    required this.id,
    required this.email,
    this.firebaseUid,
    required this.type,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || firebaseUid != null) {
      map['firebase_uid'] = Variable<String>(firebaseUid);
    }
    map['type'] = Variable<String>(type);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      email: Value(email),
      firebaseUid:
          firebaseUid == null && nullToAbsent
              ? const Value.absent()
              : Value(firebaseUid),
      type: Value(type),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
      firebaseUid: serializer.fromJson<String?>(json['firebaseUid']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
      'firebaseUid': serializer.toJson<String?>(firebaseUid),
      'type': serializer.toJson<String>(type),
    };
  }

  User copyWith({
    int? id,
    String? email,
    Value<String?> firebaseUid = const Value.absent(),
    String? type,
  }) => User(
    id: id ?? this.id,
    email: email ?? this.email,
    firebaseUid: firebaseUid.present ? firebaseUid.value : this.firebaseUid,
    type: type ?? this.type,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      email: data.email.present ? data.email.value : this.email,
      firebaseUid:
          data.firebaseUid.present ? data.firebaseUid.value : this.firebaseUid,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, email, firebaseUid, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.email == this.email &&
          other.firebaseUid == this.firebaseUid &&
          other.type == this.type);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> email;
  final Value<String?> firebaseUid;
  final Value<String> type;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
    this.firebaseUid = const Value.absent(),
    this.type = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String email,
    this.firebaseUid = const Value.absent(),
    required String type,
  }) : email = Value(email),
       type = Value(type);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? email,
    Expression<String>? firebaseUid,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
      if (firebaseUid != null) 'firebase_uid': firebaseUid,
      if (type != null) 'type': type,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? email,
    Value<String?>? firebaseUid,
    Value<String>? type,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
      firebaseUid: firebaseUid ?? this.firebaseUid,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (firebaseUid.present) {
      map['firebase_uid'] = Variable<String>(firebaseUid.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('email: $email, ')
          ..write('firebaseUid: $firebaseUid, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $ClinicsTable extends Clinics with TableInfo<$ClinicsTable, Clinic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClinicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _addressIdMeta = const VerificationMeta(
    'addressId',
  );
  @override
  late final GeneratedColumn<int> addressId = GeneratedColumn<int>(
    'address_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES addresses (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<int> phone = GeneratedColumn<int>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    addressId,
    name,
    phone,
    imageUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clinics';
  @override
  VerificationContext validateIntegrity(
    Insertable<Clinic> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('address_id')) {
      context.handle(
        _addressIdMeta,
        addressId.isAcceptableOrUnknown(data['address_id']!, _addressIdMeta),
      );
    } else if (isInserting) {
      context.missing(_addressIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Clinic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Clinic(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}user_id'],
          )!,
      addressId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}address_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      phone:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}phone'],
          )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
    );
  }

  @override
  $ClinicsTable createAlias(String alias) {
    return $ClinicsTable(attachedDatabase, alias);
  }
}

class Clinic extends DataClass implements Insertable<Clinic> {
  final int id;
  final int userId;
  final int addressId;
  final String name;
  final int phone;
  final String? imageUrl;
  const Clinic({
    required this.id,
    required this.userId,
    required this.addressId,
    required this.name,
    required this.phone,
    this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['address_id'] = Variable<int>(addressId);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<int>(phone);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  ClinicsCompanion toCompanion(bool nullToAbsent) {
    return ClinicsCompanion(
      id: Value(id),
      userId: Value(userId),
      addressId: Value(addressId),
      name: Value(name),
      phone: Value(phone),
      imageUrl:
          imageUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(imageUrl),
    );
  }

  factory Clinic.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Clinic(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      addressId: serializer.fromJson<int>(json['addressId']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<int>(json['phone']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'addressId': serializer.toJson<int>(addressId),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<int>(phone),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  Clinic copyWith({
    int? id,
    int? userId,
    int? addressId,
    String? name,
    int? phone,
    Value<String?> imageUrl = const Value.absent(),
  }) => Clinic(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    addressId: addressId ?? this.addressId,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
  );
  Clinic copyWithCompanion(ClinicsCompanion data) {
    return Clinic(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      addressId: data.addressId.present ? data.addressId.value : this.addressId,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Clinic(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('addressId: $addressId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, addressId, name, phone, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Clinic &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.addressId == this.addressId &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.imageUrl == this.imageUrl);
}

class ClinicsCompanion extends UpdateCompanion<Clinic> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> addressId;
  final Value<String> name;
  final Value<int> phone;
  final Value<String?> imageUrl;
  const ClinicsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.addressId = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  ClinicsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int addressId,
    required String name,
    required int phone,
    this.imageUrl = const Value.absent(),
  }) : userId = Value(userId),
       addressId = Value(addressId),
       name = Value(name),
       phone = Value(phone);
  static Insertable<Clinic> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? addressId,
    Expression<String>? name,
    Expression<int>? phone,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (addressId != null) 'address_id': addressId,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  ClinicsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? addressId,
    Value<String>? name,
    Value<int>? phone,
    Value<String?>? imageUrl,
  }) {
    return ClinicsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      addressId: addressId ?? this.addressId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (addressId.present) {
      map['address_id'] = Variable<int>(addressId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<int>(phone.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClinicsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('addressId: $addressId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $DoctorsTable extends Doctors with TableInfo<$DoctorsTable, Doctor> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoctorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _crmMeta = const VerificationMeta('crm');
  @override
  late final GeneratedColumn<int> crm = GeneratedColumn<int>(
    'crm',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _clinicIdMeta = const VerificationMeta(
    'clinicId',
  );
  @override
  late final GeneratedColumn<int> clinicId = GeneratedColumn<int>(
    'clinic_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES clinics (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<int> phone = GeneratedColumn<int>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _specialtyMeta = const VerificationMeta(
    'specialty',
  );
  @override
  late final GeneratedColumn<String> specialty = GeneratedColumn<String>(
    'specialty',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    crm,
    clinicId,
    name,
    phone,
    specialty,
    imageUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'doctors';
  @override
  VerificationContext validateIntegrity(
    Insertable<Doctor> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('crm')) {
      context.handle(
        _crmMeta,
        crm.isAcceptableOrUnknown(data['crm']!, _crmMeta),
      );
    } else if (isInserting) {
      context.missing(_crmMeta);
    }
    if (data.containsKey('clinic_id')) {
      context.handle(
        _clinicIdMeta,
        clinicId.isAcceptableOrUnknown(data['clinic_id']!, _clinicIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clinicIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('specialty')) {
      context.handle(
        _specialtyMeta,
        specialty.isAcceptableOrUnknown(data['specialty']!, _specialtyMeta),
      );
    } else if (isInserting) {
      context.missing(_specialtyMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Doctor map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Doctor(
      crm:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}crm'],
          )!,
      clinicId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}clinic_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      phone:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}phone'],
          )!,
      specialty:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}specialty'],
          )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
    );
  }

  @override
  $DoctorsTable createAlias(String alias) {
    return $DoctorsTable(attachedDatabase, alias);
  }
}

class Doctor extends DataClass implements Insertable<Doctor> {
  final int crm;
  final int clinicId;
  final String name;
  final int phone;
  final String specialty;
  final String? imageUrl;
  const Doctor({
    required this.crm,
    required this.clinicId,
    required this.name,
    required this.phone,
    required this.specialty,
    this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['crm'] = Variable<int>(crm);
    map['clinic_id'] = Variable<int>(clinicId);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<int>(phone);
    map['specialty'] = Variable<String>(specialty);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  DoctorsCompanion toCompanion(bool nullToAbsent) {
    return DoctorsCompanion(
      crm: Value(crm),
      clinicId: Value(clinicId),
      name: Value(name),
      phone: Value(phone),
      specialty: Value(specialty),
      imageUrl:
          imageUrl == null && nullToAbsent
              ? const Value.absent()
              : Value(imageUrl),
    );
  }

  factory Doctor.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Doctor(
      crm: serializer.fromJson<int>(json['crm']),
      clinicId: serializer.fromJson<int>(json['clinicId']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<int>(json['phone']),
      specialty: serializer.fromJson<String>(json['specialty']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'crm': serializer.toJson<int>(crm),
      'clinicId': serializer.toJson<int>(clinicId),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<int>(phone),
      'specialty': serializer.toJson<String>(specialty),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  Doctor copyWith({
    int? crm,
    int? clinicId,
    String? name,
    int? phone,
    String? specialty,
    Value<String?> imageUrl = const Value.absent(),
  }) => Doctor(
    crm: crm ?? this.crm,
    clinicId: clinicId ?? this.clinicId,
    name: name ?? this.name,
    phone: phone ?? this.phone,
    specialty: specialty ?? this.specialty,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
  );
  Doctor copyWithCompanion(DoctorsCompanion data) {
    return Doctor(
      crm: data.crm.present ? data.crm.value : this.crm,
      clinicId: data.clinicId.present ? data.clinicId.value : this.clinicId,
      name: data.name.present ? data.name.value : this.name,
      phone: data.phone.present ? data.phone.value : this.phone,
      specialty: data.specialty.present ? data.specialty.value : this.specialty,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Doctor(')
          ..write('crm: $crm, ')
          ..write('clinicId: $clinicId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('specialty: $specialty, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(crm, clinicId, name, phone, specialty, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Doctor &&
          other.crm == this.crm &&
          other.clinicId == this.clinicId &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.specialty == this.specialty &&
          other.imageUrl == this.imageUrl);
}

class DoctorsCompanion extends UpdateCompanion<Doctor> {
  final Value<int> crm;
  final Value<int> clinicId;
  final Value<String> name;
  final Value<int> phone;
  final Value<String> specialty;
  final Value<String?> imageUrl;
  final Value<int> rowid;
  const DoctorsCompanion({
    this.crm = const Value.absent(),
    this.clinicId = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.specialty = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoctorsCompanion.insert({
    required int crm,
    required int clinicId,
    required String name,
    required int phone,
    required String specialty,
    this.imageUrl = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : crm = Value(crm),
       clinicId = Value(clinicId),
       name = Value(name),
       phone = Value(phone),
       specialty = Value(specialty);
  static Insertable<Doctor> custom({
    Expression<int>? crm,
    Expression<int>? clinicId,
    Expression<String>? name,
    Expression<int>? phone,
    Expression<String>? specialty,
    Expression<String>? imageUrl,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (crm != null) 'crm': crm,
      if (clinicId != null) 'clinic_id': clinicId,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (specialty != null) 'specialty': specialty,
      if (imageUrl != null) 'image_url': imageUrl,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoctorsCompanion copyWith({
    Value<int>? crm,
    Value<int>? clinicId,
    Value<String>? name,
    Value<int>? phone,
    Value<String>? specialty,
    Value<String?>? imageUrl,
    Value<int>? rowid,
  }) {
    return DoctorsCompanion(
      crm: crm ?? this.crm,
      clinicId: clinicId ?? this.clinicId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      specialty: specialty ?? this.specialty,
      imageUrl: imageUrl ?? this.imageUrl,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (crm.present) {
      map['crm'] = Variable<int>(crm.value);
    }
    if (clinicId.present) {
      map['clinic_id'] = Variable<int>(clinicId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<int>(phone.value);
    }
    if (specialty.present) {
      map['specialty'] = Variable<String>(specialty.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoctorsCompanion(')
          ..write('crm: $crm, ')
          ..write('clinicId: $clinicId, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('specialty: $specialty, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InsurancesTable extends Insurances
    with TableInfo<$InsurancesTable, Insurance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InsurancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'insurances';
  @override
  VerificationContext validateIntegrity(
    Insertable<Insurance> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Insurance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Insurance(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  $InsurancesTable createAlias(String alias) {
    return $InsurancesTable(attachedDatabase, alias);
  }
}

class Insurance extends DataClass implements Insertable<Insurance> {
  final int id;
  final String name;
  const Insurance({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  InsurancesCompanion toCompanion(bool nullToAbsent) {
    return InsurancesCompanion(id: Value(id), name: Value(name));
  }

  factory Insurance.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Insurance(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Insurance copyWith({int? id, String? name}) =>
      Insurance(id: id ?? this.id, name: name ?? this.name);
  Insurance copyWithCompanion(InsurancesCompanion data) {
    return Insurance(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Insurance(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Insurance && other.id == this.id && other.name == this.name);
}

class InsurancesCompanion extends UpdateCompanion<Insurance> {
  final Value<int> id;
  final Value<String> name;
  const InsurancesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  InsurancesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Insurance> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  InsurancesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return InsurancesCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InsurancesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PatientsTable extends Patients with TableInfo<$PatientsTable, Patient> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PatientsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id)',
    ),
  );
  static const VerificationMeta _insuranceIdMeta = const VerificationMeta(
    'insuranceId',
  );
  @override
  late final GeneratedColumn<int> insuranceId = GeneratedColumn<int>(
    'insurance_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES insurances (id)',
    ),
  );
  static const VerificationMeta _addressIdMeta = const VerificationMeta(
    'addressId',
  );
  @override
  late final GeneratedColumn<int> addressId = GeneratedColumn<int>(
    'address_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES addresses (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    insuranceId,
    addressId,
    name,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'patients';
  @override
  VerificationContext validateIntegrity(
    Insertable<Patient> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('insurance_id')) {
      context.handle(
        _insuranceIdMeta,
        insuranceId.isAcceptableOrUnknown(
          data['insurance_id']!,
          _insuranceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_insuranceIdMeta);
    }
    if (data.containsKey('address_id')) {
      context.handle(
        _addressIdMeta,
        addressId.isAcceptableOrUnknown(data['address_id']!, _addressIdMeta),
      );
    } else if (isInserting) {
      context.missing(_addressIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Patient map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Patient(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}user_id'],
          )!,
      insuranceId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}insurance_id'],
          )!,
      addressId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}address_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class Patient extends DataClass implements Insertable<Patient> {
  final int id;
  final int userId;
  final int insuranceId;
  final int addressId;
  final String name;
  const Patient({
    required this.id,
    required this.userId,
    required this.insuranceId,
    required this.addressId,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['insurance_id'] = Variable<int>(insuranceId);
    map['address_id'] = Variable<int>(addressId);
    map['name'] = Variable<String>(name);
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      userId: Value(userId),
      insuranceId: Value(insuranceId),
      addressId: Value(addressId),
      name: Value(name),
    );
  }

  factory Patient.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      insuranceId: serializer.fromJson<int>(json['insuranceId']),
      addressId: serializer.fromJson<int>(json['addressId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'insuranceId': serializer.toJson<int>(insuranceId),
      'addressId': serializer.toJson<int>(addressId),
      'name': serializer.toJson<String>(name),
    };
  }

  Patient copyWith({
    int? id,
    int? userId,
    int? insuranceId,
    int? addressId,
    String? name,
  }) => Patient(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    insuranceId: insuranceId ?? this.insuranceId,
    addressId: addressId ?? this.addressId,
    name: name ?? this.name,
  );
  Patient copyWithCompanion(PatientsCompanion data) {
    return Patient(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      insuranceId:
          data.insuranceId.present ? data.insuranceId.value : this.insuranceId,
      addressId: data.addressId.present ? data.addressId.value : this.addressId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('insuranceId: $insuranceId, ')
          ..write('addressId: $addressId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, insuranceId, addressId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.insuranceId == this.insuranceId &&
          other.addressId == this.addressId &&
          other.name == this.name);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> insuranceId;
  final Value<int> addressId;
  final Value<String> name;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.insuranceId = const Value.absent(),
    this.addressId = const Value.absent(),
    this.name = const Value.absent(),
  });
  PatientsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int insuranceId,
    required int addressId,
    required String name,
  }) : userId = Value(userId),
       insuranceId = Value(insuranceId),
       addressId = Value(addressId),
       name = Value(name);
  static Insertable<Patient> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? insuranceId,
    Expression<int>? addressId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (insuranceId != null) 'insurance_id': insuranceId,
      if (addressId != null) 'address_id': addressId,
      if (name != null) 'name': name,
    });
  }

  PatientsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? insuranceId,
    Value<int>? addressId,
    Value<String>? name,
  }) {
    return PatientsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      insuranceId: insuranceId ?? this.insuranceId,
      addressId: addressId ?? this.addressId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (insuranceId.present) {
      map['insurance_id'] = Variable<int>(insuranceId.value);
    }
    if (addressId.present) {
      map['address_id'] = Variable<int>(addressId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('insuranceId: $insuranceId, ')
          ..write('addressId: $addressId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $DoctorInsurancesTable extends DoctorInsurances
    with TableInfo<$DoctorInsurancesTable, DoctorInsurance> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoctorInsurancesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _crmMeta = const VerificationMeta('crm');
  @override
  late final GeneratedColumn<int> crm = GeneratedColumn<int>(
    'crm',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES doctors (crm)',
    ),
  );
  static const VerificationMeta _insuranceIdMeta = const VerificationMeta(
    'insuranceId',
  );
  @override
  late final GeneratedColumn<int> insuranceId = GeneratedColumn<int>(
    'insurance_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES insurances (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [crm, insuranceId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'doctor_insurances';
  @override
  VerificationContext validateIntegrity(
    Insertable<DoctorInsurance> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('crm')) {
      context.handle(
        _crmMeta,
        crm.isAcceptableOrUnknown(data['crm']!, _crmMeta),
      );
    } else if (isInserting) {
      context.missing(_crmMeta);
    }
    if (data.containsKey('insurance_id')) {
      context.handle(
        _insuranceIdMeta,
        insuranceId.isAcceptableOrUnknown(
          data['insurance_id']!,
          _insuranceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_insuranceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {crm, insuranceId};
  @override
  DoctorInsurance map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoctorInsurance(
      crm:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}crm'],
          )!,
      insuranceId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}insurance_id'],
          )!,
    );
  }

  @override
  $DoctorInsurancesTable createAlias(String alias) {
    return $DoctorInsurancesTable(attachedDatabase, alias);
  }
}

class DoctorInsurance extends DataClass implements Insertable<DoctorInsurance> {
  final int crm;
  final int insuranceId;
  const DoctorInsurance({required this.crm, required this.insuranceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['crm'] = Variable<int>(crm);
    map['insurance_id'] = Variable<int>(insuranceId);
    return map;
  }

  DoctorInsurancesCompanion toCompanion(bool nullToAbsent) {
    return DoctorInsurancesCompanion(
      crm: Value(crm),
      insuranceId: Value(insuranceId),
    );
  }

  factory DoctorInsurance.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoctorInsurance(
      crm: serializer.fromJson<int>(json['crm']),
      insuranceId: serializer.fromJson<int>(json['insuranceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'crm': serializer.toJson<int>(crm),
      'insuranceId': serializer.toJson<int>(insuranceId),
    };
  }

  DoctorInsurance copyWith({int? crm, int? insuranceId}) => DoctorInsurance(
    crm: crm ?? this.crm,
    insuranceId: insuranceId ?? this.insuranceId,
  );
  DoctorInsurance copyWithCompanion(DoctorInsurancesCompanion data) {
    return DoctorInsurance(
      crm: data.crm.present ? data.crm.value : this.crm,
      insuranceId:
          data.insuranceId.present ? data.insuranceId.value : this.insuranceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoctorInsurance(')
          ..write('crm: $crm, ')
          ..write('insuranceId: $insuranceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(crm, insuranceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoctorInsurance &&
          other.crm == this.crm &&
          other.insuranceId == this.insuranceId);
}

class DoctorInsurancesCompanion extends UpdateCompanion<DoctorInsurance> {
  final Value<int> crm;
  final Value<int> insuranceId;
  final Value<int> rowid;
  const DoctorInsurancesCompanion({
    this.crm = const Value.absent(),
    this.insuranceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoctorInsurancesCompanion.insert({
    required int crm,
    required int insuranceId,
    this.rowid = const Value.absent(),
  }) : crm = Value(crm),
       insuranceId = Value(insuranceId);
  static Insertable<DoctorInsurance> custom({
    Expression<int>? crm,
    Expression<int>? insuranceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (crm != null) 'crm': crm,
      if (insuranceId != null) 'insurance_id': insuranceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoctorInsurancesCompanion copyWith({
    Value<int>? crm,
    Value<int>? insuranceId,
    Value<int>? rowid,
  }) {
    return DoctorInsurancesCompanion(
      crm: crm ?? this.crm,
      insuranceId: insuranceId ?? this.insuranceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (crm.present) {
      map['crm'] = Variable<int>(crm.value);
    }
    if (insuranceId.present) {
      map['insurance_id'] = Variable<int>(insuranceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoctorInsurancesCompanion(')
          ..write('crm: $crm, ')
          ..write('insuranceId: $insuranceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DoctorSchedulesTable extends DoctorSchedules
    with TableInfo<$DoctorSchedulesTable, DoctorSchedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DoctorSchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _doctorCrmMeta = const VerificationMeta(
    'doctorCrm',
  );
  @override
  late final GeneratedColumn<int> doctorCrm = GeneratedColumn<int>(
    'doctor_crm',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES doctors (crm)',
    ),
  );
  static const VerificationMeta _weekdayMeta = const VerificationMeta(
    'weekday',
  );
  @override
  late final GeneratedColumn<String> weekday = GeneratedColumn<String>(
    'weekday',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK(weekday IN (\'SUN\', \'MON\', \'TUE\', \'WED\', \'THU\', \'FRI\', \'SAT\'))',
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints:
        'NOT NULL CHECK(status IN (\'available\', \'unavailable\'))',
  );
  @override
  List<GeneratedColumn> get $columns => [doctorCrm, weekday, date, status];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'doctor_schedules';
  @override
  VerificationContext validateIntegrity(
    Insertable<DoctorSchedule> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('doctor_crm')) {
      context.handle(
        _doctorCrmMeta,
        doctorCrm.isAcceptableOrUnknown(data['doctor_crm']!, _doctorCrmMeta),
      );
    } else if (isInserting) {
      context.missing(_doctorCrmMeta);
    }
    if (data.containsKey('weekday')) {
      context.handle(
        _weekdayMeta,
        weekday.isAcceptableOrUnknown(data['weekday']!, _weekdayMeta),
      );
    } else if (isInserting) {
      context.missing(_weekdayMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {doctorCrm, date};
  @override
  DoctorSchedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoctorSchedule(
      doctorCrm:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}doctor_crm'],
          )!,
      weekday:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}weekday'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
    );
  }

  @override
  $DoctorSchedulesTable createAlias(String alias) {
    return $DoctorSchedulesTable(attachedDatabase, alias);
  }
}

class DoctorSchedule extends DataClass implements Insertable<DoctorSchedule> {
  final int doctorCrm;
  final String weekday;
  final DateTime date;
  final String status;
  const DoctorSchedule({
    required this.doctorCrm,
    required this.weekday,
    required this.date,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['doctor_crm'] = Variable<int>(doctorCrm);
    map['weekday'] = Variable<String>(weekday);
    map['date'] = Variable<DateTime>(date);
    map['status'] = Variable<String>(status);
    return map;
  }

  DoctorSchedulesCompanion toCompanion(bool nullToAbsent) {
    return DoctorSchedulesCompanion(
      doctorCrm: Value(doctorCrm),
      weekday: Value(weekday),
      date: Value(date),
      status: Value(status),
    );
  }

  factory DoctorSchedule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoctorSchedule(
      doctorCrm: serializer.fromJson<int>(json['doctorCrm']),
      weekday: serializer.fromJson<String>(json['weekday']),
      date: serializer.fromJson<DateTime>(json['date']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'doctorCrm': serializer.toJson<int>(doctorCrm),
      'weekday': serializer.toJson<String>(weekday),
      'date': serializer.toJson<DateTime>(date),
      'status': serializer.toJson<String>(status),
    };
  }

  DoctorSchedule copyWith({
    int? doctorCrm,
    String? weekday,
    DateTime? date,
    String? status,
  }) => DoctorSchedule(
    doctorCrm: doctorCrm ?? this.doctorCrm,
    weekday: weekday ?? this.weekday,
    date: date ?? this.date,
    status: status ?? this.status,
  );
  DoctorSchedule copyWithCompanion(DoctorSchedulesCompanion data) {
    return DoctorSchedule(
      doctorCrm: data.doctorCrm.present ? data.doctorCrm.value : this.doctorCrm,
      weekday: data.weekday.present ? data.weekday.value : this.weekday,
      date: data.date.present ? data.date.value : this.date,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoctorSchedule(')
          ..write('doctorCrm: $doctorCrm, ')
          ..write('weekday: $weekday, ')
          ..write('date: $date, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(doctorCrm, weekday, date, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoctorSchedule &&
          other.doctorCrm == this.doctorCrm &&
          other.weekday == this.weekday &&
          other.date == this.date &&
          other.status == this.status);
}

class DoctorSchedulesCompanion extends UpdateCompanion<DoctorSchedule> {
  final Value<int> doctorCrm;
  final Value<String> weekday;
  final Value<DateTime> date;
  final Value<String> status;
  final Value<int> rowid;
  const DoctorSchedulesCompanion({
    this.doctorCrm = const Value.absent(),
    this.weekday = const Value.absent(),
    this.date = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoctorSchedulesCompanion.insert({
    required int doctorCrm,
    required String weekday,
    required DateTime date,
    required String status,
    this.rowid = const Value.absent(),
  }) : doctorCrm = Value(doctorCrm),
       weekday = Value(weekday),
       date = Value(date),
       status = Value(status);
  static Insertable<DoctorSchedule> custom({
    Expression<int>? doctorCrm,
    Expression<String>? weekday,
    Expression<DateTime>? date,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (doctorCrm != null) 'doctor_crm': doctorCrm,
      if (weekday != null) 'weekday': weekday,
      if (date != null) 'date': date,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoctorSchedulesCompanion copyWith({
    Value<int>? doctorCrm,
    Value<String>? weekday,
    Value<DateTime>? date,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return DoctorSchedulesCompanion(
      doctorCrm: doctorCrm ?? this.doctorCrm,
      weekday: weekday ?? this.weekday,
      date: date ?? this.date,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (doctorCrm.present) {
      map['doctor_crm'] = Variable<int>(doctorCrm.value);
    }
    if (weekday.present) {
      map['weekday'] = Variable<String>(weekday.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DoctorSchedulesCompanion(')
          ..write('doctorCrm: $doctorCrm, ')
          ..write('weekday: $weekday, ')
          ..write('date: $date, ')
          ..write('status: $status, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AddressesTable addresses = $AddressesTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ClinicsTable clinics = $ClinicsTable(this);
  late final $DoctorsTable doctors = $DoctorsTable(this);
  late final $InsurancesTable insurances = $InsurancesTable(this);
  late final $PatientsTable patients = $PatientsTable(this);
  late final $DoctorInsurancesTable doctorInsurances = $DoctorInsurancesTable(
    this,
  );
  late final $DoctorSchedulesTable doctorSchedules = $DoctorSchedulesTable(
    this,
  );
  late final AddressDao addressDao = AddressDao(this as AppDatabase);
  late final ClinicDao clinicDao = ClinicDao(this as AppDatabase);
  late final DoctorDao doctorDao = DoctorDao(this as AppDatabase);
  late final InsuranceDao insuranceDao = InsuranceDao(this as AppDatabase);
  late final PatientDao patientDao = PatientDao(this as AppDatabase);
  late final DoctorInsuranceDao doctorInsuranceDao = DoctorInsuranceDao(
    this as AppDatabase,
  );
  late final DoctorScheduleDao doctorScheduleDao = DoctorScheduleDao(
    this as AppDatabase,
  );
  late final UserDao userDao = UserDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    addresses,
    users,
    clinics,
    doctors,
    insurances,
    patients,
    doctorInsurances,
    doctorSchedules,
  ];
}

typedef $$AddressesTableCreateCompanionBuilder =
    AddressesCompanion Function({
      Value<int> id,
      required String street,
      required String neighborhood,
      required String city,
      required String state,
      required int zipCode,
    });
typedef $$AddressesTableUpdateCompanionBuilder =
    AddressesCompanion Function({
      Value<int> id,
      Value<String> street,
      Value<String> neighborhood,
      Value<String> city,
      Value<String> state,
      Value<int> zipCode,
    });

final class $$AddressesTableReferences
    extends BaseReferences<_$AppDatabase, $AddressesTable, Address> {
  $$AddressesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ClinicsTable, List<Clinic>> _clinicsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.clinics,
    aliasName: $_aliasNameGenerator(db.addresses.id, db.clinics.addressId),
  );

  $$ClinicsTableProcessedTableManager get clinicsRefs {
    final manager = $$ClinicsTableTableManager(
      $_db,
      $_db.clinics,
    ).filter((f) => f.addressId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_clinicsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PatientsTable, List<Patient>> _patientsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.patients,
    aliasName: $_aliasNameGenerator(db.addresses.id, db.patients.addressId),
  );

  $$PatientsTableProcessedTableManager get patientsRefs {
    final manager = $$PatientsTableTableManager(
      $_db,
      $_db.patients,
    ).filter((f) => f.addressId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_patientsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AddressesTableFilterComposer
    extends Composer<_$AppDatabase, $AddressesTable> {
  $$AddressesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get street => $composableBuilder(
    column: $table.street,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get neighborhood => $composableBuilder(
    column: $table.neighborhood,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get zipCode => $composableBuilder(
    column: $table.zipCode,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> clinicsRefs(
    Expression<bool> Function($$ClinicsTableFilterComposer f) f,
  ) {
    final $$ClinicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clinics,
      getReferencedColumn: (t) => t.addressId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClinicsTableFilterComposer(
            $db: $db,
            $table: $db.clinics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> patientsRefs(
    Expression<bool> Function($$PatientsTableFilterComposer f) f,
  ) {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.addressId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableFilterComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AddressesTableOrderingComposer
    extends Composer<_$AppDatabase, $AddressesTable> {
  $$AddressesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get street => $composableBuilder(
    column: $table.street,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get neighborhood => $composableBuilder(
    column: $table.neighborhood,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get city => $composableBuilder(
    column: $table.city,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get state => $composableBuilder(
    column: $table.state,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get zipCode => $composableBuilder(
    column: $table.zipCode,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AddressesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AddressesTable> {
  $$AddressesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get street =>
      $composableBuilder(column: $table.street, builder: (column) => column);

  GeneratedColumn<String> get neighborhood => $composableBuilder(
    column: $table.neighborhood,
    builder: (column) => column,
  );

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get state =>
      $composableBuilder(column: $table.state, builder: (column) => column);

  GeneratedColumn<int> get zipCode =>
      $composableBuilder(column: $table.zipCode, builder: (column) => column);

  Expression<T> clinicsRefs<T extends Object>(
    Expression<T> Function($$ClinicsTableAnnotationComposer a) f,
  ) {
    final $$ClinicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clinics,
      getReferencedColumn: (t) => t.addressId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClinicsTableAnnotationComposer(
            $db: $db,
            $table: $db.clinics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> patientsRefs<T extends Object>(
    Expression<T> Function($$PatientsTableAnnotationComposer a) f,
  ) {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.addressId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableAnnotationComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AddressesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AddressesTable,
          Address,
          $$AddressesTableFilterComposer,
          $$AddressesTableOrderingComposer,
          $$AddressesTableAnnotationComposer,
          $$AddressesTableCreateCompanionBuilder,
          $$AddressesTableUpdateCompanionBuilder,
          (Address, $$AddressesTableReferences),
          Address,
          PrefetchHooks Function({bool clinicsRefs, bool patientsRefs})
        > {
  $$AddressesTableTableManager(_$AppDatabase db, $AddressesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$AddressesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AddressesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$AddressesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> street = const Value.absent(),
                Value<String> neighborhood = const Value.absent(),
                Value<String> city = const Value.absent(),
                Value<String> state = const Value.absent(),
                Value<int> zipCode = const Value.absent(),
              }) => AddressesCompanion(
                id: id,
                street: street,
                neighborhood: neighborhood,
                city: city,
                state: state,
                zipCode: zipCode,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String street,
                required String neighborhood,
                required String city,
                required String state,
                required int zipCode,
              }) => AddressesCompanion.insert(
                id: id,
                street: street,
                neighborhood: neighborhood,
                city: city,
                state: state,
                zipCode: zipCode,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AddressesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({clinicsRefs = false, patientsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (clinicsRefs) db.clinics,
                if (patientsRefs) db.patients,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (clinicsRefs)
                    await $_getPrefetchedData<Address, $AddressesTable, Clinic>(
                      currentTable: table,
                      referencedTable: $$AddressesTableReferences
                          ._clinicsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$AddressesTableReferences(
                                db,
                                table,
                                p0,
                              ).clinicsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.addressId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (patientsRefs)
                    await $_getPrefetchedData<
                      Address,
                      $AddressesTable,
                      Patient
                    >(
                      currentTable: table,
                      referencedTable: $$AddressesTableReferences
                          ._patientsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$AddressesTableReferences(
                                db,
                                table,
                                p0,
                              ).patientsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.addressId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AddressesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AddressesTable,
      Address,
      $$AddressesTableFilterComposer,
      $$AddressesTableOrderingComposer,
      $$AddressesTableAnnotationComposer,
      $$AddressesTableCreateCompanionBuilder,
      $$AddressesTableUpdateCompanionBuilder,
      (Address, $$AddressesTableReferences),
      Address,
      PrefetchHooks Function({bool clinicsRefs, bool patientsRefs})
    >;
typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String email,
      Value<String?> firebaseUid,
      required String type,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> email,
      Value<String?> firebaseUid,
      Value<String> type,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ClinicsTable, List<Clinic>> _clinicsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.clinics,
    aliasName: $_aliasNameGenerator(db.users.id, db.clinics.userId),
  );

  $$ClinicsTableProcessedTableManager get clinicsRefs {
    final manager = $$ClinicsTableTableManager(
      $_db,
      $_db.clinics,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_clinicsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PatientsTable, List<Patient>> _patientsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.patients,
    aliasName: $_aliasNameGenerator(db.users.id, db.patients.userId),
  );

  $$PatientsTableProcessedTableManager get patientsRefs {
    final manager = $$PatientsTableTableManager(
      $_db,
      $_db.patients,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_patientsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> clinicsRefs(
    Expression<bool> Function($$ClinicsTableFilterComposer f) f,
  ) {
    final $$ClinicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clinics,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClinicsTableFilterComposer(
            $db: $db,
            $table: $db.clinics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> patientsRefs(
    Expression<bool> Function($$PatientsTableFilterComposer f) f,
  ) {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableFilterComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get firebaseUid => $composableBuilder(
    column: $table.firebaseUid,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  Expression<T> clinicsRefs<T extends Object>(
    Expression<T> Function($$ClinicsTableAnnotationComposer a) f,
  ) {
    final $$ClinicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.clinics,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClinicsTableAnnotationComposer(
            $db: $db,
            $table: $db.clinics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> patientsRefs<T extends Object>(
    Expression<T> Function($$PatientsTableAnnotationComposer a) f,
  ) {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableAnnotationComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({bool clinicsRefs, bool patientsRefs})
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String?> firebaseUid = const Value.absent(),
                Value<String> type = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                email: email,
                firebaseUid: firebaseUid,
                type: type,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String email,
                Value<String?> firebaseUid = const Value.absent(),
                required String type,
              }) => UsersCompanion.insert(
                id: id,
                email: email,
                firebaseUid: firebaseUid,
                type: type,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$UsersTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({clinicsRefs = false, patientsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (clinicsRefs) db.clinics,
                if (patientsRefs) db.patients,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (clinicsRefs)
                    await $_getPrefetchedData<User, $UsersTable, Clinic>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences._clinicsRefsTable(
                        db,
                      ),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersTableReferences(db, table, p0).clinicsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.userId == item.id),
                      typedResults: items,
                    ),
                  if (patientsRefs)
                    await $_getPrefetchedData<User, $UsersTable, Patient>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._patientsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).patientsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.userId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({bool clinicsRefs, bool patientsRefs})
    >;
typedef $$ClinicsTableCreateCompanionBuilder =
    ClinicsCompanion Function({
      Value<int> id,
      required int userId,
      required int addressId,
      required String name,
      required int phone,
      Value<String?> imageUrl,
    });
typedef $$ClinicsTableUpdateCompanionBuilder =
    ClinicsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> addressId,
      Value<String> name,
      Value<int> phone,
      Value<String?> imageUrl,
    });

final class $$ClinicsTableReferences
    extends BaseReferences<_$AppDatabase, $ClinicsTable, Clinic> {
  $$ClinicsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.clinics.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AddressesTable _addressIdTable(_$AppDatabase db) => db.addresses
      .createAlias($_aliasNameGenerator(db.clinics.addressId, db.addresses.id));

  $$AddressesTableProcessedTableManager get addressId {
    final $_column = $_itemColumn<int>('address_id')!;

    final manager = $$AddressesTableTableManager(
      $_db,
      $_db.addresses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_addressIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DoctorsTable, List<Doctor>> _doctorsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.doctors,
    aliasName: $_aliasNameGenerator(db.clinics.id, db.doctors.clinicId),
  );

  $$DoctorsTableProcessedTableManager get doctorsRefs {
    final manager = $$DoctorsTableTableManager(
      $_db,
      $_db.doctors,
    ).filter((f) => f.clinicId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_doctorsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClinicsTableFilterComposer
    extends Composer<_$AppDatabase, $ClinicsTable> {
  $$ClinicsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AddressesTableFilterComposer get addressId {
    final $$AddressesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.addressId,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableFilterComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> doctorsRefs(
    Expression<bool> Function($$DoctorsTableFilterComposer f) f,
  ) {
    final $$DoctorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doctors,
      getReferencedColumn: (t) => t.clinicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorsTableFilterComposer(
            $db: $db,
            $table: $db.doctors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClinicsTableOrderingComposer
    extends Composer<_$AppDatabase, $ClinicsTable> {
  $$ClinicsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AddressesTableOrderingComposer get addressId {
    final $$AddressesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.addressId,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableOrderingComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClinicsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClinicsTable> {
  $$ClinicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AddressesTableAnnotationComposer get addressId {
    final $$AddressesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.addressId,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableAnnotationComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> doctorsRefs<T extends Object>(
    Expression<T> Function($$DoctorsTableAnnotationComposer a) f,
  ) {
    final $$DoctorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doctors,
      getReferencedColumn: (t) => t.clinicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorsTableAnnotationComposer(
            $db: $db,
            $table: $db.doctors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClinicsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClinicsTable,
          Clinic,
          $$ClinicsTableFilterComposer,
          $$ClinicsTableOrderingComposer,
          $$ClinicsTableAnnotationComposer,
          $$ClinicsTableCreateCompanionBuilder,
          $$ClinicsTableUpdateCompanionBuilder,
          (Clinic, $$ClinicsTableReferences),
          Clinic,
          PrefetchHooks Function({
            bool userId,
            bool addressId,
            bool doctorsRefs,
          })
        > {
  $$ClinicsTableTableManager(_$AppDatabase db, $ClinicsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ClinicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ClinicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ClinicsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> addressId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> phone = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => ClinicsCompanion(
                id: id,
                userId: userId,
                addressId: addressId,
                name: name,
                phone: phone,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int addressId,
                required String name,
                required int phone,
                Value<String?> imageUrl = const Value.absent(),
              }) => ClinicsCompanion.insert(
                id: id,
                userId: userId,
                addressId: addressId,
                name: name,
                phone: phone,
                imageUrl: imageUrl,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ClinicsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            userId = false,
            addressId = false,
            doctorsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (doctorsRefs) db.doctors],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (userId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.userId,
                            referencedTable: $$ClinicsTableReferences
                                ._userIdTable(db),
                            referencedColumn:
                                $$ClinicsTableReferences._userIdTable(db).id,
                          )
                          as T;
                }
                if (addressId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.addressId,
                            referencedTable: $$ClinicsTableReferences
                                ._addressIdTable(db),
                            referencedColumn:
                                $$ClinicsTableReferences._addressIdTable(db).id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (doctorsRefs)
                    await $_getPrefetchedData<Clinic, $ClinicsTable, Doctor>(
                      currentTable: table,
                      referencedTable: $$ClinicsTableReferences
                          ._doctorsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ClinicsTableReferences(
                                db,
                                table,
                                p0,
                              ).doctorsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.clinicId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ClinicsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClinicsTable,
      Clinic,
      $$ClinicsTableFilterComposer,
      $$ClinicsTableOrderingComposer,
      $$ClinicsTableAnnotationComposer,
      $$ClinicsTableCreateCompanionBuilder,
      $$ClinicsTableUpdateCompanionBuilder,
      (Clinic, $$ClinicsTableReferences),
      Clinic,
      PrefetchHooks Function({bool userId, bool addressId, bool doctorsRefs})
    >;
typedef $$DoctorsTableCreateCompanionBuilder =
    DoctorsCompanion Function({
      required int crm,
      required int clinicId,
      required String name,
      required int phone,
      required String specialty,
      Value<String?> imageUrl,
      Value<int> rowid,
    });
typedef $$DoctorsTableUpdateCompanionBuilder =
    DoctorsCompanion Function({
      Value<int> crm,
      Value<int> clinicId,
      Value<String> name,
      Value<int> phone,
      Value<String> specialty,
      Value<String?> imageUrl,
      Value<int> rowid,
    });

final class $$DoctorsTableReferences
    extends BaseReferences<_$AppDatabase, $DoctorsTable, Doctor> {
  $$DoctorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClinicsTable _clinicIdTable(_$AppDatabase db) => db.clinics
      .createAlias($_aliasNameGenerator(db.doctors.clinicId, db.clinics.id));

  $$ClinicsTableProcessedTableManager get clinicId {
    final $_column = $_itemColumn<int>('clinic_id')!;

    final manager = $$ClinicsTableTableManager(
      $_db,
      $_db.clinics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_clinicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DoctorInsurancesTable, List<DoctorInsurance>>
  _doctorInsurancesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.doctorInsurances,
    aliasName: $_aliasNameGenerator(db.doctors.crm, db.doctorInsurances.crm),
  );

  $$DoctorInsurancesTableProcessedTableManager get doctorInsurancesRefs {
    final manager = $$DoctorInsurancesTableTableManager(
      $_db,
      $_db.doctorInsurances,
    ).filter((f) => f.crm.crm.sqlEquals($_itemColumn<int>('crm')!));

    final cache = $_typedResult.readTableOrNull(
      _doctorInsurancesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DoctorSchedulesTable, List<DoctorSchedule>>
  _doctorSchedulesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.doctorSchedules,
    aliasName: $_aliasNameGenerator(
      db.doctors.crm,
      db.doctorSchedules.doctorCrm,
    ),
  );

  $$DoctorSchedulesTableProcessedTableManager get doctorSchedulesRefs {
    final manager = $$DoctorSchedulesTableTableManager(
      $_db,
      $_db.doctorSchedules,
    ).filter((f) => f.doctorCrm.crm.sqlEquals($_itemColumn<int>('crm')!));

    final cache = $_typedResult.readTableOrNull(
      _doctorSchedulesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DoctorsTableFilterComposer
    extends Composer<_$AppDatabase, $DoctorsTable> {
  $$DoctorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get crm => $composableBuilder(
    column: $table.crm,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get specialty => $composableBuilder(
    column: $table.specialty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$ClinicsTableFilterComposer get clinicId {
    final $$ClinicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clinicId,
      referencedTable: $db.clinics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClinicsTableFilterComposer(
            $db: $db,
            $table: $db.clinics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> doctorInsurancesRefs(
    Expression<bool> Function($$DoctorInsurancesTableFilterComposer f) f,
  ) {
    final $$DoctorInsurancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.crm,
      referencedTable: $db.doctorInsurances,
      getReferencedColumn: (t) => t.crm,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorInsurancesTableFilterComposer(
            $db: $db,
            $table: $db.doctorInsurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> doctorSchedulesRefs(
    Expression<bool> Function($$DoctorSchedulesTableFilterComposer f) f,
  ) {
    final $$DoctorSchedulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.crm,
      referencedTable: $db.doctorSchedules,
      getReferencedColumn: (t) => t.doctorCrm,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorSchedulesTableFilterComposer(
            $db: $db,
            $table: $db.doctorSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DoctorsTableOrderingComposer
    extends Composer<_$AppDatabase, $DoctorsTable> {
  $$DoctorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get crm => $composableBuilder(
    column: $table.crm,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get specialty => $composableBuilder(
    column: $table.specialty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClinicsTableOrderingComposer get clinicId {
    final $$ClinicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clinicId,
      referencedTable: $db.clinics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClinicsTableOrderingComposer(
            $db: $db,
            $table: $db.clinics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoctorsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoctorsTable> {
  $$DoctorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get crm =>
      $composableBuilder(column: $table.crm, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get specialty =>
      $composableBuilder(column: $table.specialty, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  $$ClinicsTableAnnotationComposer get clinicId {
    final $$ClinicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.clinicId,
      referencedTable: $db.clinics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClinicsTableAnnotationComposer(
            $db: $db,
            $table: $db.clinics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> doctorInsurancesRefs<T extends Object>(
    Expression<T> Function($$DoctorInsurancesTableAnnotationComposer a) f,
  ) {
    final $$DoctorInsurancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.crm,
      referencedTable: $db.doctorInsurances,
      getReferencedColumn: (t) => t.crm,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorInsurancesTableAnnotationComposer(
            $db: $db,
            $table: $db.doctorInsurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> doctorSchedulesRefs<T extends Object>(
    Expression<T> Function($$DoctorSchedulesTableAnnotationComposer a) f,
  ) {
    final $$DoctorSchedulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.crm,
      referencedTable: $db.doctorSchedules,
      getReferencedColumn: (t) => t.doctorCrm,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorSchedulesTableAnnotationComposer(
            $db: $db,
            $table: $db.doctorSchedules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DoctorsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DoctorsTable,
          Doctor,
          $$DoctorsTableFilterComposer,
          $$DoctorsTableOrderingComposer,
          $$DoctorsTableAnnotationComposer,
          $$DoctorsTableCreateCompanionBuilder,
          $$DoctorsTableUpdateCompanionBuilder,
          (Doctor, $$DoctorsTableReferences),
          Doctor,
          PrefetchHooks Function({
            bool clinicId,
            bool doctorInsurancesRefs,
            bool doctorSchedulesRefs,
          })
        > {
  $$DoctorsTableTableManager(_$AppDatabase db, $DoctorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$DoctorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DoctorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$DoctorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> crm = const Value.absent(),
                Value<int> clinicId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> phone = const Value.absent(),
                Value<String> specialty = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoctorsCompanion(
                crm: crm,
                clinicId: clinicId,
                name: name,
                phone: phone,
                specialty: specialty,
                imageUrl: imageUrl,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int crm,
                required int clinicId,
                required String name,
                required int phone,
                required String specialty,
                Value<String?> imageUrl = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoctorsCompanion.insert(
                crm: crm,
                clinicId: clinicId,
                name: name,
                phone: phone,
                specialty: specialty,
                imageUrl: imageUrl,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DoctorsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            clinicId = false,
            doctorInsurancesRefs = false,
            doctorSchedulesRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (doctorInsurancesRefs) db.doctorInsurances,
                if (doctorSchedulesRefs) db.doctorSchedules,
              ],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (clinicId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.clinicId,
                            referencedTable: $$DoctorsTableReferences
                                ._clinicIdTable(db),
                            referencedColumn:
                                $$DoctorsTableReferences._clinicIdTable(db).id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (doctorInsurancesRefs)
                    await $_getPrefetchedData<
                      Doctor,
                      $DoctorsTable,
                      DoctorInsurance
                    >(
                      currentTable: table,
                      referencedTable: $$DoctorsTableReferences
                          ._doctorInsurancesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DoctorsTableReferences(
                                db,
                                table,
                                p0,
                              ).doctorInsurancesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.crm == item.crm),
                      typedResults: items,
                    ),
                  if (doctorSchedulesRefs)
                    await $_getPrefetchedData<
                      Doctor,
                      $DoctorsTable,
                      DoctorSchedule
                    >(
                      currentTable: table,
                      referencedTable: $$DoctorsTableReferences
                          ._doctorSchedulesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$DoctorsTableReferences(
                                db,
                                table,
                                p0,
                              ).doctorSchedulesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.doctorCrm == item.crm,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$DoctorsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DoctorsTable,
      Doctor,
      $$DoctorsTableFilterComposer,
      $$DoctorsTableOrderingComposer,
      $$DoctorsTableAnnotationComposer,
      $$DoctorsTableCreateCompanionBuilder,
      $$DoctorsTableUpdateCompanionBuilder,
      (Doctor, $$DoctorsTableReferences),
      Doctor,
      PrefetchHooks Function({
        bool clinicId,
        bool doctorInsurancesRefs,
        bool doctorSchedulesRefs,
      })
    >;
typedef $$InsurancesTableCreateCompanionBuilder =
    InsurancesCompanion Function({Value<int> id, required String name});
typedef $$InsurancesTableUpdateCompanionBuilder =
    InsurancesCompanion Function({Value<int> id, Value<String> name});

final class $$InsurancesTableReferences
    extends BaseReferences<_$AppDatabase, $InsurancesTable, Insurance> {
  $$InsurancesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$PatientsTable, List<Patient>> _patientsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.patients,
    aliasName: $_aliasNameGenerator(db.insurances.id, db.patients.insuranceId),
  );

  $$PatientsTableProcessedTableManager get patientsRefs {
    final manager = $$PatientsTableTableManager(
      $_db,
      $_db.patients,
    ).filter((f) => f.insuranceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_patientsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DoctorInsurancesTable, List<DoctorInsurance>>
  _doctorInsurancesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.doctorInsurances,
    aliasName: $_aliasNameGenerator(
      db.insurances.id,
      db.doctorInsurances.insuranceId,
    ),
  );

  $$DoctorInsurancesTableProcessedTableManager get doctorInsurancesRefs {
    final manager = $$DoctorInsurancesTableTableManager(
      $_db,
      $_db.doctorInsurances,
    ).filter((f) => f.insuranceId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _doctorInsurancesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$InsurancesTableFilterComposer
    extends Composer<_$AppDatabase, $InsurancesTable> {
  $$InsurancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> patientsRefs(
    Expression<bool> Function($$PatientsTableFilterComposer f) f,
  ) {
    final $$PatientsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.insuranceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableFilterComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> doctorInsurancesRefs(
    Expression<bool> Function($$DoctorInsurancesTableFilterComposer f) f,
  ) {
    final $$DoctorInsurancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doctorInsurances,
      getReferencedColumn: (t) => t.insuranceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorInsurancesTableFilterComposer(
            $db: $db,
            $table: $db.doctorInsurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InsurancesTableOrderingComposer
    extends Composer<_$AppDatabase, $InsurancesTable> {
  $$InsurancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InsurancesTableAnnotationComposer
    extends Composer<_$AppDatabase, $InsurancesTable> {
  $$InsurancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> patientsRefs<T extends Object>(
    Expression<T> Function($$PatientsTableAnnotationComposer a) f,
  ) {
    final $$PatientsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.patients,
      getReferencedColumn: (t) => t.insuranceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PatientsTableAnnotationComposer(
            $db: $db,
            $table: $db.patients,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> doctorInsurancesRefs<T extends Object>(
    Expression<T> Function($$DoctorInsurancesTableAnnotationComposer a) f,
  ) {
    final $$DoctorInsurancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.doctorInsurances,
      getReferencedColumn: (t) => t.insuranceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorInsurancesTableAnnotationComposer(
            $db: $db,
            $table: $db.doctorInsurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$InsurancesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InsurancesTable,
          Insurance,
          $$InsurancesTableFilterComposer,
          $$InsurancesTableOrderingComposer,
          $$InsurancesTableAnnotationComposer,
          $$InsurancesTableCreateCompanionBuilder,
          $$InsurancesTableUpdateCompanionBuilder,
          (Insurance, $$InsurancesTableReferences),
          Insurance,
          PrefetchHooks Function({bool patientsRefs, bool doctorInsurancesRefs})
        > {
  $$InsurancesTableTableManager(_$AppDatabase db, $InsurancesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$InsurancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$InsurancesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$InsurancesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => InsurancesCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  InsurancesCompanion.insert(id: id, name: name),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$InsurancesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            patientsRefs = false,
            doctorInsurancesRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (patientsRefs) db.patients,
                if (doctorInsurancesRefs) db.doctorInsurances,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (patientsRefs)
                    await $_getPrefetchedData<
                      Insurance,
                      $InsurancesTable,
                      Patient
                    >(
                      currentTable: table,
                      referencedTable: $$InsurancesTableReferences
                          ._patientsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$InsurancesTableReferences(
                                db,
                                table,
                                p0,
                              ).patientsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.insuranceId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (doctorInsurancesRefs)
                    await $_getPrefetchedData<
                      Insurance,
                      $InsurancesTable,
                      DoctorInsurance
                    >(
                      currentTable: table,
                      referencedTable: $$InsurancesTableReferences
                          ._doctorInsurancesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$InsurancesTableReferences(
                                db,
                                table,
                                p0,
                              ).doctorInsurancesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.insuranceId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$InsurancesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InsurancesTable,
      Insurance,
      $$InsurancesTableFilterComposer,
      $$InsurancesTableOrderingComposer,
      $$InsurancesTableAnnotationComposer,
      $$InsurancesTableCreateCompanionBuilder,
      $$InsurancesTableUpdateCompanionBuilder,
      (Insurance, $$InsurancesTableReferences),
      Insurance,
      PrefetchHooks Function({bool patientsRefs, bool doctorInsurancesRefs})
    >;
typedef $$PatientsTableCreateCompanionBuilder =
    PatientsCompanion Function({
      Value<int> id,
      required int userId,
      required int insuranceId,
      required int addressId,
      required String name,
    });
typedef $$PatientsTableUpdateCompanionBuilder =
    PatientsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> insuranceId,
      Value<int> addressId,
      Value<String> name,
    });

final class $$PatientsTableReferences
    extends BaseReferences<_$AppDatabase, $PatientsTable, Patient> {
  $$PatientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.patients.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InsurancesTable _insuranceIdTable(_$AppDatabase db) =>
      db.insurances.createAlias(
        $_aliasNameGenerator(db.patients.insuranceId, db.insurances.id),
      );

  $$InsurancesTableProcessedTableManager get insuranceId {
    final $_column = $_itemColumn<int>('insurance_id')!;

    final manager = $$InsurancesTableTableManager(
      $_db,
      $_db.insurances,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_insuranceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $AddressesTable _addressIdTable(_$AppDatabase db) =>
      db.addresses.createAlias(
        $_aliasNameGenerator(db.patients.addressId, db.addresses.id),
      );

  $$AddressesTableProcessedTableManager get addressId {
    final $_column = $_itemColumn<int>('address_id')!;

    final manager = $$AddressesTableTableManager(
      $_db,
      $_db.addresses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_addressIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PatientsTableFilterComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InsurancesTableFilterComposer get insuranceId {
    final $$InsurancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.insuranceId,
      referencedTable: $db.insurances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsurancesTableFilterComposer(
            $db: $db,
            $table: $db.insurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AddressesTableFilterComposer get addressId {
    final $$AddressesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.addressId,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableFilterComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PatientsTableOrderingComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InsurancesTableOrderingComposer get insuranceId {
    final $$InsurancesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.insuranceId,
      referencedTable: $db.insurances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsurancesTableOrderingComposer(
            $db: $db,
            $table: $db.insurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AddressesTableOrderingComposer get addressId {
    final $$AddressesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.addressId,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableOrderingComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PatientsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PatientsTable> {
  $$PatientsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InsurancesTableAnnotationComposer get insuranceId {
    final $$InsurancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.insuranceId,
      referencedTable: $db.insurances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsurancesTableAnnotationComposer(
            $db: $db,
            $table: $db.insurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$AddressesTableAnnotationComposer get addressId {
    final $$AddressesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.addressId,
      referencedTable: $db.addresses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AddressesTableAnnotationComposer(
            $db: $db,
            $table: $db.addresses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PatientsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PatientsTable,
          Patient,
          $$PatientsTableFilterComposer,
          $$PatientsTableOrderingComposer,
          $$PatientsTableAnnotationComposer,
          $$PatientsTableCreateCompanionBuilder,
          $$PatientsTableUpdateCompanionBuilder,
          (Patient, $$PatientsTableReferences),
          Patient,
          PrefetchHooks Function({
            bool userId,
            bool insuranceId,
            bool addressId,
          })
        > {
  $$PatientsTableTableManager(_$AppDatabase db, $PatientsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PatientsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$PatientsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$PatientsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> insuranceId = const Value.absent(),
                Value<int> addressId = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => PatientsCompanion(
                id: id,
                userId: userId,
                insuranceId: insuranceId,
                addressId: addressId,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int insuranceId,
                required int addressId,
                required String name,
              }) => PatientsCompanion.insert(
                id: id,
                userId: userId,
                insuranceId: insuranceId,
                addressId: addressId,
                name: name,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$PatientsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            userId = false,
            insuranceId = false,
            addressId = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (userId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.userId,
                            referencedTable: $$PatientsTableReferences
                                ._userIdTable(db),
                            referencedColumn:
                                $$PatientsTableReferences._userIdTable(db).id,
                          )
                          as T;
                }
                if (insuranceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.insuranceId,
                            referencedTable: $$PatientsTableReferences
                                ._insuranceIdTable(db),
                            referencedColumn:
                                $$PatientsTableReferences
                                    ._insuranceIdTable(db)
                                    .id,
                          )
                          as T;
                }
                if (addressId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.addressId,
                            referencedTable: $$PatientsTableReferences
                                ._addressIdTable(db),
                            referencedColumn:
                                $$PatientsTableReferences
                                    ._addressIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PatientsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PatientsTable,
      Patient,
      $$PatientsTableFilterComposer,
      $$PatientsTableOrderingComposer,
      $$PatientsTableAnnotationComposer,
      $$PatientsTableCreateCompanionBuilder,
      $$PatientsTableUpdateCompanionBuilder,
      (Patient, $$PatientsTableReferences),
      Patient,
      PrefetchHooks Function({bool userId, bool insuranceId, bool addressId})
    >;
typedef $$DoctorInsurancesTableCreateCompanionBuilder =
    DoctorInsurancesCompanion Function({
      required int crm,
      required int insuranceId,
      Value<int> rowid,
    });
typedef $$DoctorInsurancesTableUpdateCompanionBuilder =
    DoctorInsurancesCompanion Function({
      Value<int> crm,
      Value<int> insuranceId,
      Value<int> rowid,
    });

final class $$DoctorInsurancesTableReferences
    extends
        BaseReferences<_$AppDatabase, $DoctorInsurancesTable, DoctorInsurance> {
  $$DoctorInsurancesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DoctorsTable _crmTable(_$AppDatabase db) => db.doctors.createAlias(
    $_aliasNameGenerator(db.doctorInsurances.crm, db.doctors.crm),
  );

  $$DoctorsTableProcessedTableManager get crm {
    final $_column = $_itemColumn<int>('crm')!;

    final manager = $$DoctorsTableTableManager(
      $_db,
      $_db.doctors,
    ).filter((f) => f.crm.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_crmTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $InsurancesTable _insuranceIdTable(_$AppDatabase db) =>
      db.insurances.createAlias(
        $_aliasNameGenerator(db.doctorInsurances.insuranceId, db.insurances.id),
      );

  $$InsurancesTableProcessedTableManager get insuranceId {
    final $_column = $_itemColumn<int>('insurance_id')!;

    final manager = $$InsurancesTableTableManager(
      $_db,
      $_db.insurances,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_insuranceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DoctorInsurancesTableFilterComposer
    extends Composer<_$AppDatabase, $DoctorInsurancesTable> {
  $$DoctorInsurancesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DoctorsTableFilterComposer get crm {
    final $$DoctorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.crm,
      referencedTable: $db.doctors,
      getReferencedColumn: (t) => t.crm,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorsTableFilterComposer(
            $db: $db,
            $table: $db.doctors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InsurancesTableFilterComposer get insuranceId {
    final $$InsurancesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.insuranceId,
      referencedTable: $db.insurances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsurancesTableFilterComposer(
            $db: $db,
            $table: $db.insurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoctorInsurancesTableOrderingComposer
    extends Composer<_$AppDatabase, $DoctorInsurancesTable> {
  $$DoctorInsurancesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DoctorsTableOrderingComposer get crm {
    final $$DoctorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.crm,
      referencedTable: $db.doctors,
      getReferencedColumn: (t) => t.crm,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorsTableOrderingComposer(
            $db: $db,
            $table: $db.doctors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InsurancesTableOrderingComposer get insuranceId {
    final $$InsurancesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.insuranceId,
      referencedTable: $db.insurances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsurancesTableOrderingComposer(
            $db: $db,
            $table: $db.insurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoctorInsurancesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoctorInsurancesTable> {
  $$DoctorInsurancesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$DoctorsTableAnnotationComposer get crm {
    final $$DoctorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.crm,
      referencedTable: $db.doctors,
      getReferencedColumn: (t) => t.crm,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorsTableAnnotationComposer(
            $db: $db,
            $table: $db.doctors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$InsurancesTableAnnotationComposer get insuranceId {
    final $$InsurancesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.insuranceId,
      referencedTable: $db.insurances,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$InsurancesTableAnnotationComposer(
            $db: $db,
            $table: $db.insurances,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoctorInsurancesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DoctorInsurancesTable,
          DoctorInsurance,
          $$DoctorInsurancesTableFilterComposer,
          $$DoctorInsurancesTableOrderingComposer,
          $$DoctorInsurancesTableAnnotationComposer,
          $$DoctorInsurancesTableCreateCompanionBuilder,
          $$DoctorInsurancesTableUpdateCompanionBuilder,
          (DoctorInsurance, $$DoctorInsurancesTableReferences),
          DoctorInsurance,
          PrefetchHooks Function({bool crm, bool insuranceId})
        > {
  $$DoctorInsurancesTableTableManager(
    _$AppDatabase db,
    $DoctorInsurancesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$DoctorInsurancesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DoctorInsurancesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$DoctorInsurancesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> crm = const Value.absent(),
                Value<int> insuranceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoctorInsurancesCompanion(
                crm: crm,
                insuranceId: insuranceId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int crm,
                required int insuranceId,
                Value<int> rowid = const Value.absent(),
              }) => DoctorInsurancesCompanion.insert(
                crm: crm,
                insuranceId: insuranceId,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DoctorInsurancesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({crm = false, insuranceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (crm) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.crm,
                            referencedTable: $$DoctorInsurancesTableReferences
                                ._crmTable(db),
                            referencedColumn:
                                $$DoctorInsurancesTableReferences
                                    ._crmTable(db)
                                    .crm,
                          )
                          as T;
                }
                if (insuranceId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.insuranceId,
                            referencedTable: $$DoctorInsurancesTableReferences
                                ._insuranceIdTable(db),
                            referencedColumn:
                                $$DoctorInsurancesTableReferences
                                    ._insuranceIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DoctorInsurancesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DoctorInsurancesTable,
      DoctorInsurance,
      $$DoctorInsurancesTableFilterComposer,
      $$DoctorInsurancesTableOrderingComposer,
      $$DoctorInsurancesTableAnnotationComposer,
      $$DoctorInsurancesTableCreateCompanionBuilder,
      $$DoctorInsurancesTableUpdateCompanionBuilder,
      (DoctorInsurance, $$DoctorInsurancesTableReferences),
      DoctorInsurance,
      PrefetchHooks Function({bool crm, bool insuranceId})
    >;
typedef $$DoctorSchedulesTableCreateCompanionBuilder =
    DoctorSchedulesCompanion Function({
      required int doctorCrm,
      required String weekday,
      required DateTime date,
      required String status,
      Value<int> rowid,
    });
typedef $$DoctorSchedulesTableUpdateCompanionBuilder =
    DoctorSchedulesCompanion Function({
      Value<int> doctorCrm,
      Value<String> weekday,
      Value<DateTime> date,
      Value<String> status,
      Value<int> rowid,
    });

final class $$DoctorSchedulesTableReferences
    extends
        BaseReferences<_$AppDatabase, $DoctorSchedulesTable, DoctorSchedule> {
  $$DoctorSchedulesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DoctorsTable _doctorCrmTable(_$AppDatabase db) =>
      db.doctors.createAlias(
        $_aliasNameGenerator(db.doctorSchedules.doctorCrm, db.doctors.crm),
      );

  $$DoctorsTableProcessedTableManager get doctorCrm {
    final $_column = $_itemColumn<int>('doctor_crm')!;

    final manager = $$DoctorsTableTableManager(
      $_db,
      $_db.doctors,
    ).filter((f) => f.crm.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_doctorCrmTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DoctorSchedulesTableFilterComposer
    extends Composer<_$AppDatabase, $DoctorSchedulesTable> {
  $$DoctorSchedulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$DoctorsTableFilterComposer get doctorCrm {
    final $$DoctorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.doctorCrm,
      referencedTable: $db.doctors,
      getReferencedColumn: (t) => t.crm,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorsTableFilterComposer(
            $db: $db,
            $table: $db.doctors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoctorSchedulesTableOrderingComposer
    extends Composer<_$AppDatabase, $DoctorSchedulesTable> {
  $$DoctorSchedulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get weekday => $composableBuilder(
    column: $table.weekday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$DoctorsTableOrderingComposer get doctorCrm {
    final $$DoctorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.doctorCrm,
      referencedTable: $db.doctors,
      getReferencedColumn: (t) => t.crm,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorsTableOrderingComposer(
            $db: $db,
            $table: $db.doctors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoctorSchedulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DoctorSchedulesTable> {
  $$DoctorSchedulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get weekday =>
      $composableBuilder(column: $table.weekday, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$DoctorsTableAnnotationComposer get doctorCrm {
    final $$DoctorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.doctorCrm,
      referencedTable: $db.doctors,
      getReferencedColumn: (t) => t.crm,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DoctorsTableAnnotationComposer(
            $db: $db,
            $table: $db.doctors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DoctorSchedulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DoctorSchedulesTable,
          DoctorSchedule,
          $$DoctorSchedulesTableFilterComposer,
          $$DoctorSchedulesTableOrderingComposer,
          $$DoctorSchedulesTableAnnotationComposer,
          $$DoctorSchedulesTableCreateCompanionBuilder,
          $$DoctorSchedulesTableUpdateCompanionBuilder,
          (DoctorSchedule, $$DoctorSchedulesTableReferences),
          DoctorSchedule,
          PrefetchHooks Function({bool doctorCrm})
        > {
  $$DoctorSchedulesTableTableManager(
    _$AppDatabase db,
    $DoctorSchedulesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$DoctorSchedulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$DoctorSchedulesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$DoctorSchedulesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> doctorCrm = const Value.absent(),
                Value<String> weekday = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoctorSchedulesCompanion(
                doctorCrm: doctorCrm,
                weekday: weekday,
                date: date,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int doctorCrm,
                required String weekday,
                required DateTime date,
                required String status,
                Value<int> rowid = const Value.absent(),
              }) => DoctorSchedulesCompanion.insert(
                doctorCrm: doctorCrm,
                weekday: weekday,
                date: date,
                status: status,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$DoctorSchedulesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({doctorCrm = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (doctorCrm) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.doctorCrm,
                            referencedTable: $$DoctorSchedulesTableReferences
                                ._doctorCrmTable(db),
                            referencedColumn:
                                $$DoctorSchedulesTableReferences
                                    ._doctorCrmTable(db)
                                    .crm,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DoctorSchedulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DoctorSchedulesTable,
      DoctorSchedule,
      $$DoctorSchedulesTableFilterComposer,
      $$DoctorSchedulesTableOrderingComposer,
      $$DoctorSchedulesTableAnnotationComposer,
      $$DoctorSchedulesTableCreateCompanionBuilder,
      $$DoctorSchedulesTableUpdateCompanionBuilder,
      (DoctorSchedule, $$DoctorSchedulesTableReferences),
      DoctorSchedule,
      PrefetchHooks Function({bool doctorCrm})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AddressesTableTableManager get addresses =>
      $$AddressesTableTableManager(_db, _db.addresses);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ClinicsTableTableManager get clinics =>
      $$ClinicsTableTableManager(_db, _db.clinics);
  $$DoctorsTableTableManager get doctors =>
      $$DoctorsTableTableManager(_db, _db.doctors);
  $$InsurancesTableTableManager get insurances =>
      $$InsurancesTableTableManager(_db, _db.insurances);
  $$PatientsTableTableManager get patients =>
      $$PatientsTableTableManager(_db, _db.patients);
  $$DoctorInsurancesTableTableManager get doctorInsurances =>
      $$DoctorInsurancesTableTableManager(_db, _db.doctorInsurances);
  $$DoctorSchedulesTableTableManager get doctorSchedules =>
      $$DoctorSchedulesTableTableManager(_db, _db.doctorSchedules);
}
