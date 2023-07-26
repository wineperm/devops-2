#1. BW:	1000 Mbps  	required or minimum available bandwidth
   RTT: 300 ms	round trip time
   WIN: 36621 KByte  	required or available TCP buffer size
#2. На калькулторе в 1000 раз
#3. 100 мегабит/сек равно 12.5 мегабайт/Сек влияет. Уменьшается фрейм, уменьшается скорость передачи...
#4. qwerty@virtual-machine:~/git/devops-2$ strace -e network curl -I http://netology.ru > /dev/null
socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
connect(3, {sa_family=AF_UNIX, sun_path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
socket(AF_UNIX, SOCK_STREAM|SOCK_CLOEXEC|SOCK_NONBLOCK, 0) = 3
connect(3, {sa_family=AF_UNIX, sun_path="/var/run/nscd/socket"}, 110) = -1 ENOENT (No such file or directory)
socket(AF_INET6, SOCK_DGRAM, IPPROTO_IP) = 3
socketpair(AF_UNIX, SOCK_STREAM, 0, [3, 4]) = 0
socketpair(AF_UNIX, SOCK_STREAM, 0, [5, 6]) = 0
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0socket(AF_INET, SOCK_STREAM, IPPROTO_TCP) = 5
setsockopt(5, SOL_TCP, TCP_NODELAY, [1], 4) = 0
setsockopt(5, SOL_SOCKET, SO_KEEPALIVE, [1], 4) = 0
setsockopt(5, SOL_TCP, TCP_KEEPIDLE, [60], 4) = 0
setsockopt(5, SOL_TCP, TCP_KEEPINTVL, [60], 4) = 0
connect(5, {sa_family=AF_INET, sin_port=htons(80), sin_addr=inet_addr("172.67.21.207")}, 16) = -1 EINPROGRESS (Operation now in progress)
getsockopt(5, SOL_SOCKET, SO_ERROR, [0], [4]) = 0
getpeername(5, {sa_family=AF_INET, sin_port=htons(80), sin_addr=inet_addr("172.67.21.207")}, [128 => 16]) = 0
getsockname(5, {sa_family=AF_INET, sin_port=htons(40194), sin_addr=inet_addr("192.168.203.128")}, [128 => 16]) = 0
sendto(5, "HEAD / HTTP/1.1\r\nHost: netology."..., 76, MSG_NOSIGNAL, NULL, 0) = 76
recvfrom(5, "HTTP/1.1 301 Moved Permanently\r\n"..., 102400, 0, NULL, NULL) = 276
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
+++ exited with 0 +++
#5. qwerty@virtual-machine:~/git/devops-2$ dig +trace www.google.co.uk.

; <<>> DiG 9.18.12-0ubuntu0.22.04.2-Ubuntu <<>> +trace www.google.co.uk.
;; global options: +cmd
.			5	IN	NS	k.root-servers.net.
.			5	IN	NS	l.root-servers.net.
.			5	IN	NS	m.root-servers.net.
.			5	IN	NS	a.root-servers.net.
.			5	IN	NS	b.root-servers.net.
.			5	IN	NS	c.root-servers.net.
.			5	IN	NS	d.root-servers.net.
.			5	IN	NS	e.root-servers.net.
.			5	IN	NS	f.root-servers.net.
.			5	IN	NS	g.root-servers.net.
.			5	IN	NS	h.root-servers.net.
.			5	IN	NS	i.root-servers.net.
.			5	IN	NS	j.root-servers.net.
;; Received 239 bytes from 127.0.0.53#53(127.0.0.53) in 75 ms

;; UDP setup with 2001:dc3::35#53(2001:dc3::35) for www.google.co.uk. failed: network unreachable.
;; UDP setup with 2001:dc3::35#53(2001:dc3::35) for www.google.co.uk. failed: network unreachable.
;; UDP setup with 2001:dc3::35#53(2001:dc3::35) for www.google.co.uk. failed: network unreachable.
uk.			172800	IN	NS	nsa.nic.uk.
uk.			172800	IN	NS	nsb.nic.uk.
uk.			172800	IN	NS	nsc.nic.uk.
uk.			172800	IN	NS	nsd.nic.uk.
uk.			172800	IN	NS	dns1.nic.uk.
uk.			172800	IN	NS	dns2.nic.uk.
uk.			172800	IN	NS	dns3.nic.uk.
uk.			172800	IN	NS	dns4.nic.uk.
uk.			86400	IN	DS	43876 8 2 A107ED2AC1BD14D924173BC7E827A1153582072394F9272BA37E2353 BC659603
uk.			86400	IN	RRSIG	DS 8 1 86400 20230808050000 20230726040000 11019 . NHm080RvHU4G31ydDrxFZTEwtQXf/r6V062IbG5a6nfDCIaYyv+5qN+i lqCMBgsgnX48c8aGGRnU7W0G7lS7SHZhGmefpD0Zos2EL7nJ9oGIYm8k M0wZFlwax3db6z5PB5jfK8w/8L1HV8ChxgTsUL/La2w6N+/DkuWAgl2L Bi+tZwif+RU9Yq0vr1NceSswkK38G3G0VkTNEA6ALuP1oUt3lswUBjSR q9GNW0WwUlJLBqXFdkhAYCxAPBP7tpjKh3sgdDTyETJpq2AldSZiHpdp sy7akkdJGhf5nMR2EWtgrVr8Ve9nVM5E+6swV5/aBbhT7oiVGSqB/g+f cU2tKA==
;; Received 884 bytes from 198.97.190.53#53(h.root-servers.net) in 67 ms

google.co.uk.		172800	IN	NS	ns2.google.com.
google.co.uk.		172800	IN	NS	ns4.google.com.
google.co.uk.		172800	IN	NS	ns1.google.com.
google.co.uk.		172800	IN	NS	ns3.google.com.
G9F1KIIHM8M9VHJK7LRVETBQCEOGJIQP.co.uk.	10800 IN NSEC3 1 1 0 - G9F3NQ74NTIT1D6QSRKCCS86R4T7H1MD NS SOA RRSIG DNSKEY NSEC3PARAM TYPE65534
G9F1KIIHM8M9VHJK7LRVETBQCEOGJIQP.co.uk.	10800 IN RRSIG NSEC3 8 3 10800 20230824155955 20230720152220 33621 co.uk. V0wWfvwQqJ0itiTyEhV8o2X7DZHGPT4x81XJl//m5amlRbESzZarMuHQ SEy2NNt4n2OX6kE3krW29db1M4NIu9B6x3Egb871Gxe1RyFNAQlkMS9X 0lvLoH6Nl+9TdCSqW3XXJ5KV5xq9bWYuYVHxapS5q3w6hTDJzSLw2Xu5 hsA=
6QEM8MNQTC42IH4DOQ4CBRRJ4R30OO55.co.uk.	10800 IN NSEC3 1 1 0 - 6QF16S089GRU386I3JOL1T2E5CV61060 NS DS RRSIG
6QEM8MNQTC42IH4DOQ4CBRRJ4R30OO55.co.uk.	10800 IN RRSIG NSEC3 8 3 10800 20230827173533 20230723164611 33621 co.uk. lHCRJ75YaupdFC0QmJjNycfgQXaRs1WOUtFxckAmQXF3UDCNWtN9QQgw /RzI8aOUOT1mlq4sunHtPFrZE+oloVOTatjMOAAjTDr+JN51KnOF76NK 4BATW1IRE14934Gc9/NRfAP7a+Muwnn9QD1EjsHNhSWHqTYmkQAN+l0z +DE=
;; Received 683 bytes from 156.154.102.3#53(nsc.nic.uk) in 47 ms

;; UDP setup with 2001:4860:4802:36::a#53(2001:4860:4802:36::a) for www.google.co.uk. failed: network unreachable.
;; UDP setup with 2001:4860:4802:32::a#53(2001:4860:4802:32::a) for www.google.co.uk. failed: network unreachable.
www.google.co.uk.	300	IN	A	64.233.165.94
;; Received 61 bytes from 216.239.36.10#53(ns3.google.com) in 43 ms 
#6. /25 - 126 доступно хостам адресов, с маской 255.248.0.0 - 524286 свободных адресов для хостов.
#7. /23 - 512 адресов, /24 - 256 адресов - в /23 больше.
#8. Получится, маска будет /15. 
