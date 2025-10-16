(defvar show-bluetooth-tooltip false)
(defvar show-cpu-tooltip false)
(defvar show-temp-tooltip false)
(defvar show-ram-tooltip false)
(defvar show-disk-tooltip false)
(defvar show-linux-tooltip false)
(defvar show-player-tooltip false)
(defvar show-volume-tooltip false)
(defvar show-kblayout-tooltip false)
(defvar show-wifi-tooltip false)
(defvar show-date-tooltip false)

(deflisten bluetooth  "bash scripts/bluetooth_watch_dbus.sh")
(deflisten cpu-temp "bash scripts/cpu_temp.sh")
(deflisten ram "bash scripts/ram.sh")
(deflisten disk "bash scripts/disk.sh")
(defpoll sysinfo :interval "20m" "bash scripts/system_info.sh")
(deflisten player "bash scripts/player.sh")
(deflisten audio  "bash scripts/audio.sh")
(defpoll kblayout :interval "2s" "bash scripts/kblayout-dwl.sh")
(defpoll wifi :interval "7s" "bash scripts/wifi.sh")
(deflisten date "bash scripts/date.sh")
(deflisten dwl-tags "bash scripts/dwl_tags.sh")

(defwidget dwl-tags-widget []
  (box 
    :class "workspaces"
    :orientation "h"
    :space-evenly true
    :spacing 10
    :valign "center"
    :halign "center"
    (for tag in dwl-tags
	(button 
	    :class "${tag.class}"
	    :onclick "dwlmsg -s -t ${tag.id}"
	    "󰝤"
	
      )
    )
  )
)

(defwidget player-widget []
    (box 
	:class "player"
	:orientation "h"
	:space-evenly false
	:valign "center"
	:halign "center"
	(eventbox
	    :onhover "if [ \"${player.status}\" = \"Playing\" ]; then eww open player-tooltip && eww update show-player-tooltip=true; fi"
	    :onhoverlost "eww close player-tooltip && eww update show-player-tooltip=false"
	    (label :text "󰝚  ${player.status}")
	)
    )
    
)

(defwindow player-tooltip
  :monitor 0
  :geometry (geometry :x "605" :y "0" :width "150" :height "30")
  :stacking "fg"
  :wm-ignore true          ; Ignora el gestor de ventanas
  :exclusive false
  :focusable false
  (box :class "tooltip" :orientation "v"
	(label :wrap true :text "󰐊 ${player.status}")
	(label :wrap true :text "${player.artist}")
	(label :wrap true :width 250 :text "󰝚  ${player.title}")
    )

)

(defwidget wifi-widget []
    (box 
	:class "wifi"
	:orientation "h"
	:space-evenly false
	:valign "center"
	:halign "center"
	(eventbox
	    :onhover "eww open wifi-tooltip && eww update show-wifi-tooltip=true"
	    :onhoverlost "eww close wifi-tooltip && eww update show-wifi-tooltip=false"
	    (label
		:text "󰖩   Wifi: ${wifi.signal}%"
	    )
	)
    )
)

(defwindow wifi-tooltip
    :monitor 0
    :geometry (geometry :x "715" :y "0" :width "150" :height "30")
    :stacking "fg"
    :wm-ignore true          ; Ignora el gestor de ventanas
    :exclusive false
    :focusable false
    (box :class "tooltip" :orientation "v" 
	(label :text "${wifi.iface}: ${wifi.ip}") 
	(label :text "${wifi.ssid}: ${wifi.signal}%")
    )
)

(defwidget bluetooth-widget []
    (box
	:class "bluetooth"
	:orientation "h"
	:space-evenly false
	:valign "center"
	:halign "center"
	:spacing 0
	(eventbox
	    :onhover "eww open bluetooth-tooltip && eww update show-bluetooth-tooltip=true"
	    :onhoverlost "eww close bluetooth-tooltip && eww update show-bluetooth-tooltip=false"
	    (label
		:text "   Bluetooth: ${bluetooth.count}"
	    )
	)
    )
)

(defwindow bluetooth-tooltip
  :monitor 0
  :geometry (geometry :x "855" :y "0" :width "150" :height "30")
  :stacking "fg"
  :wm-ignore true          ; Ignora el gestor de ventanas
  :exclusive false
  :focusable false
  (box :class "tooltip" :orientation "v"
	(label :text "Dispositivos: ${bluetooth.count}")
	(for dev in {bluetooth.devices}
	    (label :text "${dev}")
         )

  )
)

(defwidget cpu-widget []
    (box    
	:class "cpu"
	:orientation "h"
	:space-evenly false
	:valign "center"
	:halign "center"
	:spacing 0
	(eventbox
	    :onhover "eww open cpu-tooltip && eww update show-cpu-tooltip=true"
	    :onhoverlost "eww close cpu-tooltip && eww update show-cpu-tooltip=false"
	    (label 
		:text "   Cpu: ${round(EWW_CPU.avg,1)} %"
	    )
	) 
    ) 
)

