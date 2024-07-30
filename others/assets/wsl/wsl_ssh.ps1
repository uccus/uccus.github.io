# 开启wsl的ssh服务
wsl -d Ubuntu-18.04 -u root /etc/init.d/ssh start

# 获取wsl的ip，ip是动态的，所以每次开机获取
$wslIP = wsl -- hostname -I
$wslIP = $wslIP.Trim()

# 端口映射
$listen_address = 0.0.0.0
$listen_port = 220
$connect_port = 220
netsh interface portproxy add v4tov4 listenport=$listen_port listenaddress=$listen_address connectaddress=$wslIP connectport=$connect_port 

# 防火墙规则，防火墙关闭则不用管
# Remove-NetFirewallRule -DisplayName "Allow WSL Inbound Port 22" -ErrorAction SilentlyContinue
# New-NetFirewallRule -DisplayName "Allow WSL Inbound Port 22" -Direction Inbound -Action Allow -Protocol TCP -LocalPort 22

