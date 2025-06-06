CLASS zcl_rna_transcription DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS
      transcribe
        IMPORTING
          strand             TYPE string
        RETURNING
          VALUE(result)      TYPE string.

  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_rna_transcription IMPLEMENTATION.

  METHOD transcribe.
    result := strand.
    REPLACE ALL OCCURENCES OF `A` IN result WITH `U`.
    REPLACE ALL OCCURENCES OF `T` IN result WITH `A`.
    REPLACE ALL OCCURENCES OF `C` IN result WITH `_`.
    REPLACE ALL OCCURENCES OF `G` IN result WITH `C`.
    REPLACE ALL OCCURENCES OF `_` IN result WITH `G`.
  ENDMETHOD.

ENDCLASS.