(defwindow cpu-tooltip
    :monitor 0
    :geometry (geometry :x "950" :y "0" :width "150" :height "30")
    :stacking "fg"
    :wm-ignore true          ; Ignora el gestor de ventanas
    :exclusive false
    :focusable false 
    (box :class "tooltip" :orientation "v"
	(label :text "Uso de Cpu: ${round(EWW_CPU.avg,1)}%")
	(label :text "Core 0: ${round(EWW_CPU.cores[0].usage,1)}% ${EWW_CPU.cores[0].freq} Mhz")
	(label :text "Core 1: ${round(EWW_CPU.cores[1].usage,1)}% ${EWW_CPU.cores[1].freq} Mhz")
	(label :text "Core 2: ${round(EWW_CPU.cores[2].usage,1)}% ${EWW_CPU.cores[2].freq} Mhz")
	(label :text "Core 3: ${round(EWW_CPU.cores[3].usage,1)}% ${EWW_CPU.cores[3].freq} Mhz")
	(label :text "Core 4: ${round(EWW_CPU.cores[4].usage,1)}% ${EWW_CPU.cores[4].freq} Mhz")
	(label :text "Core 5: ${round(EWW_CPU.cores[5].usage,1)}% ${EWW_CPU.cores[5].freq} Mhz")
	(label :text "Core 6: ${round(EWW_CPU.cores[6].usage,1)}% ${EWW_CPU.cores[6].freq} Mhz")
	(label :text "Core 7: ${round(EWW_CPU.cores[7].usage,1)}% ${EWW_CPU.cores[7].freq} Mhz")
	(label :text "Core 8: ${round(EWW_CPU.cores[8].usage,1)}% ${EWW_CPU.cores[8].freq} Mhz")
	(label :text "Core 9: ${round(EWW_CPU.cores[9].usage,1)}% ${EWW_CPU.cores[9].freq} Mhz")
	(label :text "Core 10: ${round(EWW_CPU.cores[10].usage,1)}% ${EWW_CPU.cores[10].freq} Mhz")
	(label :text "Core 11: ${round(EWW_CPU.cores[11].usage,1)}% ${EWW_CPU.cores[11].freq} Mhz")
	(label :text "Core 12: ${round(EWW_CPU.cores[12].usage,1)}% ${EWW_CPU.cores[12].freq} Mhz")
	(label :text "Core 13: ${round(EWW_CPU.cores[13].usage,1)}% ${EWW_CPU.cores[13].freq} Mhz")
	(label :text "Core 14: ${round(EWW_CPU.cores[14].usage,1)}% ${EWW_CPU.cores[14].freq} Mhz")
	(label :text "Core 15: ${round(EWW_CPU.cores[15].usage,1)}% ${EWW_CPU.cores[15].freq} Mhz")

   )
)

(defwidget temp-widget []
    (box    
	:class "temp"
	:orientation "h"
	:space-evenly false
	:valign "center"
	:halign "center"
	(eventbox
	    :onhover "eww open temp-tooltip && eww update show-temp-tooltip=true"
	    :onhoverlost "eww close temp-tooltip && eww update show-temp-tooltip=false"
	    (label 
	    :text "   Temp: ${cpu-temp} °C"
	    )
	)
    )
)

(defwindow temp-tooltip
  :monitor 0
  :geometry (geometry :x "1045" :y "0" :width "150" :height "30")
  :stacking "fg"
  :wm-ignore true          ; Ignora el gestor de ventanas
  :exclusive false
  :focusable false
  (box :class "tooltip" (label :text "Temperatura Ryzen: ${cpu-temp}°C"))
)

(defwidget ram-widget []
    (box    
	:class "ram"
	:orientation "h"
	:space-evenly false
	:valign "center"
	:halign "center"
	(eventbox
	    :onhover "eww open ram-tooltip && eww update show-ram-tooltip=true"
	    :onhoverlost "eww close ram-tooltip && eww update show-ram-tooltip=false"
	    (label 
		:text "    Ram: ${ram.used}G/${ram.total}G"

	    )
	)    
    )
)

(defwindow ram-tooltip
  :monitor 0
  :geometry (geometry :x "1160" :y "0" :width "150" :height "30")
  :stacking "fg"
  :wm-ignore true          ; Ignora el gestor de ventanas
  :exclusive false
  :focusable false
  (box :class "tooltip" :orientation "v" 
  (label :text "Memoria usada: ${ram.used}G/${ram.total}G")
  (label :text "Memoria cache: ${ram.cache}G")
  )
)

(defwidget disk-widget []
    (box    
	:class "disk"
	:orientation "h"
	:space-evenly false
	:valign "center"
	:halign "center"
	(eventbox
	    :onhover "eww open disk-tooltip && eww update show-disk-tooltip=true"
	    :onhoverlost "eww close disk-tooltip && eww update show-disk-tooltip=false"
	    (label 
		:text "🖴  Disk: ${disk.root.used}G/${disk.root.size}G"
	    )
	)
    )
)


