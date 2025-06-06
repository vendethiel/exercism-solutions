export const isArmstrongNumber = (n) =>
  `${n}`.split('').map(d => Math.pow(d, `${n}`.length)).reduce((a, b) => +a + +b) === n
;