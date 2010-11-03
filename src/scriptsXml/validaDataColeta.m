

function result = validaDataColeta(vetorAtual, vetorMarcaInicial, vetorMarcaFinal)

result = false;

  if(vetorAtual(1) == vetorMarcaInicial(1) && vetorAtual(2) == vetorMarcaInicial(2))
    if(vetorAtual(3)>=vetorMarcaInicial(3) && vetorAtual(3) <= vetorMarcaFinal(3))
        result = true;
    end
  end
  