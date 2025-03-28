class Dummy {
  String getTicketResponse = '''
      {"no_tiket_anda":"6001",
      "no_sekarang":null,
      "masa_menunggu":2,
      "kedudukan_menunggu":1,
      "no_siri":"6000",
      "transid":"8d32fc2d567e6fbcb333983a1ddbb247b5071800",
      "cawangan":"0105041A",
      "sesi":"1",
      "waktuMula":"08:00:00",
      "waktuTamat":"18:00:00"}''';

  String refreshWaitingTime = '''
    {
        "no_sekarang": "6001",
        "masa_menunggu": 1,
        "cawangan": "0105041A",
        "kedudukan_menunggu": 3,
        "sesiTiket": null,
        "sesi": "3"
    }''';

  String getCounterResponse = '''
    {
      "status":0,
      "msg":"SUCCESS",
      "no_tiket":null,
      "kaunter":"4"
    }''';

  String getServiceGroupResponse =
      '{"status": "0","msg": "All Clear","data2": [{"id": "135","keterangan": "Pelesenan","kategori": "2","had_kategori": null,"info": [{"keterangan": "Pembaharuan Lesen Memandu Malaysia (CDL)"},{"keterangan": "Pindaan Alamat"},{"keterangan": "Permohonan Pembaharuan Lesen Belajar Memandu (LDL)"},{"keterangan": "Permohonan Lesen Memandu Baharu (PDL ke CDL)"},{"keterangan": "Permohonan Permbaharuan Lesen Memandu (CDL)"},{"keterangan": "Permohonan Lesen Memandu Baharu (PDL kepada CDL)"},{"keterangan": "Permohonan Lesen Memandu Baharu (PDL)"},{"keterangan": "Permohonan Lesen Memandu Baharu (LDL)"},{"keterangan": "Permohonan Pembaharuan Lesen Vokasional"},{"keterangan": "Permohonan Salinan Lesen Memandu"},{"keterangan": "Permohonan Salinan Gantian Lesen Memandu"},{"keterangan": "Permohonan Permit Pemandu Antarabangsa (IDP)"},{"keterangan": "Permohonan Tambah Kelas Lesen Memandu"},{"keterangan": "Permohonan Butir-butir dan Pengesahan Lesen Memandu"},{"keterangan": "Permohonan Pengemaskinian Maklumat Peribadi Pemilik"},{"keterangan": "Permohonan pembaharuan lesen memandu (LDL / CDL) dan lesen vokasional (PSV / GDL / Konduktor) "},{"keterangan": "Permohonan salinan lesen memandu (LDL / PDL / CDL) dan lesen vokasional (PSV / GDL / Konduktor) "},{"keterangan": "Permohonan gantian lesen memandu dan lesen vokasional"},{"keterangan": "Permohonan butir-butir lesen memandu - permohonan oleh pemilik sahaja"},{"keterangan": "Permohonan pembaharuan lesen memandu (CDL) untuk kegunaan perkhidmatan awam dan barangan sahaja"},{"keterangan": "Pembaharuan CDL (PTM / MYKAS / Bukan Warganegara) "},{"keterangan": "Pembaharuan LDL  "},{"keterangan": "Permohonan Baharu GDL / PSV"},{"keterangan": "Permohonan Baharu PDL (PTM / MYKAS / Bukan Warganegara) "},{"keterangan": "Permohonan Baharu PDL (Warganegara)"},{"keterangan": "Permohonan Gantian LDL / PDL / GDL / PSV"},{"keterangan": "Permohonan Salinan GDL / PSV"},{"keterangan": "Permohonan Salinan LDL"},{"keterangan": "Permohonan Salinan PDL / CDL"},{"keterangan": "Permohonan Tambah Kelas GDL / PSV"},{"keterangan": "Permohonan Tambah Kelas LDL  "},{"keterangan": "Pindaan Butiran Lesen  (D>DA / B>B2)  "},{"keterangan": "Pembaharuan CDL Pemandu/ Penunggang p-Hailing"},{"keterangan": "Pembaharuan CDL - urusniaga atas talian"}]},{"id": "335","keterangan": "Pelbagai","kategori": "2","had_kategori": null,"info": [{"keterangan": "Khas"},{"keterangan": "Permohonan Pembaharuan Lesen Kenderaan Motor (LKM)"},{"keterangan": "Pembayaran Saman "},{"keterangan": "Permohonan Pembaharuan Lesen Belajar Memandu (LDL)"},{"keterangan": "Permohonan Lesen Memandu Baharu (PDL ke CDL)"},{"keterangan": "Permohonan Gantian Vehicle Of Certication (VOC)"},{"keterangan": "Permohonan Permbaharuan Lesen Memandu (CDL)"},{"keterangan": "Permohonan Pembaharuan Lesen Vokasional"},{"keterangan": "Permohonan Permit Pemandu Antarabangsa (IDP)"},{"keterangan": "Permohonan Pengemaskinian Maklumat Peribadi Pemilik"},{"keterangan": "Permohonan Pindaan Alamat Pemilik"},{"keterangan": "Permohonan Pembatalan Tuntutan E-Hakmilik"},{"keterangan": "Permohonan ID Awam"},{"keterangan": "Cetakan Lesen Memandu bagi Urusan Pembaharuan Lesen\\r\\n Memandu Malaysia (LMM) secara online di Portal JPJ\\r\\n"},{"keterangan": "Permohonan salinan Lesen Kenderaan Motor  (LKM) - kenderaan persendirian individu sahaja"},{"keterangan": "Permohonan gantian Lesen Kenderaan Motor  (LKM)  - kenderaan persendirian individu sahaja"},{"keterangan": "Permohonan salinan Sijil Pemilikan Kenderaan (VOC)  - kenderaan persendirian individu sahaja"},{"keterangan": "Permohonan pertukaran hak milik kenderaan - kenderaan persendirian individu sahaja"},{"keterangan": "Permohonan butir-butir insuran kenderaan - permohonan oleh pemilik berdaftar sahaja"},{"keterangan": "Permohonan butir-butir maklumat kenderaan - permohonan oleh pemilik berdaftar sahaja"},{"keterangan": "Permohonan bayaran balik Lesen Kenderaan Motor  (LKM) (terima permohonan sahaja, proses dibuat di JPJ Negeri/Cawangan)"},{"keterangan": "Cetakan Sijil Pemilikan Kenderaan (VOC) bagi urusan pertukaran hak milik\\r\\nsecara online di Portal JPJ\\r\\n"},{"keterangan": "Cetakan Lesen Kenderaan Motor  (LKM) bagi urusniaga pembaharuan LKM secara Online di Portal JPJ"},{"keterangan": "Cetakan Sijil Pemilikan Kenderaan (VOC)  bagi urusniaga Pendaftaran Kali Pertama Secara\\r\\nOnline di Portal JPJ\\r\\n"},{"keterangan": "Cetakan Lesen Kenderaan Motor  (LKM) bagi urusniaga Pendaftaran Kali Pertama Secara \\r\\nOnline di Portal JPJ\\r\\n"},{"keterangan": "Permohonan butir-butir lesen memandu - permohonan oleh pemilik sahaja"},{"keterangan": "Permohonan Gantian LDL / PDL / GDL / PSV"},{"keterangan": "Permohonan Salinan GDL / PSV"},{"keterangan": "Permohonan Salinan PDL / CDL"}]},{"id": "352","keterangan": "Kiosk","kategori": "2","had_kategori": null,"info": [{"keterangan": "Pembayaran Saman "},{"keterangan": "Permohonan Butir-butir Maklumat Kenderaan"},{"keterangan": "Permohonan Butir-butir Maklumat Insuran Kenderaan"},{"keterangan": "Cetakan Sijil Pemilikan Kenderaan (VOC) bagi urusan pertukaran hak milik\\r\\nsecara online di Portal JPJ\\r\\n"},{"keterangan": "Cetakan Lesen Kenderaan Motor  (LKM) bagi urusniaga pembaharuan LKM secara Online di Portal JPJ"},{"keterangan": "Cetakan Lesen Kenderaan Motor  (LKM) bagi urusniaga Pendaftaran Kali Pertama Secara \\r\\nOnline di Portal JPJ\\r\\n"},{"keterangan": "Permohonan salinan Lesen Kenderaan Motor  (LKM)  - kenderaan persendirian individu selain motosikal sahaja"},{"keterangan": "Cetakan Sijil Pemilikan Kenderaan (VOC)  bagi urusniaga Pendaftaran Kali Pertama Secara Online di Portal JPJ"}]},{"id": "591","keterangan": "Penguatkuasaan","kategori": "2","had_kategori": null,"info": [{"keterangan": "Permohonan Bayaran Kompaun"}]},{"id": "963","keterangan": "Pemeriksaan Kenderaan (KA)","kategori": "2","had_kategori": null,"info": [{"keterangan": "Pelbagai"}]}]}';
}