(defwindow disk-tooltip
    :monitor 0
    :geometry (geometry :x "1300" :y "0" :width "150" :height "30")
    :stacking "fg"
    :wm-ignore true          ; Ignora el gestor de ventanas
    :exclusive false
    :focusable false
    (box :class "tooltip" :orientation "v"
	(label :text "Partición /: ${disk.root.used}G/${disk.root.size}G \(${disk.root.percent}%\)")
	(label :text "Partición Home: ${disk.home.used}G/${disk.home.size}G \(${disk.home.percent}%\)")
	(label :text "Partición build: ${disk.build.used}G/${disk.build.size}G \(${disk.build.percent}%\)")
    )
)

(defwidget systeminfo-widget []
    (box    
	:class "linux"
	:orientation "h"
	:space-evenly false
	:valign "center"
	:halign "center"
	(eventbox
	    :onhover "eww open systeminfo-tooltip && eww update show-linux-tooltip=true"
	    :onhoverlost "eww close systeminfo-tooltip && eww update show-linux-tooltip=false"
	    (label 
		:text "   Linux: ${sysinfo.kernel}"
	    )	
	)
    ) 
)

(defwindow systeminfo-tooltip
    :monitor 0
    :geometry (geometry :x "1420" :y "0" :width "150" :height "30")
    :stacking "fg"
    :wm-ignore true          ; Ignora el gestor de ventanas
    :exclusive false
    :focusable false
    (box :class "tooltip" :orientation "v" 
    	(label :text "${sysinfo.os} ${sysinfo.version}")
    	(label :text "${sysinfo.kernel}")
    )
)

(defwidget audio-widget []
    (eventbox
	:onscroll "bash scripts/volume_scroll.sh {}"
	:onclick "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	(box 
	    :class "volume"
	    :orientation "h"
	    :space-evenly false
	    :valign "center"
	    :halign "center"
	    (eventbox
		:onhover "eww open audio-tooltip && eww update show-volume-tooltip=true"
		:onhoverlost "eww close audio-tooltip && eww update show-volume-tooltip=false"
		(label
		:text {audio.muted ? "    Muted" : "   Vol:  ${audio.volume}%"}
		:class {audio.muted ? "muted" : "normal"}
		)
	    )
	)
    )
)

(defwindow audio-tooltip
  :monitor 0
  :geometry (geometry :x "1540" :y "0" :width "150" :height "30")
  :stacking "fg"
  :wm-ignore true          ; Ignora el gestor de ventanas
  :exclusive false
  :focusable false
  (box :class "tooltip" :orientation "v"
  (label :text {audio.muted ? "Muted" : "Volumen:  ${audio.volume}%"})
  (label :text "${audio.device}")
  )
)

(defwidget kblayout-widget []
    (box 
	:class "kblayout"
	:orientation "h"
	:space-evenly false
	:valign "center"
	:halign "center"
	(eventbox
	    :onhover "eww open kblayout-tooltip && eww update show-kblayout-tooltip=true"
	    :onhoverlost "eww close kblayout-tooltip && eww update show-kblayout-tooltip=false"
	    (label
		:text "󰌌  ${kblayout.layout}"
	    )
	)
    )
)

(defwindow kblayout-tooltip
  :monitor 0
  :geometry (geometry :x "1670" :y "0" :width "150" :height "30")
  :stacking "fg"
  :wm-ignore true          ; Ignora el gestor de ventanas
  :exclusive false
  :focusable false
  (box :class "tooltip" (label :text "Layout: ${kblayout.layout}"))

)


(defwidget date-widget []
    (box    
	:class "date"
	:orientation "h"
	:space-evenly false
	:valign "center"
	:halign "center"
	(eventbox
	    :onhover "eww open date-tooltip && eww update show-date-tooltip=true"
	    :onhoverlost "eww close date-tooltip && eww update show-date-tooltip=false"
	    (label 
		:text ":   ${date}"
	    )
	)
    )
)

(defwindow date-tooltip
  :monitor 0
  :geometry (geometry :x "1770" :y "0" :width "150" :height "30")
  :stacking "fg"
  :wm-ignore true          ; Ignora el gestor de ventanas
  :exclusive false
  :focusable false
  (box :class "tooltip" (label :text "${date}")) 
	
)


;; 3. Define tu ventana principal (donde quieres la barra)
(defwindow main_bar
  :monitor 0
  :geometry (geometry :x "0%" :y "0%" :width "100%" :height "36px" :anchor "top center")
  :stacking "bottom"
  :exclusive true
  :namespace "bar"
  (box :class "bar-bg"
    :orientation "h"
    :space-evenly false
    :halign "fill"
    (dwl-tags-widget)
    (box :orientation "h" :halign "end" :hexpand true :spacing 6 :space-evenly false
    (player-widget)
    (wifi-widget)
    (bluetooth-widget)
    (cpu-widget)
    (temp-widget)
    (ram-widget)
    (disk-widget)
    (systeminfo-widget)
    (audio-widget)
    (kblayout-widget)
    (date-widget) 
    ))
)
