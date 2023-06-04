export const decodedValue = (bands) => colorCode(bands[0]) * 10 + colorCode(bands[1]);

export const colorCode = (color) => COLORS.indexOf(color);

export const COLORS = [
  'black',
  'brown',
  'red',
  'orange',
  'yellow',
  'green',
  'blue',
  'violet',
  'grey',
  'white',
];
