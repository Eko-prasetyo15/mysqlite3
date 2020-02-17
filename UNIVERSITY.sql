create table mahasiswa(
   id_nim integer primary key,
   nama varchar (40),
   alamat varchar (90),
   jurusan varchar (30) 
);
 insert into mahasiswa(id_nim,nama,alamat,jurusan) values (1, 'eko', 'bandung', 'j001')


create table jurusan(
    id_jurusan varchar primary key,
    namajurusan varchar(30)
    
);
 insert into jurusan (id_jurusan, namajurusan) values ('j001', "informatika");


create table dosen(
    id_dosen integer primary key,
    nama varchar(30),
);
 insert into dosen(id_dosen,nama) values ('d001','rubi')


create table matakuliah(
    id_matakuliah integer primary key,
    nama varchar (40)
);
 insert into matakuliah(id_matakuliah,nama) values ('js001','javascript')


create table take(
    id integer primary key,
    nilai integer,
    id_dosen integer,
    id_jurusan integer,
    id_matakuliah integer,
    id_nim integer
);
 insert into taka(id, nilai, id_dosen,id_jurusan,id_matakuliah,id_nim,) values ('001',9,'d001','j001','js001',1)
