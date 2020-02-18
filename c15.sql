create table mahasiswa(
   id_nim varchar(30) primary key,
   nama varchar (40),
   alamat varchar (90),
   jurusan varchar (30), 
   umur integer,
   foreign key (jurusan) references jurusan (id_jurusan)
);

insert into mahasiswa(id_nim,nama,alamat,jurusan,umur) values ('M001', 'Eko', 'bandung', 'J001',20);
insert into mahasiswa(id_nim,nama,alamat,jurusan,umur) values ('M002', 'Yasa', 'bandung', 'J002',19);
insert into mahasiswa(id_nim,nama,alamat,jurusan,umur) values ('M003', 'Romi', 'bandung', 'J003',18);
insert into mahasiswa(id_nim,nama,alamat,jurusan,umur) values ('M004', 'Asep', 'bandung', 'J004',22);
insert into mahasiswa(id_nim,nama,alamat,jurusan,umur) values ('M005', 'Rajan', 'bandung', 'J002',19);

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
    nama varchar (40),
    sks integer
);
 insert into matakuliah(id_matakuliah,nama) values ('MK001','HTML',3);
 insert into matakuliah(id_matakuliah,nama) values ('MK002','PHP',3);
 insert into matakuliah(id_matakuliah,nama) values ('MK003','C++',3);
 insert into matakuliah(id_matakuliah,nama) values ('MK004','javascript',2);
 insert into matakuliah(id_matakuliah,nama) values ('MK005','Phyton',3);


create table kontrak (
    id varchar (30) primary key,
    nilai integer,
    id_dosen varchar (30),
    id_matakuliah varchar (30),
    id_nim varchar (30),
    foreign key (id_dosen) references dosen (id_dosen),
    foreign key (id_matakuliah) references matakuliah (id_matakuliah),
    foreign key (id_nim) references mahasiswa (id_nim)
);
 insert into kontrak (id,nilai,id_dosen,id_matakuliah,id_nim) values ('N001',9,'DS002','MK003','M001');
 insert into kontrak (id,nilai,id_dosen,id_matakuliah,id_nim) values ('N002',8,'DS001','MK004','M002');
 insert into kontrak (id,nilai,id_dosen,id_matakuliah,id_nim) values ('N003',9,'DS002','MK002','M003');
 insert into kontrak (id,nilai,id_dosen,id_matakuliah,id_nim) values ('N004',9,'DS001','MK001','M004');
 insert into kontrak (id,nilai,id_dosen,id_matakuliah,id_nim) values ('N005',8,'DS001','MK004','M001');
 insert into kontrak (id,nilai,id_dosen,id_matakuliah,id_nim) values ('N006',9,'DS002','MK002','M001');
 insert into kontrak (id,nilai,id_dosen,id_matakuliah,id_nim) values ('N007',9,'DS001','MK001','M001');
 insert into kontrak (id,nilai,id_dosen,id_matakuliah,id_nim) values ('N008',9,'DS001','MK006','M001');
 
 


-- menampilkan table nama jurusan
SELECT 
   id_nim,
   nama,
   alamat,
   namajurusan
FROM
   mahasiswa , jurusan
WHERE
   mahasiswa.jurusan = jurusan.id_jurusan;

-- menampilkan data umur di bawah 20th
SELECT 
   id_nim,
   nama,
   alamat,
   jurusan
FROM
   mahasiswa
WHERE
   umur < 20

-- menambah column baru 
ALTER TABLE MAHASISWA ADD UMUR INTEGER;
 
--  update nilai mahasiswa
UPDATE take SET nilai = 'A' WHERE ID ="N001";
UPDATE take SET nilai = 'B' WHERE ID ="N002";
UPDATE take SET nilai = 'A' WHERE ID ="N003";
UPDATE take SET nilai = 'C' WHERE ID ="N004";
UPDATE take SET nilai = 'D' WHERE ID ="N005";
UPDATE take SET nilai = 'B' WHERE ID ="N006";
UPDATE take SET nilai = 'A' WHERE ID ="N007";
UPDATE take SET nilai = 'A' WHERE ID ="N008";

-- menampilkan nilai di atas B
SELECT 
   id,
   nilai,
   id_dosen,
   id_matakuliah,
   id_nim
FROM
   take
WHERE
   nilai <= 'B'

-- menambah value sks 

UPDATE matakuliah SET sks = 3 WHERE id_matakuliah ="MK001";
UPDATE matakuliah SET sks = 3 WHERE id_matakuliah ="MK002";
UPDATE matakuliah SET sks = 3 WHERE id_matakuliah ="MK003";
UPDATE matakuliah SET sks = 2 WHERE id_matakuliah ="MK004";
UPDATE matakuliah SET sks = 3 WHERE Id_matakuliah ="MK005";
UPDATE matakuliah SET sks = 3 WHERE Id_matakuliah ="MK006";



-- menggabungkan table kontrak, matakuliah, mahasiswa & mencari mahasiswa yang memiliki lebih dari 10sks
SELECT id, nilai, mahasiswa.nama,matakuliah.nama, SUM(sks)
FROM kontrak 
INNER JOIN mahasiswa ON kontrak.id_nim = mahasiswa.id_nim
JOIN matakuliah ON kontrak.id_matakuliah = matakuliah.id_matakuliah
GROUP BY mahasiswa.nama 
having sum(sks) > 10;

-- mencari mahasiswa yang mengambil data mining
SELECT kontrak.id, kontrak.nilai, mahasiswa.nama,matakuliah.nama
FROM kontrak 
JOIN mahasiswa ON kontrak.id_nim = mahasiswa.id_nim
JOIN matakuliah ON kontrak.id_matakuliah = matakuliah.id_matakuliah
WHERE matakuliah.nama = 'data mining';