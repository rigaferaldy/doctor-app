import 'package:chatdoctor/model/Doctor.dart';
import 'package:chatdoctor/model/base-doctor.dart';

class Cardiologist extends BaseDoctor {


  @override
  String? printJob() {
    return """
1. Pemeriksaan dan Diagnosis:
   - Melakukan pemeriksaan fisik dan tes diagnostik seperti elektrokardiogram (EKG), ekokardiogram, dan tes stres jantung untuk mendeteksi kelainan jantung.
   - Mendiagnosis berbagai kondisi jantung seperti penyakit arteri koroner, gagal jantung, aritmia, dan hipertensi.

2. Pengelolaan dan Perawatan Pasien:
   - Merencanakan dan mengelola perawatan untuk pasien dengan kondisi jantung, termasuk meresepkan obat-obatan, merekomendasikan perubahan gaya hidup, dan melakukan prosedur intervensional.
   - Mengawasi pemulihan pasien pasca operasi jantung dan memberikan panduan untuk rehabilitasi kardiovaskular.

3. Pelaksanaan Prosedur Medis:
   - Melakukan prosedur seperti angiografi, angioplasti, pemasangan stent, dan ablasi untuk mengobati penyakit jantung.
   - Mengelola perawatan pasien yang membutuhkan alat pacu jantung atau defibrillator implan.

4. Pencegahan dan Edukasi:
   - Memberikan edukasi kepada pasien tentang cara mencegah penyakit jantung melalui diet, olahraga, manajemen stres, dan berhenti merokok.
   - Membantu pasien mengelola faktor risiko seperti tekanan darah tinggi, kolesterol, dan diabetes.

5. Penelitian dan Pengembangan:
   - Terlibat dalam penelitian klinis untuk meningkatkan pengobatan dan pemahaman tentang penyakit kardiovaskular.
   - Mengikuti perkembangan terbaru dalam kardiologi dan menerapkan teknologi dan metode perawatan terbaru.

6. Koordinasi dengan Tim Medis:
   - Bekerja sama dengan dokter bedah jantung, perawat, dan spesialis lain untuk memberikan perawatan komprehensif kepada pasien.
   - Mengkonsultasikan kasus-kasus kompleks dengan tim medis lainnya untuk diagnosis dan perawatan yang optimal.

7. Dokumentasi dan Administrasi:
   - Mencatat semua pemeriksaan, diagnosis, pengobatan, dan prosedur dalam catatan medis pasien secara akurat dan tepat waktu.
   - Mengelola aspek administrasi seperti penulisan laporan medis, surat rujukan, dan dokumen asuransi.
    """;
  }

  Cardiologist(): super();
}
