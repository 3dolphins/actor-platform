create table twilio_authy_codes (
    transaction_hash varchar(255) not null,
    phone_number varchar(255) not null,
    country_code varchar(255) not null,
    is_deleted boolean not null,
    primary key(transaction_hash)
);