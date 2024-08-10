import 'package:chatdoctor/model/Doctor.dart';
import 'package:chatdoctor/model/base-doctor.dart';

// dokter paru
class Pulmonologist extends BaseDoctor {


  @override
  String? printJob() {
    return """
1. Pemeriksaan dan Diagnosis: 
   - Melakukan pemeriksaan fisik pada pasien yang mengalami gangguan pernapasan, batuk kronis, atau gejala lain yang berkaitan dengan sistem pernapasan.
   - Mendiagnosis penyakit paru-paru seperti asma, bronkitis, pneumonia, tuberkulosis, dan penyakit paru obstruktif kronik (PPOK).

2. Pengelolaan dan Perawatan Pasien:
   - Merencanakan dan mengawasi pengobatan untuk pasien dengan kondisi paru-paru kronis atau akut.
   - Memberikan resep obat, terapi inhalasi, atau prosedur medis lainnya yang sesuai dengan diagnosis.

3. Pelaksanaan Prosedur Medis:
   - Melakukan prosedur diagnostik seperti bronkoskopi, biopsi paru, atau tes fungsi paru untuk evaluasi lebih lanjut.
   - Mengelola ventilasi mekanik dan perawatan intensif bagi pasien dengan gagal napas.

4. Pencegahan dan Edukasi:
   - Memberikan edukasi kepada pasien tentang pencegahan penyakit paru, termasuk berhenti merokok, manajemen alergi, dan tindakan pencegahan lainnya.
   - Menyusun program rehabilitasi paru untuk membantu pasien meningkatkan kualitas hidup mereka.

5. Penelitian dan Pengembangan:
   - Terlibat dalam penelitian klinis untuk meningkatkan pengetahuan dan perawatan terkait penyakit paru.
   - Mengikuti perkembangan terbaru dalam pulmonologi dan menerapkan praktik terbaik berdasarkan bukti ilmiah terbaru.

6. Koordinasi dengan Tim Medis:
   - Bekerja sama dengan dokter spesialis lain, perawat, dan tenaga medis untuk memberikan perawatan holistik kepada pasien.
   - Mengkonsultasikan pasien dengan kondisi kompleks kepada spesialis lain jika diperlukan.

7. Dokumentasi dan Administrasi:
   - Mencatat semua pemeriksaan, diagnosis, dan pengobatan dalam catatan medis pasien secara akurat dan tepat waktu.
   - Mengelola aspek administrasi seperti penulisan laporan medis, surat rujukan, dan formulir asuransi.
    """;
  }
}
