%script para gerar uma lista com todos os mac address unicos do log.


%mac de todos os voluntarios da pesquisa
for n=1:93
    nodo = network.sub_sort(n);
    mac =  num2hex(s(nodo).mac);
    
    disp(sprintf('nodo: %d  mac: %s',n, mac));
    
end


%macs unicos
