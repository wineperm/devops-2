#1. Посмотрел
#2. 2.4 ГГц - 4 шт. 5 ГГц - канал 20 - 25 шт, kanal 40 - 12 шт, kanal 80 - 6 шт 
#3. Vendor/Company: Apple, Inc.
#4. 8949 bait
#5. Флаги управления SYN и FIN обычно не установлены в одном заголовке сегмента TCP. Флаг SYN синхронизирует числа последовательностей для инициализации подключения TCP. Флаг FIN указывает на окончание передачи данных для завершения подключения TCP. Их цели являются взаимоисключающими. 
#6. UNCONN для udp соединении, udp rabotaet bez ustanovki soedinenia. TIME-WAIT состояния быть не может.  
#7. (1)FIN => FIN WAIT 1; (2) => FIN => CLOSE WAIT; (2) ACK-FIN => LAST ACK; (1) => ACK-FIN => TIME WAIT => ASK; (2) =>ACK => CLOSED; (1) TIME WAIT => Timeout => CLOSED;  
#8. 65535 maksimal'noe chislo soedinenij ogranichennoe TCP protokolom c odnogo ip. Po faktu otgranichenie nakladyvaetsya maksimal'nym kolichestvom razreshennyh fajlovyh deskriptorov i resursami servera.  kolichestvo ip klientov * na 65535 teoreticheskoe maksimal'noe chislo soedinenij
#9. Mozhet, esli so storony klienta, budet mnogo aktivnyh zaprosov na zakrytie sessii. Eto ploho, potomu chto raskhoduet resursy. Tak zhe, esli zaprosy proiskhodyat bystree, chem porty vyhodyat iz time wait, pri ocherednoj popytke klint poluchit oshibku EADDRNOTAVAIL (errno=99). 
#10. Fragmentaciya ploha tem, chto v protokol ne garantiruet dostavku i mogut teryat'sya pakety. Esli teryaetsya odin fragment, teryaetsya vsya dejtagramma.
#11. Standartnyj protokol UDP. YA by vybral TCP kak garantirovannuyu dostavku paketov v drugih realizaciyah programmy.
#12.  
