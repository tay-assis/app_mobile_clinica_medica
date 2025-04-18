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
  List<GeneratedColumn> get $columns => [id, addressId, name, imageUrl];
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
  final int addressId;
  final String name;
  final String? imageUrl;
  const Clinic({
    required this.id,
    required this.addressId,
    required this.name,
    this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['address_id'] = Variable<int>(addressId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  ClinicsCompanion toCompanion(bool nullToAbsent) {
    return ClinicsCompanion(
      id: Value(id),
      addressId: Value(addressId),
      name: Value(name),
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
      addressId: serializer.fromJson<int>(json['addressId']),
      name: serializer.fromJson<String>(json['name']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'addressId': serializer.toJson<int>(addressId),
      'name': serializer.toJson<String>(name),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  Clinic copyWith({
    int? id,
    int? addressId,
    String? name,
    Value<String?> imageUrl = const Value.absent(),
  }) => Clinic(
    id: id ?? this.id,
    addressId: addressId ?? this.addressId,
    name: name ?? this.name,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
  );
  Clinic copyWithCompanion(ClinicsCompanion data) {
    return Clinic(
      id: data.id.present ? data.id.value : this.id,
      addressId: data.addressId.present ? data.addressId.value : this.addressId,
      name: data.name.present ? data.name.value : this.name,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Clinic(')
          ..write('id: $id, ')
          ..write('addressId: $addressId, ')
          ..write('name: $name, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, addressId, name, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Clinic &&
          other.id == this.id &&
          other.addressId == this.addressId &&
          other.name == this.name &&
          other.imageUrl == this.imageUrl);
}

class ClinicsCompanion extends UpdateCompanion<Clinic> {
  final Value<int> id;
  final Value<int> addressId;
  final Value<String> name;
  final Value<String?> imageUrl;
  const ClinicsCompanion({
    this.id = const Value.absent(),
    this.addressId = const Value.absent(),
    this.name = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  ClinicsCompanion.insert({
    this.id = const Value.absent(),
    required int addressId,
    required String name,
    this.imageUrl = const Value.absent(),
  }) : addressId = Value(addressId),
       name = Value(name);
  static Insertable<Clinic> custom({
    Expression<int>? id,
    Expression<int>? addressId,
    Expression<String>? name,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (addressId != null) 'address_id': addressId,
      if (name != null) 'name': name,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  ClinicsCompanion copyWith({
    Value<int>? id,
    Value<int>? addressId,
    Value<String>? name,
    Value<String?>? imageUrl,
  }) {
    return ClinicsCompanion(
      id: id ?? this.id,
      addressId: addressId ?? this.addressId,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (addressId.present) {
      map['address_id'] = Variable<int>(addressId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
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
          ..write('addressId: $addressId, ')
          ..write('name: $name, ')
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
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
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
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<int> phone = GeneratedColumn<int>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
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
  Set<GeneratedColumn> get $primaryKey => {crm};
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}phone'],
      ),
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
  final String? name;
  final int? phone;
  final String specialty;
  final String? imageUrl;
  const Doctor({
    required this.crm,
    required this.clinicId,
    this.name,
    this.phone,
    required this.specialty,
    this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['crm'] = Variable<int>(crm);
    map['clinic_id'] = Variable<int>(clinicId);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<int>(phone);
    }
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
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
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
      name: serializer.fromJson<String?>(json['name']),
      phone: serializer.fromJson<int?>(json['phone']),
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
      'name': serializer.toJson<String?>(name),
      'phone': serializer.toJson<int?>(phone),
      'specialty': serializer.toJson<String>(specialty),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  Doctor copyWith({
    int? crm,
    int? clinicId,
    Value<String?> name = const Value.absent(),
    Value<int?> phone = const Value.absent(),
    String? specialty,
    Value<String?> imageUrl = const Value.absent(),
  }) => Doctor(
    crm: crm ?? this.crm,
    clinicId: clinicId ?? this.clinicId,
    name: name.present ? name.value : this.name,
    phone: phone.present ? phone.value : this.phone,
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
  final Value<String?> name;
  final Value<int?> phone;
  final Value<String> specialty;
  final Value<String?> imageUrl;
  const DoctorsCompanion({
    this.crm = const Value.absent(),
    this.clinicId = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.specialty = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  DoctorsCompanion.insert({
    this.crm = const Value.absent(),
    required int clinicId,
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    required String specialty,
    this.imageUrl = const Value.absent(),
  }) : clinicId = Value(clinicId),
       specialty = Value(specialty);
  static Insertable<Doctor> custom({
    Expression<int>? crm,
    Expression<int>? clinicId,
    Expression<String>? name,
    Expression<int>? phone,
    Expression<String>? specialty,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (crm != null) 'crm': crm,
      if (clinicId != null) 'clinic_id': clinicId,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (specialty != null) 'specialty': specialty,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  DoctorsCompanion copyWith({
    Value<int>? crm,
    Value<int>? clinicId,
    Value<String?>? name,
    Value<int?>? phone,
    Value<String>? specialty,
    Value<String?>? imageUrl,
  }) {
    return DoctorsCompanion(
      crm: crm ?? this.crm,
      clinicId: clinicId ?? this.clinicId,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      specialty: specialty ?? this.specialty,
      imageUrl: imageUrl ?? this.imageUrl,
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
          ..write('imageUrl: $imageUrl')
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
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<int> phone = GeneratedColumn<int>(
    'phone',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    insuranceId,
    addressId,
    name,
    email,
    phone,
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
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
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
      email:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}email'],
          )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}phone'],
      ),
    );
  }

  @override
  $PatientsTable createAlias(String alias) {
    return $PatientsTable(attachedDatabase, alias);
  }
}

class Patient extends DataClass implements Insertable<Patient> {
  final int id;
  final int insuranceId;
  final int addressId;
  final String name;
  final String email;
  final int? phone;
  const Patient({
    required this.id,
    required this.insuranceId,
    required this.addressId,
    required this.name,
    required this.email,
    this.phone,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['insurance_id'] = Variable<int>(insuranceId);
    map['address_id'] = Variable<int>(addressId);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<int>(phone);
    }
    return map;
  }

  PatientsCompanion toCompanion(bool nullToAbsent) {
    return PatientsCompanion(
      id: Value(id),
      insuranceId: Value(insuranceId),
      addressId: Value(addressId),
      name: Value(name),
      email: Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
    );
  }

  factory Patient.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Patient(
      id: serializer.fromJson<int>(json['id']),
      insuranceId: serializer.fromJson<int>(json['insuranceId']),
      addressId: serializer.fromJson<int>(json['addressId']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<int?>(json['phone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'insuranceId': serializer.toJson<int>(insuranceId),
      'addressId': serializer.toJson<int>(addressId),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<int?>(phone),
    };
  }

  Patient copyWith({
    int? id,
    int? insuranceId,
    int? addressId,
    String? name,
    String? email,
    Value<int?> phone = const Value.absent(),
  }) => Patient(
    id: id ?? this.id,
    insuranceId: insuranceId ?? this.insuranceId,
    addressId: addressId ?? this.addressId,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone.present ? phone.value : this.phone,
  );
  Patient copyWithCompanion(PatientsCompanion data) {
    return Patient(
      id: data.id.present ? data.id.value : this.id,
      insuranceId:
          data.insuranceId.present ? data.insuranceId.value : this.insuranceId,
      addressId: data.addressId.present ? data.addressId.value : this.addressId,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Patient(')
          ..write('id: $id, ')
          ..write('insuranceId: $insuranceId, ')
          ..write('addressId: $addressId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, insuranceId, addressId, name, email, phone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Patient &&
          other.id == this.id &&
          other.insuranceId == this.insuranceId &&
          other.addressId == this.addressId &&
          other.name == this.name &&
          other.email == this.email &&
          other.phone == this.phone);
}

class PatientsCompanion extends UpdateCompanion<Patient> {
  final Value<int> id;
  final Value<int> insuranceId;
  final Value<int> addressId;
  final Value<String> name;
  final Value<String> email;
  final Value<int?> phone;
  const PatientsCompanion({
    this.id = const Value.absent(),
    this.insuranceId = const Value.absent(),
    this.addressId = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
  });
  PatientsCompanion.insert({
    this.id = const Value.absent(),
    required int insuranceId,
    required int addressId,
    required String name,
    required String email,
    this.phone = const Value.absent(),
  }) : insuranceId = Value(insuranceId),
       addressId = Value(addressId),
       name = Value(name),
       email = Value(email);
  static Insertable<Patient> custom({
    Expression<int>? id,
    Expression<int>? insuranceId,
    Expression<int>? addressId,
    Expression<String>? name,
    Expression<String>? email,
    Expression<int>? phone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (insuranceId != null) 'insurance_id': insuranceId,
      if (addressId != null) 'address_id': addressId,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
    });
  }

  PatientsCompanion copyWith({
    Value<int>? id,
    Value<int>? insuranceId,
    Value<int>? addressId,
    Value<String>? name,
    Value<String>? email,
    Value<int?>? phone,
  }) {
    return PatientsCompanion(
      id: id ?? this.id,
      insuranceId: insuranceId ?? this.insuranceId,
      addressId: addressId ?? this.addressId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<int>(phone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PatientsCompanion(')
          ..write('id: $id, ')
          ..write('insuranceId: $insuranceId, ')
          ..write('addressId: $addressId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('phone: $phone')
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
  static const VerificationMeta _doctorIdMeta = const VerificationMeta(
    'doctorId',
  );
  @override
  late final GeneratedColumn<int> doctorId = GeneratedColumn<int>(
    'doctor_id',
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
        'NOT NULL CHECK(weekday IN (\'MON\', \'TUE\', \'WED\', \'THU\', \'FRI\', \'SAT\', \'SUN\'))',
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
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<String> time = GeneratedColumn<String>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
  List<GeneratedColumn> get $columns => [doctorId, weekday, date, time, status];
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
    if (data.containsKey('doctor_id')) {
      context.handle(
        _doctorIdMeta,
        doctorId.isAcceptableOrUnknown(data['doctor_id']!, _doctorIdMeta),
      );
    } else if (isInserting) {
      context.missing(_doctorIdMeta);
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
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
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
  Set<GeneratedColumn> get $primaryKey => {doctorId, date, time};
  @override
  DoctorSchedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DoctorSchedule(
      doctorId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}doctor_id'],
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
      time:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}time'],
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
  final int doctorId;
  final String weekday;
  final DateTime date;
  final String time;
  final String status;
  const DoctorSchedule({
    required this.doctorId,
    required this.weekday,
    required this.date,
    required this.time,
    required this.status,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['doctor_id'] = Variable<int>(doctorId);
    map['weekday'] = Variable<String>(weekday);
    map['date'] = Variable<DateTime>(date);
    map['time'] = Variable<String>(time);
    map['status'] = Variable<String>(status);
    return map;
  }

  DoctorSchedulesCompanion toCompanion(bool nullToAbsent) {
    return DoctorSchedulesCompanion(
      doctorId: Value(doctorId),
      weekday: Value(weekday),
      date: Value(date),
      time: Value(time),
      status: Value(status),
    );
  }

  factory DoctorSchedule.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DoctorSchedule(
      doctorId: serializer.fromJson<int>(json['doctorId']),
      weekday: serializer.fromJson<String>(json['weekday']),
      date: serializer.fromJson<DateTime>(json['date']),
      time: serializer.fromJson<String>(json['time']),
      status: serializer.fromJson<String>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'doctorId': serializer.toJson<int>(doctorId),
      'weekday': serializer.toJson<String>(weekday),
      'date': serializer.toJson<DateTime>(date),
      'time': serializer.toJson<String>(time),
      'status': serializer.toJson<String>(status),
    };
  }

  DoctorSchedule copyWith({
    int? doctorId,
    String? weekday,
    DateTime? date,
    String? time,
    String? status,
  }) => DoctorSchedule(
    doctorId: doctorId ?? this.doctorId,
    weekday: weekday ?? this.weekday,
    date: date ?? this.date,
    time: time ?? this.time,
    status: status ?? this.status,
  );
  DoctorSchedule copyWithCompanion(DoctorSchedulesCompanion data) {
    return DoctorSchedule(
      doctorId: data.doctorId.present ? data.doctorId.value : this.doctorId,
      weekday: data.weekday.present ? data.weekday.value : this.weekday,
      date: data.date.present ? data.date.value : this.date,
      time: data.time.present ? data.time.value : this.time,
      status: data.status.present ? data.status.value : this.status,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DoctorSchedule(')
          ..write('doctorId: $doctorId, ')
          ..write('weekday: $weekday, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(doctorId, weekday, date, time, status);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DoctorSchedule &&
          other.doctorId == this.doctorId &&
          other.weekday == this.weekday &&
          other.date == this.date &&
          other.time == this.time &&
          other.status == this.status);
}

class DoctorSchedulesCompanion extends UpdateCompanion<DoctorSchedule> {
  final Value<int> doctorId;
  final Value<String> weekday;
  final Value<DateTime> date;
  final Value<String> time;
  final Value<String> status;
  final Value<int> rowid;
  const DoctorSchedulesCompanion({
    this.doctorId = const Value.absent(),
    this.weekday = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
    this.status = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DoctorSchedulesCompanion.insert({
    required int doctorId,
    required String weekday,
    required DateTime date,
    required String time,
    required String status,
    this.rowid = const Value.absent(),
  }) : doctorId = Value(doctorId),
       weekday = Value(weekday),
       date = Value(date),
       time = Value(time),
       status = Value(status);
  static Insertable<DoctorSchedule> custom({
    Expression<int>? doctorId,
    Expression<String>? weekday,
    Expression<DateTime>? date,
    Expression<String>? time,
    Expression<String>? status,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (doctorId != null) 'doctor_id': doctorId,
      if (weekday != null) 'weekday': weekday,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
      if (status != null) 'status': status,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DoctorSchedulesCompanion copyWith({
    Value<int>? doctorId,
    Value<String>? weekday,
    Value<DateTime>? date,
    Value<String>? time,
    Value<String>? status,
    Value<int>? rowid,
  }) {
    return DoctorSchedulesCompanion(
      doctorId: doctorId ?? this.doctorId,
      weekday: weekday ?? this.weekday,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (doctorId.present) {
      map['doctor_id'] = Variable<int>(doctorId.value);
    }
    if (weekday.present) {
      map['weekday'] = Variable<String>(weekday.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (time.present) {
      map['time'] = Variable<String>(time.value);
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
          ..write('doctorId: $doctorId, ')
          ..write('weekday: $weekday, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
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
  late final DoctorDao doctorDao = DoctorDao(this as AppDatabase);
  late final PatientDao patientDao = PatientDao(this as AppDatabase);
  late final DoctorScheduleDao doctorScheduleDao = DoctorScheduleDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    addresses,
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
typedef $$ClinicsTableCreateCompanionBuilder =
    ClinicsCompanion Function({
      Value<int> id,
      required int addressId,
      required String name,
      Value<String?> imageUrl,
    });
typedef $$ClinicsTableUpdateCompanionBuilder =
    ClinicsCompanion Function({
      Value<int> id,
      Value<int> addressId,
      Value<String> name,
      Value<String?> imageUrl,
    });

final class $$ClinicsTableReferences
    extends BaseReferences<_$AppDatabase, $ClinicsTable, Clinic> {
  $$ClinicsTableReferences(super.$_db, super.$_table, super.$_typedResult);

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

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

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

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

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

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

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
          PrefetchHooks Function({bool addressId, bool doctorsRefs})
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
                Value<int> addressId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => ClinicsCompanion(
                id: id,
                addressId: addressId,
                name: name,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int addressId,
                required String name,
                Value<String?> imageUrl = const Value.absent(),
              }) => ClinicsCompanion.insert(
                id: id,
                addressId: addressId,
                name: name,
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
          prefetchHooksCallback: ({addressId = false, doctorsRefs = false}) {
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
      PrefetchHooks Function({bool addressId, bool doctorsRefs})
    >;
typedef $$DoctorsTableCreateCompanionBuilder =
    DoctorsCompanion Function({
      Value<int> crm,
      required int clinicId,
      Value<String?> name,
      Value<int?> phone,
      required String specialty,
      Value<String?> imageUrl,
    });
typedef $$DoctorsTableUpdateCompanionBuilder =
    DoctorsCompanion Function({
      Value<int> crm,
      Value<int> clinicId,
      Value<String?> name,
      Value<int?> phone,
      Value<String> specialty,
      Value<String?> imageUrl,
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
      db.doctorSchedules.doctorId,
    ),
  );

  $$DoctorSchedulesTableProcessedTableManager get doctorSchedulesRefs {
    final manager = $$DoctorSchedulesTableTableManager(
      $_db,
      $_db.doctorSchedules,
    ).filter((f) => f.doctorId.crm.sqlEquals($_itemColumn<int>('crm')!));

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
      getReferencedColumn: (t) => t.doctorId,
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
      getReferencedColumn: (t) => t.doctorId,
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
                Value<String?> name = const Value.absent(),
                Value<int?> phone = const Value.absent(),
                Value<String> specialty = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => DoctorsCompanion(
                crm: crm,
                clinicId: clinicId,
                name: name,
                phone: phone,
                specialty: specialty,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> crm = const Value.absent(),
                required int clinicId,
                Value<String?> name = const Value.absent(),
                Value<int?> phone = const Value.absent(),
                required String specialty,
                Value<String?> imageUrl = const Value.absent(),
              }) => DoctorsCompanion.insert(
                crm: crm,
                clinicId: clinicId,
                name: name,
                phone: phone,
                specialty: specialty,
                imageUrl: imageUrl,
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
                            (e) => e.doctorId == item.crm,
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
      required int insuranceId,
      required int addressId,
      required String name,
      required String email,
      Value<int?> phone,
    });
typedef $$PatientsTableUpdateCompanionBuilder =
    PatientsCompanion Function({
      Value<int> id,
      Value<int> insuranceId,
      Value<int> addressId,
      Value<String> name,
      Value<String> email,
      Value<int?> phone,
    });

final class $$PatientsTableReferences
    extends BaseReferences<_$AppDatabase, $PatientsTable, Patient> {
  $$PatientsTableReferences(super.$_db, super.$_table, super.$_typedResult);

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

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

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

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

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

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<int> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

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
          PrefetchHooks Function({bool insuranceId, bool addressId})
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
                Value<int> insuranceId = const Value.absent(),
                Value<int> addressId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<int?> phone = const Value.absent(),
              }) => PatientsCompanion(
                id: id,
                insuranceId: insuranceId,
                addressId: addressId,
                name: name,
                email: email,
                phone: phone,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int insuranceId,
                required int addressId,
                required String name,
                required String email,
                Value<int?> phone = const Value.absent(),
              }) => PatientsCompanion.insert(
                id: id,
                insuranceId: insuranceId,
                addressId: addressId,
                name: name,
                email: email,
                phone: phone,
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
          prefetchHooksCallback: ({insuranceId = false, addressId = false}) {
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
      PrefetchHooks Function({bool insuranceId, bool addressId})
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
      required int doctorId,
      required String weekday,
      required DateTime date,
      required String time,
      required String status,
      Value<int> rowid,
    });
typedef $$DoctorSchedulesTableUpdateCompanionBuilder =
    DoctorSchedulesCompanion Function({
      Value<int> doctorId,
      Value<String> weekday,
      Value<DateTime> date,
      Value<String> time,
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

  static $DoctorsTable _doctorIdTable(_$AppDatabase db) =>
      db.doctors.createAlias(
        $_aliasNameGenerator(db.doctorSchedules.doctorId, db.doctors.crm),
      );

  $$DoctorsTableProcessedTableManager get doctorId {
    final $_column = $_itemColumn<int>('doctor_id')!;

    final manager = $$DoctorsTableTableManager(
      $_db,
      $_db.doctors,
    ).filter((f) => f.crm.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_doctorIdTable($_db));
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

  ColumnFilters<String> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  $$DoctorsTableFilterComposer get doctorId {
    final $$DoctorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.doctorId,
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

  ColumnOrderings<String> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  $$DoctorsTableOrderingComposer get doctorId {
    final $$DoctorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.doctorId,
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

  GeneratedColumn<String> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  $$DoctorsTableAnnotationComposer get doctorId {
    final $$DoctorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.doctorId,
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
          PrefetchHooks Function({bool doctorId})
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
                Value<int> doctorId = const Value.absent(),
                Value<String> weekday = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> time = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DoctorSchedulesCompanion(
                doctorId: doctorId,
                weekday: weekday,
                date: date,
                time: time,
                status: status,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int doctorId,
                required String weekday,
                required DateTime date,
                required String time,
                required String status,
                Value<int> rowid = const Value.absent(),
              }) => DoctorSchedulesCompanion.insert(
                doctorId: doctorId,
                weekday: weekday,
                date: date,
                time: time,
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
          prefetchHooksCallback: ({doctorId = false}) {
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
                if (doctorId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.doctorId,
                            referencedTable: $$DoctorSchedulesTableReferences
                                ._doctorIdTable(db),
                            referencedColumn:
                                $$DoctorSchedulesTableReferences
                                    ._doctorIdTable(db)
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
      PrefetchHooks Function({bool doctorId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AddressesTableTableManager get addresses =>
      $$AddressesTableTableManager(_db, _db.addresses);
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
