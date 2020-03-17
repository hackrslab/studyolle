create sequence hibernate_sequence;

create table account (
    id int8 not null,
    bio varchar(255),
    email varchar(255),
    email_check_token varchar(255),
    email_check_token_generated_at timestamp,
    email_verified boolean not null,
    joined_at timestamp,
    location varchar(255),
    nickname varchar(255),
    occupation varchar(255),
    password varchar(255),
    profile_image text,
    study_created_by_email boolean not null,
    study_created_by_web boolean not null,
    study_enrollment_result_by_email boolean not null,
    study_enrollment_result_by_web boolean not null,
    study_updated_by_email boolean not null,
    study_updated_by_web boolean not null,
    url varchar(255),
    primary key (id)
);

create table account_tags (
    account_id int8 not null,
    tags_id int8 not null,
    primary key (account_id, tags_id)
);

create table account_zones (
    account_id int8 not null,
    zones_id int8 not null,
    primary key (account_id, zones_id)
);

create table enrollment (
    id int8 not null,
    accepted boolean not null,
    attended boolean not null,
    enrolled_at timestamp,
    account_id int8,
    event_id int8,
    primary key (id)
);

create table event (
    id int8 not null,
    created_date_time timestamp not null,
    description text,
    end_date_time timestamp not null,
    end_enrollment_date_time timestamp not null,
    event_type varchar(255),
    limit_of_enrollments int4,
    start_date_time timestamp not null,
    title varchar(255) not null,
    created_by_id int8,
    study_id int8,
    primary key (id)
);

create table notification (
    id int8 not null,
    checked boolean not null,
    created_date_time timestamp,
    link varchar(255),
    message varchar(255),
    notification_type varchar(255),
    title varchar(255),
    account_id int8,
    primary key (id)
);

create table persistent_logins (
    series varchar(64) not null,
    last_used timestamp not null,
    token varchar(64) not null,
    username varchar(64) not null,
    primary key (series)
);

create table study (
    id int8 not null,
    closed boolean not null,
    closed_date_time timestamp,
    full_description text,
    image text,
    member_count int4 not null,
    path varchar(255),
    published boolean not null,
    published_date_time timestamp,
    recruiting boolean not null,
    recruiting_updated_date_time timestamp,
    short_description varchar(255),
    title varchar(255),
    use_banner boolean not null,
    primary key (id)
);

create table study_managers (
    study_id int8 not null,
    managers_id int8 not null,
    primary key (study_id, managers_id)
);

create table study_members (
    study_id int8 not null,
    members_id int8 not null,
    primary key (study_id, members_id)
);

create table study_tags (
    study_id int8 not null,
    tags_id int8 not null,
    primary key (study_id, tags_id)
);

create table study_zones (
    study_id int8 not null,
    zones_id int8 not null,
    primary key (study_id, zones_id)
);

create table tag (
    id int8 not null,
    title varchar(255) not null,
    primary key (id)
);

create table zone (
    id int8 not null,
    city varchar(255) not null,
    local_name_of_city varchar(255) not null,
    province varchar(255),
    primary key (id)
);

alter table if exists account
   drop constraint if exists UK_q0uja26qgu1atulenwup9rxyr;

alter table if exists account
   add constraint UK_q0uja26qgu1atulenwup9rxyr unique (email);

alter table if exists account
   drop constraint if exists UK_s2a5omeaik0sruawqpvs18qfk;

alter table if exists account
    add constraint UK_s2a5omeaik0sruawqpvs18qfk unique (nickname);

alter table if exists study
   drop constraint if exists UK_tp0dsqbqe96klkxcn1cygxvtp;

alter table if exists study
   add constraint UK_tp0dsqbqe96klkxcn1cygxvtp unique (path);

alter table if exists tag
   drop constraint if exists UK_k5g3urrxw2ym0ls8vo6xfgs65;

alter table if exists tag
   add constraint UK_k5g3urrxw2ym0ls8vo6xfgs65 unique (title);

alter table if exists zone
   drop constraint if exists UKbpi2ri94ur6w0um8yw1stvpgg;

alter table if exists zone
   add constraint UKbpi2ri94ur6w0um8yw1stvpgg unique (city, province);

alter table if exists account_tags
   add constraint FK878dw6wexbmp9hm7kmxsquof3
   foreign key (tags_id)
   references tag;

alter table if exists account_tags
   add constraint FKp3bn2fkyg67xosnh8srrff7vn
   foreign key (account_id)
   references account;

alter table if exists account_zones
   add constraint FKfylj4630irdkft4btnpdapvtu
   foreign key (zones_id)
   references zone;

alter table if exists account_zones
   add constraint FKkxfc41bm610t8ryufoijv5l0d
   foreign key (account_id)
   references account;

alter table if exists enrollment
   add constraint FKi8amtgrnxh4an60dnnqjj8a1k
   foreign key (account_id)
   references account;

alter table if exists enrollment
   add constraint FKlo10g4urj8p2je5m2aixypfr4
   foreign key (event_id)
   references event;

alter table if exists event
   add constraint FK6ksdqnga829jl9npgfr2n5623
   foreign key (created_by_id)
   references account;

alter table if exists event
   add constraint FKb21n9vqs7iyptt7vx6v6s2e07
   foreign key (study_id)
   references study;

alter table if exists notification
   add constraint FKj0b1ncedmpl7sx7t7o54t26v2
   foreign key (account_id)
   references account;

alter table if exists study_managers
   add constraint FKs0io7n0ix59jnmbypuot4ni14
   foreign key (managers_id)
   references account;

alter table if exists study_managers
   add constraint FKjpgd3hcqmvn69aa5efclbtxlv
   foreign key (study_id)
   references study;

alter table if exists study_members
   add constraint FKaq9p14pwrcsffyw95j2wfcs00
   foreign key (members_id)
   references account;

alter table if exists study_members
   add constraint FK91e2fjvhd8t9u8m71jtj5jx0g
   foreign key (study_id)
   references study;

alter table if exists study_tags
   add constraint FKjxrh4qj2v71ot7opn2334tdsb
   foreign key (tags_id)
   references tag;

alter table if exists study_tags
   add constraint FKfcda2rd30mutrwq7v7pdfe4ad
   foreign key (study_id)
   references study;

alter table if exists study_zones
   add constraint FKsjy30b9ag1wvjlb7h2k3f3rfm
   foreign key (zones_id)
   references zone;

alter table if exists study_zones
   add constraint FKicj6wsqyb7xw7jhd0kmsrraxt
   foreign key (study_id)
   references study;
