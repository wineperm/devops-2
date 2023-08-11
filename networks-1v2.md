#1. Шаг 1. Работа c HTTP через telnet.

Подключитесь утилитой telnet к сайту stackoverflow.com:
telnet stackoverflow.com 80

Отправьте HTTP-запрос:
GET /questions HTTP/1.0
HOST: stackoverflow.com
[press enter]
[press enter]
В ответе укажите полученный HTTP-код и поясните, что он означает.

#Ответ
HTTP/1.1 400 Bad Request
Connection: close
Content-Length: 11
content-type: text/plain; charset=utf-8
x-served-by: cache-fra-eddf8230073

Ошибка 400 bad request переводится как «плохой запрос». Она возникает тогда, когда браузер пользователя отправляет некорректный запрос серверу, на котором находится сайт.

#2. Повторите задание 1 в браузере, используя консоль разработчика F12:

откройте вкладку Network;
отправьте запрос http://stackoverflow.com;
найдите первый ответ HTTP-сервера, откройте вкладку Headers;
укажите в ответе полученный HTTP-код;
проверьте время загрузки страницы и определите, какой запрос обрабатывался дольше всего;
приложите скриншот консоли браузера в ответ.

#Ответ
Status 200 OK
Version HTTP/2

HTTP 200, Successful (Успешный)
------
load: 3.11 s полное врем загрузки страницы
------
scheme	https
host	ajax.googleapis.com
filename /ajax/libs/jquery/1.12.4/jquery.min.js
Address 64.233.164.95:443
Status 200 OK
Version HTTP/2
Transferred 34.94 kB (97.16 kB size)
Referrer Policystrict-origin-when-cross-origin
DNS Resolution System
Обрабатывался запрос дольше всего. Скрины.

#3. Какой IP-адрес у вас в интернете?
#Ответ
31.163.233.191

#4. Какому провайдеру принадлежит ваш IP-адрес? Какой автономной системе AS? Воспользуйтесь утилитой whois. 
#Ответ
descr:          OJSC RosteleÓom, regional branch "Urals"
------
AS12389

#5. Через какие сети проходит пакет, отправленный с вашего компьютера на адрес 8.8.8.8? Через какие AS? Воспользуйтесь утилитой traceroute.
#Ответ
sudo traceroute -A 8.8.8.8
[sudo] password for qwerty: 
traceroute to 8.8.8.8 (8.8.8.8), 30 hops max, 60 byte packets
 1  RM-AC2100 (192.168.1.1) [*]  7.002 ms  6.961 ms  6.956 ms
 2  90.150.180.21 (90.150.180.21) [AS12389]  24.099 ms  24.083 ms  24.067 ms
 3  79.133.87.194 (79.133.87.194) [AS12389]  24.051 ms  24.029 ms  24.013 ms
 4  92.50.236.155 (92.50.236.155) [AS12389]  23.386 ms  23.361 ms  23.445 ms
 5  * * 185.140.148.155 (185.140.148.155) [AS12389]  63.592 ms
 6  72.14.209.89 (72.14.209.89) [AS15169]  60.302 ms  38.924 ms  41.670 ms
 7  * * *
 8  108.170.250.129 (108.170.250.129) [AS15169]  39.851 ms  39.774 ms 72.14.233.90 (72.14.233.90) [AS15169]  37.638 ms
 9  108.170.250.66 (108.170.250.66) [AS15169]  41.314 ms 108.170.250.83 (108.170.250.83) [AS15169]  39.608 ms 108.170.250.130 (108.170.250.130) [AS15169]  39.565 ms
10  142.251.237.154 (142.251.237.154) [AS15169]  54.193 ms 209.85.255.136 (209.85.255.136) [AS15169]  52.037 ms 142.251.238.82 (142.251.238.82) [AS15169]  59.369 ms
11  108.170.235.64 (108.170.235.64) [AS15169]  59.341 ms 172.253.66.110 (172.253.66.110) [AS15169]  59.309 ms 142.250.235.74 (142.250.235.74) [AS15169]  55.010 ms
12  172.253.79.169 (172.253.79.169) [AS15169]  54.590 ms 74.125.253.147 (74.125.253.147) [AS15169]  57.273 ms 172.253.79.169 (172.253.79.169) [AS15169]  52.806 ms
13  * * *
14  * * *
15  * * *
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * * *
22  dns.google (8.8.8.8) [AS15169]  54.170 ms  54.134 ms  54.521 ms

#6. Повторите задание 5 в утилите mtr. На каком участке наибольшая задержка — delay?
#Ответ
mtr 8.8.8.8

 Host                                                                                                                                                            Loss%   Snt   Last   Avg  Best  Wrst StDev
 1. AS???    192.168.1.1                                                                                                                                          0.0%    40    0.6   0.6   0.5   1.2   0.1
 2. AS12389  90.150.180.21                                                                                                                                        0.0%    40    3.1   6.8   2.1  33.7   8.5
 3. AS12389  79.133.87.194                                                                                                                                        0.0%    40    8.7   7.2   4.3  19.5   3.1
 4. AS12389  92.50.236.155                                                                                                                                        0.0%    40    4.5   6.0   3.5  12.3   2.1
 5. AS12389  185.140.148.155                                                                                                                                     56.4%    40   40.7  39.3  37.7  47.9   2.4
 6. AS15169  72.14.209.89                                                                                                                                         0.0%    40   37.2  37.4  35.5  49.2   2.0
 7. AS15169  108.170.250.129                                                                                                                                      0.0%    40   38.5  38.9  37.8  41.1   0.6
 8. AS15169  108.170.250.130                                                                                                                                      0.0%    40   35.3  36.7  35.3  48.5   2.0
 9. AS15169  209.85.255.136                                                                                                                                       0.0%    40   55.0  55.6  54.4  63.3   1.4
