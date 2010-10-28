%identificando os contatos 
for n=1:3
%for n=1:1
    
   file = sprintf('xmlNodo%d.xml',n);
   delete(file);
   fid = fopen(file, 'w');
   
   %primeira linha do XML
   fprintf(fid,'<?xml version="1.0" encoding="UTF-8"?>\n');
   
   %inicio = datestr(s(network.sub_sort(n)).my_startdate);
   %fim = datestr(s(network.sub_sort(n)).my_enddate);
   
   nodo = network.sub_sort(n);
   
   arrayGeralMacs = s(nodo).device_macs;
   arrayColetas = s(nodo).device_date;
   numColetas = length(arrayColetas);
   
   %monta a raiz da estrutura do XML
   xmlRaiz = sprintf('<nodo id="%d" intervalos="%d" inicioRelativo="XXXXXXXXX">\n',nodo, numColetas);
   fprintf(fid,xmlRaiz);
   
   
   for i=1:numColetas
       %data da coleta sendo trabalhada
       data = datestr(arrayColetas(i));
       
       contentArray = arrayGeralMacs{i};
       tamanhoContent = length(contentArray);
    
       %macs = '';
   
       if(tamanhoContent ==0)
          fprintf(fid,'\t<intervalo macs="0">\n');
          fprintf(fid,'\t</intervalo>\n');
       else
           xmlRotuloMac = sprintf('\t<intervalo macs="%d">\n',tamanhoContent);
           fprintf(fid,xmlRotuloMac);
           
           for j=1:tamanhoContent
               %macs = strcat(macs,num2hex(contentArray(j)));
               mac = num2hex(contentArray(j));
               %disp(mac);
               xmlMacSpecifico = sprintf('\t\t<mac>%s</mac>\n',mac);
               fprintf(fid,xmlMacSpecifico);
           end    
           fprintf(fid,'\t</intervalo>\n');
       end
        
       %Apenas um teste... 
       %linha = sprintf('%d %d %s %d %s\n',n, i, data, tamanhoContent, macs); 
       %fprintf(fid,linha); 
       %disp(linha);  
       %macs = '';
       
   end
   fprintf(fid,'</nodo>\n');
   
   fclose(fid);
   
end   