# Log dir
set("log.file.path","./tmp/basic-radio.log")

# Serveur settings
set("harbor.bind_addr","0.0.0.0")

# An emergency file
emergency = single("./file.ogg")

# A playlist
playlist = playlist(mode="randomize",reload=60,"./music")

# A live source
livedj = input.harbor(
       "mount",
       port=8080,
       password="hackme"
)

# fallback
radio = fallback(track_sensitive=false,
                 [livedj,playlist,emergency])

# Stream it out
output.icecast(
    %mp3,
    host = "localhost",
    mount = "stream",
    user = "source",
    public = true,
    port = 8000, password = "hackme",
    genre = "Surprise",
    name = "DemoStream",
    radio)
