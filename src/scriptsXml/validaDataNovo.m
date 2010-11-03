function result = validaDataNovo(vetorInicio, vetorFim, vetorMarcaInicial, vetorMarcaFinal)


if(vetorInicio(1)==vetorMarcaInicial(1))   
    if(vetorInicio(2)<vetorMarcaInicial(2))
        result = true;
    elseif(vetorInicio(2)==vetorMarcaInicial(2) && vetorInicio(3)<vetorMarcaInicial(3))
        result = true;
    end
    
    if(vetorFim(1)>vetorMarcaFinal(1))
       result = true;
    elseif(vetorFim(2)>vetorMarcaFinal(2))
        result = true;
    elseif(vetorFim(2)==vetorMarcaFinal(2) && vetorFim(3)>vetorMarcaFinal(3))
        result = true;
    else
        result = false;
    end
else
        result = false;
end




% disp('------------------');
% disp(sprintf('%d %d',vetorInicio(1),vetorMarcaInicial(1)));
% disp(sprintf('%d %d',vetorInicio(2),vetorMarcaInicial(2)));
% disp(sprintf('%d %d',vetorInicio(3),vetorMarcaInicial(3)));
% disp(' ');
% disp(sprintf('%d %d',vetorFim(1),vetorMarcaFinal(1)));
% disp(sprintf('%d %d',vetorFim(2),vetorMarcaFinal(2)));
% disp(sprintf('%d %d',vetorFim(3),vetorMarcaFinal(3)));
% disp(' ');
% disp(result);

% if(vetorFim(1) =='')
%     result = false;
% end
