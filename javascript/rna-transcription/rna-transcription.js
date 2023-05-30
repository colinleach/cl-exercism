export const toRna = (dna) => {
  if (dna) {
    var rna = "";
    for (var base in dna) rna += MAPPING[dna[base]];
    return rna;
  } 
  else return "";
};

const MAPPING = {A: "U", C: "G", G: "C", T: "A"};
