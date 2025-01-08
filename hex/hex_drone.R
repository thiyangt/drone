install.packages("hexSticker")
library(hexSticker)
library(here)
imgurl <- here("hex", "drone.png")
sticker(imgurl, package="drone",
        p_size=30, 
        h_fill = "#41b6c4",
        p_color = "#7a0177",
        h_color = "#74c476",
        s_x=1, s_y=.75, 
        s_width=.6,
        filename="hex/dronehex.png")
