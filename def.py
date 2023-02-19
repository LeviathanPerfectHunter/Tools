# -*- coding: utf-8 -*
#!/usr/bin/python
#######################################
# Leviathan Perfect Hunter - Yuuki
##############[LIBS]###################
import requests, re, os, sys, codecs, random
from multiprocessing.dummy import Pool
from time import time as timer
import time
import warnings
import subprocess
from requests.packages.urllib3.exceptions import InsecureRequestWarning
warnings.simplefilter('ignore',InsecureRequestWarning)
##############
PURPLE = '\033[95m'
CYAN = '\033[96m'
DARKCYAN = '\033[36m'
BLUE = '\033[94m'
GREEN = '\033[92m'
YELLOW = '\033[93m'
RED = '\033[91m'
BOLD = '\033[1m'
UNDERLINE = '\033[4m'
END = '\033[0m'

primer ="""
 _                _       _   _                  ______          __          _     _   _             _            
| |              (_)     | | | |                 | ___ \        / _|        | |   | | | |           | |           
| |     _____   ___  __ _| |_| |__   __ _ _ __   | |_/ /__ _ __| |_ ___  ___| |_  | |_| |_   _ _ __ | |_ ___ _ __ 
| |    / _ \ \ / / |/ _` | __| '_ \ / _` | '_ \  |  __/ _ \ '__|  _/ _ \/ __| __| |  _  | | | | '_ \| __/ _ \ '__|
| |___|  __/\ V /| | (_| | |_| | | | (_| | | | | | | |  __/ |  | ||  __/ (__| |_  | | | | |_| | | | | ||  __/ |   
\_____/\___| \_/ |_|\__,_|\__|_| |_|\__,_|_| |_| \_|  \___|_|  |_| \___|\___|\__| \_| |_/\__,_|_| |_|\__\___|_|   
                                                                                                                 
                                      - Simple Defense
"""
print(primer)
def cronwar():
        while 1:
                try:
                        leviathan = [ "leviathanperfecthunter.org"  ]
                        for x in leviathan:
                                Agent = {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36'}
                                se = requests.session()
                                ktn1 = se.get(x, headers=Agent, verify=False, timeout=1)
                                if ktn1.status_code == 200:
                                        print (GREEN + 'DEFEND ON Leviathan Perfect Hunter V1! ..... [' + x + ']' + END)
                                        time.sleep(1)
                                else:
                                        print (RED + 'SORRY YOUR DEFEND INVALID  (-) ' + x + END)

                except Exception as e:
                        pass

cronwar()
#python3
