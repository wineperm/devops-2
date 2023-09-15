#1. Подключитесь к публичному маршрутизатору в интернет. Найдите маршрут к вашему публичному IP. telnet route-views.routeviews.org Username: rviews
#Ответ
route-views>show ip route 178.47.85.238
Routing entry for 178.47.64.0/19
  Known via "bgp 6447", distance 20, metric 0
  Tag 4826, type external
  Last update from 114.31.199.16 3d13h ago
  Routing Descriptor Blocks:
  * 114.31.199.16, from 114.31.199.16, 3d13h ago
      Route metric is 0, traffic share count is 1
      AS Hops 2
      Route tag 4826
      MPLS label: none
---------------------
route-views>show bgp 178.47.85.238
BGP routing table entry for 178.47.64.0/19, version 124502655
Paths: (21 available, best #10, table default)
  Not advertised to any peer
  Refresh Epoch 1
  3267 12389
    194.85.40.15 from 194.85.40.15 (185.141.126.1)
      Origin IGP, metric 0, localpref 100, valid, external
      path 7F2C6E7C0428 RPKI State valid
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  3333 1103 12389
    193.0.0.56 from 193.0.0.56 (193.0.0.56)
      Origin IGP, localpref 100, valid, external
      path 7F2C698988E8 RPKI State valid
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  7018 3356 12389
    12.0.1.63 from 12.0.1.63 (12.0.1.63)
      Origin IGP, localpref 100, valid, external
      Community: 7018:5000 7018:37232
      path 7F2B7F33F330 RPKI State valid
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  6939 12389
    64.71.137.241 from 64.71.137.241 (216.218.253.53)
      Origin IGP, localpref 100, valid, external
      path 7F2C211EC5D0 RPKI State valid
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 2
  3303 12389
    217.192.89.50 from 217.192.89.50 (138.187.128.158)
      Origin IGP, localpref 100, valid, external
      Community: 3303:1004 3303:1006 3303:1030 3303:3056
      path 7F2C68F5DEC8 RPKI State valid
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  3561 209 3356 12389
    206.24.210.80 from 206.24.210.80 (206.24.210.80)
      Origin IGP, localpref 100, valid, external
      path 7F2C8926DD88 RPKI State valid
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  3356 12389
    4.68.4.46 from 4.68.4.46 (4.69.184.201)
      Origin IGP, metric 0, localpref 100, valid, external
      Community: 3356:2 3356:22 3356:100 3356:123 3356:501 3356:901 3356:2065
      path 7F2C34959A70 RPKI State valid
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  3549 3356 12389
    208.51.134.254 from 208.51.134.254 (67.16.168.191)
      Origin IGP, metric 0, localpref 100, valid, external

#2. Создайте dummy-интерфейс в Ubuntu. Добавьте несколько статических маршрутов. Проверьте таблицу маршрутизации.
#Ответ
Создать интерфейс, добавить опцию «numdummies=2» чтобы сразу создалось два интерфейса dummyX:
$ sudo modprobe -v dummy numdummies=2

Посмотрим создались ли интерфейсы:
$ ifconfig -a | grep dummy

=>dummy0: flags=130<BROADCAST,NOARP>  mtu 1500
  dummy1: flags=130<BROADCAST,NOARP>  mtu 1500

Добавить или удалить IP адрес например с интерфейса dummy0 можно так:

$sudo ip addr add 192.168.1.150/24 dev dummy0
$sudo ip addr del 192.168.1.150/24 dev dummy0

=>$ sudo ip addr add 192.168.1.150/24 dev dummy0
  $ sudo ip addr add 192.168.1.151/24 dev dummy1

qwerty@Ubuntu:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:44:2a:9f brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.33/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 84275sec preferred_lft 84275sec
    inet6 fe80::f99:7400:32f5:a934/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
5: dummy0: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 4e:1a:8d:2c:20:11 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.150/24 scope global dummy0
       valid_lft forever preferred_lft forever
6: dummy1: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 46:7c:d4:fd:91:a3 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.151/24 scope global dummy1
       valid_lft forever preferred_lft forever

Изменить MAC адрес так:
$sudo ip link set dummy0 address 00:00:00:11:11:11

=>$ sudo ip link set dummy0 address 00:00:00:11:11:11
  $ sudo ip link set dummy1 address 00:00:00:12:12:12

qwerty@Ubuntu:~$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:44:2a:9f brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.33/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 84247sec preferred_lft 84247sec
    inet6 fe80::f99:7400:32f5:a934/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
5: dummy0: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 00:00:00:11:11:11 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.150/24 scope global dummy0
       valid_lft forever preferred_lft forever
6: dummy1: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 00:00:00:12:12:12 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.151/24 scope global dummy1
       valid_lft forever preferred_lft forever

Добавляются или удаляются интерфейсы так:
$ sudo ip link add dummy2 type dummy
$ sudo ip link del dummy2 type dummy

-----------------------------

Добавить маршрут для любого IP адреса

=>qwerty@Ubuntu:~$ sudo ip route add 192.168.1.150 via 192.168.1.1
  qwerty@Ubuntu:~$ sudo ip route add 192.168.1.151 via 192.168.1.1

  qwerty@Ubuntu:~$ ip a

1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:44:2a:9f brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.33/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 84176sec preferred_lft 84176sec
    inet6 fe80::f99:7400:32f5:a934/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
5: dummy0: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 00:00:00:11:11:11 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.150/24 scope global dummy0
       valid_lft forever preferred_lft forever
6: dummy1: <BROADCAST,NOARP> mtu 1500 qdisc noop state DOWN group default qlen 1000
    link/ether 00:00:00:12:12:12 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.151/24 scope global dummy1
       valid_lft forever preferred_lft forever

--------------------------

qwerty@Ubuntu:~$ route  Проверка таблицы маршрутизации.

qwerty@Ubuntu:~$ ip route
default via 192.168.1.1 dev enp0s3 proto dhcp metric 100 
169.254.0.0/16 dev enp0s3 scope link metric 1000 
192.168.1.0/24 dev enp0s3 proto kernel scope link src 192.168.1.33 metric 100 
192.168.1.150 via 192.168.1.1 dev enp0s3 
192.168.1.151 via 192.168.1.1 dev enp0s3 

-------------------------

Выгрузить модуль dummy можно так (dummy интерфейсы удалятся автоматически):

$ sudo rmmod dummy
Чтобы модуль автоматически запускался при старте системы, то добавим в файл /etc/modules (при запуске создастся один интерфейс dummy0):

$ dummy
Если нужно чтобы создалось например два интерфейса или больше, тогда добавим в /etc/rc.local строку:

$ modprobe -v dummy numdummies=2
Или создадим файл dummy.conf:

$ sudo -i
echo "options dummy numdummies=2" > /etc/modprobe.d/dummy.conf

Чтобы при старте системы на dummy интерфейсе был IP адрес, откроем файл конфигурации:

$ sudo nano /etc/network/interfaces
И как обычно назначим статический IP адрес (аналогично для dummy1, dummy2 и т.д.):

$ auto dummy0
$ iface dummy0 inet static
$ address 192.168.1.150
$ netmask 255.255.255.0

Смотрите чтобы назначенный IP адрес на dummy интерфейсе не совпал с сетью на физическом сетевой интерфейсе, иначе совпадут маршруты и сервер может быть не доступен по обеим IP адресам.

#3. Проверьте открытые TCP-порты в Ubuntu. Какие протоколы и приложения используют эти порты? Приведите несколько примеров.
#Ответ

$ sudo lsof -i -P
COMMAND    PID            USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
systemd-r  573 systemd-resolve   13u  IPv4  19928      0t0  UDP localhost:53 
systemd-r  573 systemd-resolve   14u  IPv4  19929      0t0  TCP localhost:53 (LISTEN)
avahi-dae  682           avahi   12u  IPv4  20192      0t0  UDP *:5353 
avahi-dae  682           avahi   13u  IPv6  20193      0t0  UDP *:5353 
avahi-dae  682           avahi   14u  IPv4  20194      0t0  UDP *:42332 
avahi-dae  682           avahi   15u  IPv6  20195      0t0  UDP *:35366 
NetworkMa  685            root   25u  IPv4  19424      0t0  UDP Ubuntu:68->RM-AC2100:67 
cupsd      847            root    6u  IPv6  21098      0t0  TCP ip6-localhost:631 (LISTEN)
cupsd      847            root    7u  IPv4  21099      0t0  TCP localhost:631 (LISTEN)
cups-brow  978            root    7u  IPv4  18372      0t0  UDP *:631 
nginx      999            root    6u  IPv4  21535      0t0  TCP *:80 (LISTEN)
nginx      999            root    7u  IPv6  21536      0t0  TCP *:80 (LISTEN)
nginx     1000        www-data    6u  IPv4  21535      0t0  TCP *:80 (LISTEN)
nginx     1000        www-data    7u  IPv6  21536      0t0  TCP *:80 (LISTEN)
nginx     1001        www-data    6u  IPv4  21535      0t0  TCP *:80 (LISTEN)
nginx     1001        www-data    7u  IPv6  21536      0t0  TCP *:80 (LISTEN)
nginx     1002        www-data    6u  IPv4  21535      0t0  TCP *:80 (LISTEN)
nginx     1002        www-data    7u  IPv6  21536      0t0  TCP *:80 (LISTEN)
nginx     1003        www-data    6u  IPv4  21535      0t0  TCP *:80 (LISTEN)
nginx     1003        www-data    7u  IPv6  21536      0t0  TCP *:80 (LISTEN)

(LISTEN) - прослушивается

$ sudo netstat -tulpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name    
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      999/nginx: master p 
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      573/systemd-resolve 
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      847/cupsd           
tcp6       0      0 :::80                   :::*                    LISTEN      999/nginx: master p 
tcp6       0      0 ::1:631                 :::*                    LISTEN      847/cupsd           
udp        0      0 127.0.0.53:53           0.0.0.0:*                           573/systemd-resolve 
udp        0      0 0.0.0.0:631             0.0.0.0:*                           978/cups-browsed    
udp        0      0 0.0.0.0:5353            0.0.0.0:*                           682/avahi-daemon: r 
udp        0      0 0.0.0.0:42332           0.0.0.0:*                           682/avahi-daemon: r 
udp6       0      0 :::35366                :::*                                682/avahi-daemon: r 
udp6       0      0 :::5353                 :::*                                682/avahi-daemon: r 

(LISTEN) - прослушивается

#4. Проверьте используемые UDP-сокеты в Ubuntu. Какие протоколы и приложения используют эти порты?
#Ответ

Смотри выше

#5. Используя diagrams.net, создайте L3-диаграмму вашей домашней сети или любой другой сети, с которой вы работали.
#Ответ

Рисование

#6. Это самостоятельное задание, его выполнение необязательно.
Установите Nginx, настройте в режиме балансировщика TCP или UDP.
Установите bird2, настройте динамический протокол маршрутизации RIP.
Установите Netbox, создайте несколько IP-префиксов, и, используя curl, проверьте работу API.
#Ответ
