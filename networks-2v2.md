#1.Проверьте список доступных сетевых интерфейсов на вашем компьютере. Какие команды есть для этого в Linux и в Windows?
#Ответ
В Linux
qwerty@Ubuntu:~$ ls /sys/class/net
enp0s3  lo
----------------------------
qwerty@Ubuntu:~$ ifconfig
enp0s3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.1.33  netmask 255.255.255.0  broadcast 192.168.1.255
        inet6 fe80::f99:7400:32f5:a934  prefixlen 64  scopeid 0x20<link>
        ether 08:00:27:44:2a:9f  txqueuelen 1000  (Ethernet)
        RX packets 17090  bytes 21145510 (21.1 MB)
        RX errors 0  dropped 187  overruns 0  frame 0
        TX packets 4019  bytes 374668 (374.6 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 257  bytes 25803 (25.8 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 257  bytes 25803 (25.8 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
-----------------------------
qwerty@Ubuntu:~$ ip link show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
    link/ether 08:00:27:44:2a:9f brd ff:ff:ff:ff:ff:ff
-----------------------------
qwerty@Ubuntu:~$ nmcli device status
DEVICE  TYPE      STATE      CONNECTION         
enp0s3  ethernet  connected  Wired connection 1 
lo      loopback  unmanaged  --                 
qwerty@Ubuntu:~$ netstat -i
Kernel Interface table
Iface      MTU    RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
enp0s3    1500    17178      0    193 0          4022      0      0      0 BMRU
lo       65536      257      0      0 0           257      0      0      0 LRU
-----------------------------
qwerty@Ubuntu:~$ cat /proc/net/dev
Inter-|   Receive                                                |  Transmit
 face |bytes    packets errs drop fifo frame compressed multicast|bytes    packets errs drop fifo colls carrier compressed
    lo:   25803     257    0    0    0     0          0         0    25803     257    0    0    0     0       0          0
enp0s3: 21166306   17202    0  196    0     0          0       591   375110    4025    0    0    0     0       0          0
-----------------------------
В Windows

C:\Users\Wine>ipconfig /all

Настройка протокола IP для Windows

   Имя компьютера  . . . . . . . . . : DESKTOP-OCK9OTP
   Основной DNS-суффикс  . . . . . . :
   Тип узла. . . . . . . . . . . . . : Гибридный
   IP-маршрутизация включена . . . . : Нет
   WINS-прокси включен . . . . . . . : Нет

Адаптер Ethernet Ethernet:

   DNS-суффикс подключения . . . . . :
   Описание. . . . . . . . . . . . . : Intel(R) Ethernet Connection (2) I219-V
   Физический адрес. . . . . . . . . : 4C-CC-6A-B2-4E-B2
   DHCP включен. . . . . . . . . . . : Да
   Автонастройка включена. . . . . . : Да
   Локальный IPv6-адрес канала . . . : fe80::cf42:4e5f:4b97:e6c%14(Основной)
   IPv4-адрес. . . . . . . . . . . . : 192.168.1.83(Основной)
   Маска подсети . . . . . . . . . . : 255.255.255.0
   Аренда получена. . . . . . . . . . : 14 августа 2023 г. 17:30:43
   Срок аренды истекает. . . . . . . . . . : 15 августа 2023 г. 17:30:43
   Основной шлюз. . . . . . . . . : 192.168.1.1
   DHCP-сервер. . . . . . . . . . . : 192.168.1.1
   IAID DHCPv6 . . . . . . . . . . . : 474795114
   DUID клиента DHCPv6 . . . . . . . : 00-01-00-01-2A-42-33-47-4C-CC-6A-B2-4E-B2
   DNS-серверы. . . . . . . . . . . : 192.168.1.1
   NetBios через TCP/IP. . . . . . . . : Включен

Адаптер Ethernet Ethernet 3:

   DNS-суффикс подключения . . . . . :
   Описание. . . . . . . . . . . . . : VirtualBox Host-Only Ethernet Adapter
   Физический адрес. . . . . . . . . : 0A-00-27-00-00-09
   DHCP включен. . . . ............. : Автонастройка включена. . . . . . : Да
   Локальный IPv6-адрес канала . . . : fe80::fb4b:1563:a4ca:85c6%9(Основной)
   IPv4-адрес. . . . . . . . . . . . : 192.168.56.1(Основной)
   Маска подсети . . . . . . . . . . : 255.255.255.0
   Основной шлюз. . . . . . . . . :
   IAID DHCPv6 . . . . . . . . . . . : 638189607
   DUID клиента DHCPv6 . . . . . . . : 00-01-00-01-2A-42-33-47-4C-CC-6A-B2-4E-B2
   NetBios через TCP/IP. . . . . . . . : Включен

#2. Какой протокол используется для распознавания соседа по сетевому интерфейсу? Какой пакет и команды есть в Linux для этого?
#Ответ
NDP — протокол IPv6
ARP, ICMP, IRDP и Router Redirect для IPv4
------------------------
Link Layer Discovery Protocol (LLDP) - пакет Linux
sudo lldpctl - команда
 
#3. Какая технология используется для разделения L2-коммутатора на несколько виртуальных сетей? Какой пакет и команды есть в Linux для этого? Приведите пример конфига.
#Ответ
Для разделения L2 коммутатора на несколько виртуальных сетей используется технология VLAN
-----------------------
пакет ncmli

Проверим доступные интерфейсы:
$ nmcli device

создадим интерфейс VLAN на нашем интерфейсе enp0s3:
$ sudo nmcli con add type VLAN con-name enp0s3.60 dev enp0s3 id 60

=> Connection 'enp0s3.60' (d35b5054-c07a-43a7-a864-27c32e10ccf9) successfully added.

проверим, создан ли интерфейс:
$ nmcli device

=> DEVICE     TYPE      STATE                                  CONNECTION         
enp0s3     ethernet  connected                              Wired connection 1 
enp0s3.60  vlan      connecting (getting IP configuration)  enp0s3.60          
lo         loopback  unmanaged                              --                 

присвоим нашему интерфейсу IP-адрес и подтвердим, установлен ли он:
$ sudo nmcli conn modify enp0s3.60 ipv4.addresses '192.168.0.180/24'
$ ip -d addr show

=>1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00 promiscuity 0 minmtu 0 maxmtu 0 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535 
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host 
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:44:2a:9f brd ff:ff:ff:ff:ff:ff promiscuity 0 minmtu 46 maxmtu 16110 numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535 parentbus pci parentdev 0000:00:03.0 
    inet 192.168.1.33/24 brd 192.168.1.255 scope global dynamic noprefixroute enp0s3
       valid_lft 76478sec preferred_lft 76478sec
    inet6 fe80::f99:7400:32f5:a934/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever
7: enp0s3.60@enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether 08:00:27:44:2a:9f brd ff:ff:ff:ff:ff:ff promiscuity 0 minmtu 0 maxmtu 65535 
    vlan protocol 802.1Q id 60 <REORDER_HDR> numtxqueues 1 numrxqueues 1 gso_max_size 65536 gso_max_segs 65535 
    inet 192.168.0.180/24 brd 192.168.0.255 scope global noprefixroute enp0s3.60
       valid_lft forever preferred_lft forever
    inet6 fe80::287d:b6c2:2f47:2339/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever

настроить интерфейс VLAN вверх / вниз, мы запускаем команду с параметрами up или down:
$ sudo nmcli connection up enp0s3.60

=> Connection successfully activated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/4)

$ sudo nmcli conn

=> NAME                UUID                                  TYPE      DEVICE    
enp0s3.60           d35b5054-c07a-43a7-a864-27c32e10ccf9  vlan      enp0s3.60 
Wired connection 1  481f5083-2505-3fbc-b527-0929d522776d  ethernet  enp0s3  

$ sudo nmcli connection down enp0s3.60
 
=>Connection 'enp0s3.60' successfully deactivated (D-Bus active path: /org/freedesktop/NetworkManager/ActiveConnection/11)

$ sudo nmcli conn

=>NAME                UUID                                  TYPE      DEVICE 
Wired connection 1  481f5083-2505-3fbc-b527-0929d522776d  ethernet  enp0s3 
enp0s3.60           d35b5054-c07a-43a7-a864-27c32e10ccf9  vlan      --     

$ ip addr show - проверить запущен интерфейс vlan или нет

Когда создается интерфейс VLAN, его содержимое сохраняется в каталоге/proc/net/vlan. Давайте посмотрим на содержимое как конфигурации, так и файла интерфейса VLAN (enp0s3.60):

$ sudo cat /proc/net/vlan/config

=>VLAN Dev name	 | VLAN ID
Name-Type: VLAN_NAME_TYPE_RAW_PLUS_VID_NO_PAD
enp0s3.60      | 60  | enp0s3

$ sudo cat /proc/net/vlan/enp0s3.60
enp0s3.60  VID: 60	 REORDER_HDR: 1  dev->priv_flags: 81021
         total frames received            0
          total bytes received            0
      Broadcast/Multicast Rcvd            0

      total frames transmitted           37
       total bytes transmitted         5434
Device: enp0s3
INGRESS priority mappings: 0:0  1:0  2:0  3:0  4:0  5:0  6:0 7:0
 EGRESS priority mappings: 

Чтобы удалить интерфейс VLAN с помощью команды nmcli, мы выполняем эти команды впоследствии. Сначала мы отключаем интерфейс VLAN:

$ sudo nmcli connection down enp0s3.60

Затем мы удаляем интерфейс:

$ sudo nmcli connection delete enp0s3.60

#4. Какие типы агрегации интерфейсов есть в Linux? Какие опции есть для балансировки нагрузки? Приведите пример конфига.
#Ответ
Bonding – это объединение сетевых интерфейсов по определенному типу агрегации, Служит для увеличения пропускной способности и/или отказоустойчивость сети.

Типы агрегации интерфейсов в Linux:

Mode-0(balance-rr) – Данный режим используется по умолчанию. Balance-rr обеспечивается балансировку нагрузки и отказоустойчивость. В данном режиме сетевые пакеты отправляются “по кругу”, от первого интерфейса к последнему. Если выходят из строя интерфейсы, пакеты отправляются на остальные оставшиеся. Дополнительной настройки коммутатора не требуется при нахождении портов в одном коммутаторе. При разностных коммутаторах требуется дополнительная настройка.

Mode-1(active-backup) – Один из интерфейсов работает в активном режиме, остальные в ожидающем. При обнаружении проблемы на активном интерфейсе производится переключение на ожидающий интерфейс. Не требуется поддержки от коммутатора.

Mode-2(balance-xor) – Передача пакетов распределяется по типу входящего и исходящего трафика по формуле ((MAC src) XOR (MAC dest)) % число интерфейсов. Режим дает балансировку нагрузки и отказоустойчивость. Не требуется дополнительной настройки коммутатора/коммутаторов.

Mode-3(broadcast) – Происходит передача во все объединенные интерфейсы, тем самым обеспечивая отказоустойчивость. Рекомендуется только для использования MULTICAST трафика.

Mode-4(802.3ad) – динамическое объединение одинаковых портов. В данном режиме можно значительно увеличить пропускную способность входящего так и исходящего трафика. Для данного режима необходима поддержка и настройка коммутатора/коммутаторов.

Mode-5(balance-tlb) – Адаптивная балансировки нагрузки трафика. Входящий трафик получается только активным интерфейсом, исходящий распределяется в зависимости от текущей загрузки канала каждого интерфейса. Не требуется специальной поддержки и настройки коммутатора/коммутаторов.

Mode-6(balance-alb) – Адаптивная балансировка нагрузки. Отличается более совершенным алгоритмом балансировки нагрузки чем Mode-5). Обеспечивается балансировку нагрузки как исходящего так и входящего трафика. Не требуется специальной поддержки и настройки коммутатора/коммутаторов.
--------------------------
Файлы конфигурации сети для Ubuntu 20.10 находятся по пути /etc/netplan/имяфайла.yaml Если нам нужен bondidng, приводим его к виду:

bonds:
    bond0:
      dhcp4: no
      interfaces: [enp0s3, enp0s4]
      parameters: 
        mode: 802.3ad
        mii-monitor-interval: 1

#5.Сколько IP-адресов в сети с маской /29 ? Сколько /29 подсетей можно получить из сети с маской /24. Приведите несколько примеров /29 подсетей внутри сети 10.10.10.0/24.
#Ответ
8шт IP адресов в сети с маской /29
------------------------
32шт подсетей /29 можно получить из сети /24 
$ sipcalc 10.10.10.0/24 -s 29 | grep Network | wc -l
------------------------
$ sipcalc 10.10.10.0/24 -s 29
-[ipv4 : 10.10.10.0/24] - 0

[Split network]
Network			- 10.10.10.0      - 10.10.10.7
Network			- 10.10.10.8      - 10.10.10.15
Network			- 10.10.10.16     - 10.10.10.23
Network			- 10.10.10.24     - 10.10.10.31
Network			- 10.10.10.32     - 10.10.10.39
Network			- 10.10.10.40     - 10.10.10.47
Network			- 10.10.10.48     - 10.10.10.55
Network			- 10.10.10.56     - 10.10.10.63
Network			- 10.10.10.64     - 10.10.10.71
Network			- 10.10.10.72     - 10.10.10.79
Network			- 10.10.10.80     - 10.10.10.87
Network			- 10.10.10.88     - 10.10.10.95
Network			- 10.10.10.96     - 10.10.10.103
Network			- 10.10.10.104    - 10.10.10.111
Network			- 10.10.10.112    - 10.10.10.119
Network			- 10.10.10.120    - 10.10.10.127
Network			- 10.10.10.128    - 10.10.10.135
Network			- 10.10.10.136    - 10.10.10.143
Network			- 10.10.10.144    - 10.10.10.151
Network			- 10.10.10.152    - 10.10.10.159
Network			- 10.10.10.160    - 10.10.10.167
Network			- 10.10.10.168    - 10.10.10.175
Network			- 10.10.10.176    - 10.10.10.183
Network			- 10.10.10.184    - 10.10.10.191
Network			- 10.10.10.192    - 10.10.10.199
Network			- 10.10.10.200    - 10.10.10.207
Network			- 10.10.10.208    - 10.10.10.215
Network			- 10.10.10.216    - 10.10.10.223
Network			- 10.10.10.224    - 10.10.10.231
Network			- 10.10.10.232    - 10.10.10.239
Network			- 10.10.10.240    - 10.10.10.247
Network			- 10.10.10.248    - 10.10.10.255

#6. Задача: вас попросили организовать стык между двумя организациями. Диапазоны 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16 уже заняты. Из какой подсети допустимо взять частные IP-адреса? Маску выберите из расчёта — максимум 40–50 хостов внутри подсети.
#Ответ
Название подсети      Размер	Выделенный размер	Адрес	   Маска	Десятичная маска	Диапазон доступных адресов	Широковещание
        A       	50      	62	     100.64.0.0	    /26  	255.255.255.192 	100.64.0.1 - 100.64.0.62	100.64.0.63

#7. Как проверить ARP-таблицу в Linux, Windows? Как очистить ARP-кеш полностью? Как из ARP-таблицы удалить только один нужный IP?
#Ответ
Просмотр таблицы ARP Linux 
$ arp -n
Просмотр таблицы ARP Windows
$ arp -a
------------------
Отчистка ARP-кеш Linux
$ ip -s -s neigh flush all
Отчистка ARP-кеш Windows
$ arp -d
------------------
Удаление из ARP таблицы один IP Linux
$ arp -d <ip-address>
Удаление из ARP таблицы один IP Windows
$ arp -d <ip-address>

