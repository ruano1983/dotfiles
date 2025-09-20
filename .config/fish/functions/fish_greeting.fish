function fish_greeting
    echo Hello $USER!
    echo Today is (set_color yellow; date "+%A %d %B";set_color normal) and this machine is called (set_color yellow)$hostname (set_color normal) with the kernel  (set_color yellow; uname -r) (set_color normal)
    colorscript -e 33
end
