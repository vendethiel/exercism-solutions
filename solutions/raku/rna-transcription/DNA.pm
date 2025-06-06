unit class RNA_Transcription;

method to_rna($s is copy) {
  $s.trans("GCTA" => "CGAU");
}