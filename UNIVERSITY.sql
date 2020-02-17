create table mahasiswa(
   id_nim varchar(30) primary key,
   nama varchar (40),
   alamat varchar (90),
   jurusan varchar (30), 
   foreign key (jurusan) references jurusan (id_jurusan)
);

insert into mahasiswa(id_nim,nama,alamat,jurusan) values ('M001', 'Eko', 'bandung', 'J001');
insert into mahasiswa(id_nim,nama,alamat,jurusan) values ('M002', 'Yasa', 'bandung', 'J002');
insert into mahasiswa(id_nim,nama,alamat,jurusan) values ('M003', 'Romi', 'bandung', 'J003');
insert into mahasiswa(id_nim,nama,alamat,jurusan) values ('M004', 'Asep', 'bandung', 'J004');
insert into mahasiswa(id_nim,nama,alamat,jurusan) values ('M005', 'Rajan', 'bandung', 'J002');

create table jurusan(
    id_jurusan varchar (30) primary key,
    namajurusan varchar(30)
);
 insert into jurusan (id_jurusan, namajurusan) values ('J001', "informatika");
 insert into jurusan (id_jurusan, namajurusan) values ('J002', "komunikasi");
 insert into jurusan (id_jurusan, namajurusan) values ('J003', "Manajemen");
 insert into jurusan (id_jurusan, namajurusan) values ('J004', "Hukum");


create table dosen(
    id_dosen varchar(30) primary key,
    nama varchar(30)
);
 insert into dosen(id_dosen,nama) values ('DS001','rubi');
 insert into dosen(id_dosen,nama) values ('DS002','Krina');


create table matakuliah(
    id_matakuliah varchar (30) primary key,
    nama varchar (40)
);
 insert into matakuliah(id_matakuliah,nama) values ('MK001','HTML');
 insert into matakuliah(id_matakuliah,nama) values ('MK002','PHP');
 insert into matakuliah(id_matakuliah,nama) values ('MK003','C++');
 insert into matakuliah(id_matakuliah,nama) values ('MK004','javascript');
 insert into matakuliah(id_matakuliah,nama) values ('MK005','Phyton');


create table take(
    id varchar (30) primary key,
    nilai integer,
    id_dosen varchar (30),
    id_matakuliah varchar (30),
    id_nim varchar (30),
    foreign key (id_dosen) references dosen (id_dosen),
    foreign key (id_matakuliah) references matakuliah (id_matakuliah),
    foreign key (id_nim) references mahasiswa (id_nim)
);
 insert into take(id,nilai,id_dosen,id_matakuliah,id_nim) values ('N001',9,'DS002','MK003','0001');
 insert into take(id,nilai,id_dosen,id_matakuliah,id_nim) values ('N002',8,'DS001','MK004','0002');
 insert into take(id,nilai,id_dosen,id_matakuliah,id_nim) values ('N003',9,'DS002','MK002','0003');
 insert into take(id,nilai,id_dosen,id_matakuliah,id_nim) values ('N004',9,'DS001','MK001','0004');