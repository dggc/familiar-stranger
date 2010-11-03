
function result = transformaData(vetorAtual, vetorMarcaInicial)


refDias = (vetorAtual(3) - vetorMarcaInicial(3)) *24 * 60 * 60;

refHoras = vetorAtual(4)*60*60;

refMin = vetorAtual(5)*60;

refSeg = vetorAtual(6);

result = round((refDias + refHoras +refMin +refSeg)/10);

  end
  