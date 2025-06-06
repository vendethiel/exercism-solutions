const nine = (x: number) => x > 9 ? x - 9 : x;

export function valid(rawDigits: string): boolean {
  const digits = rawDigits.replaceAll(/\s+/g, '');
  if (!digits.match(/^\d+$/) || digits.length < 2) return false;
  const rem = digits.length % 2;
  return digits.split('').map((x, i) => (i % 2) != rem ? +x : nine(+x * 2)).reduce((x, y) => x + y, 0) % 10 == 0;
}
