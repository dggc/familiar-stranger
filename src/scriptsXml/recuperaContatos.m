
%inicio e fim considerados da coleta
vetorMarcaInicial(1) = 2004;
vetorMarcaInicial(2) = 10;
vetorMarcaInicial(3) = 15;

vetorMarcaFinal(1) = 2004;
vetorMarcaFinal(2) = 10;
vetorMarcaFinal(3) = 29;

fileTEMP = sprintf('xmls/TEMP.xml');

idValido = 1;

%identificando os contatos 
for n=1:93
%for n=1:1
   
   nodo = network.sub_sort(n);
   
   inicio = datestr(s(nodo).my_startdate);
   vetorInicio = datevec(inicio);
   
   fim = datestr(s(nodo).my_enddate);
   if(length(fim)==0)
       continue;
   end
   vetorFim = datevec(fim);
   
   result = validaDataNovo(vetorInicio, vetorFim, vetorMarcaInicial, vetorMarcaFinal);
   
   
   if(~result)
       continue;
   end
   

   file = sprintf('xmls/TEMPconteudo.xml');
   
   
   fid = fopen(file, 'w');
   
   
   arrayGeralMacs = s(nodo).device_macs;
   arrayColetas = s(nodo).device_date;
   numColetas = length(arrayColetas);
   
   
   numIntervalosValidos = 0;
   for i=1:numColetas
       %data da coleta sendo trabalhada
       data = datestr(arrayColetas(i));
         
       vetorAtual = datevec(data);
 
       result = validaDataColeta(vetorAtual, vetorMarcaInicial, vetorMarcaFinal);
       
       if(~result)
           continue;
       end
       
       contentArray = arrayGeralMacs{i};
       tamanhoContent = length(contentArray);
       
       %conversao para a data relativa
       tempo = transformaData(vetorAtual, vetorMarcaInicial);
   
       if(tamanhoContent ==0)
          fprintf(fid,'\t<intervalo macs="0" tempo="%d">\n',tempo);
          fprintf(fid,'\t</intervalo>\n');
       else
          xmlRotuloMac = sprintf('\t<intervalo macs="%d" tempo="%d">\n',tamanhoContent,tempo);
          fprintf(fid,xmlRotuloMac);

          for j=1:tamanhoContent

               mac = num2hex(contentArray(j));

               xmlMacSpecifico = sprintf('\t\t<mac>%s</mac>\n',mac);
               fprintf(fid,xmlMacSpecifico);
           end    
           fprintf(fid,'\t</intervalo>\n');
       end
       
       numIntervalosValidos = numIntervalosValidos+1;
   end
   fprintf(fid,'</nodo>\n');
   
   %garante que um arquivo sem conteudo nao seja contado
   if(numIntervalosValidos==0)
       continue;
   end
   
 
   fidTEMP = fopen(fileTEMP, 'w');
   
   %monta a raiz da estrutura do XML
   xmlRaiz = sprintf('<nodo id="%d" idOriginal="%d" intervalos="%d" inicioRelativo="XXXXXXXXX">\n',idValido, n, numIntervalosValidos);
   fprintf(fidTEMP,xmlRaiz);

    %primeira linha do XML
   fprintf(fidTEMP,'<?xml version="1.0" encoding="UTF-8"?>\n');
   
   fclose(fidTEMP);
   fclose(fid);
   
   
   %une os dois arquivos
   fidScript = fopen('xmls/UneArquivos.sh','wt');
   fileContent = sprintf('cat xmls/TEMP.xml xmls/TEMPconteudo.xml  > xmls/xmlNodo%d.xml',idValido);
   fprintf(fidScript,'%s\n', fileContent);
   fclose(fidScript);
   !chmod u+rwx xmls/UneArquivos.sh
   !sh xmls/UneArquivos.sh
   
   %contador para nodos candidatos validos
   idValido = idValido+1;
end   


  

