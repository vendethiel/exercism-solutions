(module
  (import "console" "log_i32_s" (func $log (param i32)))
  (memory (export "mem") 1)

  ;;
  ;; Encode a string using run-length encoding
  ;;
  ;; @param {i32} inputOffset - The offset of the input string in linear memory
  ;; @param {i32} inputLength - The length of the input string in linear memory
  ;;
  ;; @returns {(i32,i32)} - The offset and length of the encoded string in linear memory
  ;;
  (func (export "encode") (param $inputOffset i32) (param $inputLength i32)
    (result i32 i32)
    (local $idx i32)
    (local $length i32)
    (local $lastChar i32)
    (local $curChar i32)
    (local $charCount i32)
    (local $tensCharCount i32)
    (local $tens i32)
    (block $eachCharOuter
      (br_if $eachCharOuter (i32.eqz (local.get $inputLength)))
      (loop $eachCharLoop
        ;; Load cur char
        (block $curCharRead
          (local.set $curChar (i32.const 0)) ;; 0 at end
          (br_if $curCharRead (i32.eq (local.get $idx) (local.get $inputLength)))
          (local.set $curChar (i32.load8_u (i32.add (local.get $inputOffset)
                                                    (local.get $idx))))
          )

        ;; Character changed
        (block $charChanged
          (br_if $charChanged (i32.eq (local.get $curChar)
                                      (local.get $lastChar)))

          ;; write length
          (block $writeLengthOuter
            (br_if $writeLengthOuter (i32.le_s (local.get $charCount)
                                               (i32.const 1)))

            ;; first, count tens so we know how to write digits backwards
            (local.set $tens (i32.const 0))
            (local.set $tensCharCount (local.get $charCount))
            (loop $countTens
              (i32.store8 (i32.add (local.get $length)
                                   (local.get $tens))
                          (i32.const 42))
              (local.set $tens (i32.add (local.get $tens) (i32.const 1)))
              (local.set $tensCharCount (i32.div_s (local.get $tensCharCount)
                                                   (i32.const 10)))
              ;; if the count is >0, loop
              (br_if $countTens (i32.ne (i32.const 0) (local.get $tensCharCount)))
              )

            ;; Reuse $tensCharCount to be our original offset (we could also store $tens and increase $length by $tens later)
            (local.set $tensCharCount (local.get $length))
            (loop $writeLengthInner
              ;; write 48 + ($charCount % 10)
              (local.set $tens (i32.sub (local.get $tens) (i32.const 1)))
              (i32.store8 (i32.add (local.get $tensCharCount)
                                   (local.get $tens))
                          (i32.add (i32.const 48)
                                   (i32.rem_s (local.get $charCount)
                                              (i32.const 10))))
              (local.set $length (i32.add (i32.const 1) (local.get $length)))
              ;; $charCount /= 10
              (local.set $charCount (i32.div_s (local.get $charCount)
                                               (i32.const 10)))
              ;; if the count is >0, loop
              (br_if $writeLengthInner (i32.ne (i32.const 0) (local.get $charCount)))
            )
          )

          ;; write char (skip if empty = first iteration)
          (if (i32.ne (i32.const 0) (local.get $lastChar))
              (then
                (i32.store8 (local.get $length)
                            (local.get $lastChar))
                (local.set $length (i32.add (i32.const 1) (local.get $length)))))

          ;; Reset counter (might be 1)
          (local.set $charCount (i32.const 0))

          ;; old = new
          (local.set $lastChar (local.get $curChar))
        )

        ;; Increment char count
        (local.set $charCount (i32.add (local.get $charCount) (i32.const 1)))

        (local.set $idx (i32.add (i32.const 1) (local.get $idx)))
        (br_if $eachCharLoop (i32.le_s (local.get $idx) (local.get $inputLength)))
      )
    )
    (return (i32.const 0) (local.get $length))
  )

  ;;
  ;; Decode a string using run-length encoding
  ;;
  ;; @param {i32} inputOffset - The offset of the string in linear memory
  ;; @param {i32} inputLength - The length of the string in linear memory
  ;;
  ;; returns {(i32,i32)} - The offset and length of the decoded string in linear memory
  ;;
  (func (export "decode") (param $inputOffset i32) (param $inputLength i32)
    (result i32 i32)
    (local $idx i32)
    (local $length i32)
    (local $curCount i32)
    (local $curChar i32)
    (block $eachCharOuter
      (br_if $eachCharOuter (i32.eqz (local.get $inputLength)))
      (loop $eachCharInner
        (local.set $curChar (i32.load8_u (i32.add (local.get $inputOffset)
                                                  (local.get $idx))))
        (if
          (i32.and (i32.ge_s (local.get $curChar) (i32.const 48))
                   (i32.le_s (local.get $curChar) (i32.const 57)))
          (then
            (local.set $curCount (i32.mul (local.get $curCount) (i32.const 10)))
            (local.set $curCount (i32.add (local.get $curCount)
                                          (i32.sub (local.get $curChar)
                                                   (i32.const 48)))) )
          (else
            ;; at least 1 (because 0-- = negative overflow)
            (if (i32.eqz (local.get $curCount))
              (then (local.set $curCount (i32.const 1))))

            (loop $printInner
              (i32.store8 (local.get $length) (local.get $curChar))
              (local.set $length (i32.add (i32.const 1) (local.get $length)))
              (local.set $curCount (i32.sub (local.get $curCount) (i32.const 1)))
              (br_if $printInner (i32.ne (local.get $curCount) (i32.const 0)))))
          )
        (local.set $idx (i32.add (local.get $idx) (i32.const 1)))
        (br_if $eachCharInner (i32.lt_s (local.get $idx) (local.get $inputLength)))
        )
      )
    (return (i32.const 0) (local.get $length))
  )
)
;; >=48 <=57