function fish_greeting
    echo Hello friend!
    echo Today is (set_color yellow; date "+%A %d %b %Y %T";set_color normal) and this machine is called (set_color yellow)$hostname (set_color normal) with the kernel  (set_color yellow; uname -r)
    colorscript -e 15
end
