# centos-softether
SoftEther on Centos 7 with a swiss french locale

```
docker run -p 500:500/udp \
	-p 4500:4500/udp  \
	-p 1701:1701/tcp  \
	-p 5555:5555/tcp  \
	-p 1194:1194/udp  \
	--name softether  \
	soriyath/centos-softether
```