10. AS15169  108.170.235.64                                                                                                                                       0.0%    40   56.0  55.8  55.1  58.2   0.7
11. AS15169  142.250.56.131                                                                                                                                       0.0%    40   53.1  51.8  50.9  53.6   0.5
12. (waiting for reply)
13. (waiting for reply)
14. (waiting for reply)
15. (waiting for reply)
16. (waiting for reply)
17. (waiting for reply)
18. (waiting for reply)
19. (waiting for reply)
20. (waiting for reply)
21. AS15169  8.8.8.8                                                                                                                                              0.0%    39   52.6  52.9  52.0  59.1   1.1

Last, Avg, Best и Worst измеряют задержку в мс. Последний - это задержка последнего отправленного пакета, Avg - средняя задержка, а лучшие и худшие указывают самое низкое и самое большое время приема
-передачи для передаваемых пакетов..

#7. Какие DNS-сервера отвечают за доменное имя dns.google? Какие A-записи? Воспользуйтесь утилитой dig.
#Ответ
dig google.com NS +noall +answer
google.com.		186084	IN	NS	ns4.google.com.
google.com.		186084	IN	NS	ns1.google.com.
google.com.		186084	IN	NS	ns2.google.com.
google.com.		186084	IN	NS	ns3.google.com.
---------------
dig google.com A +noall +answer
google.com.		30	IN	A	172.217.18.110

#8. Проверьте PTR записи для IP-адресов из задания 7. Какое доменное имя привязано к IP? Воспользуйтесь утилитой dig.
#Ответ

qwerty@Ubuntu:~/devops-2$ dig ns4.google.com A +noall +answer
ns4.google.com.		204129	IN	A	216.239.38.10
qwerty@Ubuntu:~/devops-2$ dig ns1.google.com A +noall +answer
ns1.google.com.		217059	IN	A	216.239.32.10
qwerty@Ubuntu:~/devops-2$ dig ns2.google.com A +noall +answer
ns2.google.com.		199899	IN	A	216.239.34.10
qwerty@Ubuntu:~/devops-2$ dig ns3.google.com A +noall +answer
ns3.google.com.		213348	IN	A	216.239.36.10
----------------------
dig -x 172.217.18.110

; <<>> DiG 9.18.12-0ubuntu0.22.04.2-Ubuntu <<>> -x 172.217.18.110
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 2036
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;110.18.217.172.in-addr.arpa.	IN	PTR

;; ANSWER SECTION:
110.18.217.172.in-addr.arpa. 79720 IN	PTR	zrh04s05-in-f110.1e100.net.
110.18.217.172.in-addr.arpa. 79720 IN	PTR	fra16s42-in-f14.1e100.net.

;; Query time: 143 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Fri Aug 11 14:37:55 +05 2023
;; MSG SIZE  rcvd: 126
-----------------------
dig -x 216.239.38.10

; <<>> DiG 9.18.12-0ubuntu0.22.04.2-Ubuntu <<>> -x 216.239.38.10
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 23731
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;10.38.239.216.in-addr.arpa.	IN	PTR

;; ANSWER SECTION:
10.38.239.216.in-addr.arpa. 7062 IN	PTR	ns4.google.com.

;; Query time: 3 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Fri Aug 11 14:39:50 +05 2023
;; MSG SIZE  rcvd: 83
---------------------
dig -x 216.239.32.10

; <<>> DiG 9.18.12-0ubuntu0.22.04.2-Ubuntu <<>> -x 216.239.32.10
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 32465
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;10.32.239.216.in-addr.arpa.	IN	PTR

;; ANSWER SECTION:
10.32.239.216.in-addr.arpa. 86400 IN	PTR	ns1.google.com.

;; Query time: 216 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Fri Aug 11 14:40:34 +05 2023
;; MSG SIZE  rcvd: 83
------------------
dig -x 216.239.34.10

; <<>> DiG 9.18.12-0ubuntu0.22.04.2-Ubuntu <<>> -x 216.239.34.10
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 7402
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;10.34.239.216.in-addr.arpa.	IN	PTR

;; ANSWER SECTION:
10.34.239.216.in-addr.arpa. 86400 IN	PTR	ns2.google.com.

;; Query time: 216 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Fri Aug 11 14:41:03 +05 2023
;; MSG SIZE  rcvd: 83
------------------
dig -x 216.239.36.10

; <<>> DiG 9.18.12-0ubuntu0.22.04.2-Ubuntu <<>> -x 216.239.36.10
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 6359
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;10.36.239.216.in-addr.arpa.	IN	PTR

;; ANSWER SECTION:
10.36.239.216.in-addr.arpa. 86400 IN	PTR	ns3.google.com.

;; Query time: 516 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Fri Aug 11 14:41:29 +05 2023
;; MSG SIZE  rcvd: 83
-----------------
#Доменное имя привязаное к IP 8.8.8.8

dig -x 8.8.8.8 +short
dns.google.

#Не урезанный ответ

dig -x 8.8.8.8
\
; <<>> DiG 9.18.12-0ubuntu0.22.04.2-Ubuntu <<>> -x 8.8.8.8
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 51265
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:
;8.8.8.8.in-addr.arpa.		IN	PTR

;; ANSWER SECTION:
8.8.8.8.in-addr.arpa.	1825	IN	PTR	dns.google.

;; Query time: 0 msec
;; SERVER: 127.0.0.53#53(127.0.0.53) (UDP)
;; WHEN: Fri Aug 11 14:48:08 +05 2023
;; MSG SIZE  rcvd: 73

