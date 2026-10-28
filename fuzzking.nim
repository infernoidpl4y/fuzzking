import std/rdstdin, strutils, os, httpclient, unicode

var client = newHttpClient()

proc fuzz(url: string, pfile: string): void =
    var wfile = readFile(pfile)
    var wlist = wfile.split("\n")
    for i in wlist:
        var rurl = url.replace("FZZK", i.strip())
        try:
            let response = client.get(rurl)
            if response.status!="404 Not Found":
                echo "[",response.status,"] -> ", rurl, " -> ", response.body.runeLen()/1000, "KB"
            else:
                echo "[",response.status,"] -> ", rurl
        except OSError:
            echo "[ERROR] -> ", rurl

try:
    if (paramStr(1)=="-a" or paramStr(1)=="-address") and (paramStr(3)=="-w" or paramStr(3)=="-w"):
        fuzz(paramStr(2), paramStr(4))
    else:
      echo """Fuzzking 1.0 (https://github.com/infernoidpl4y/fuzzking)
    Usage: fuzzking <option> [data]
    -a, -address    Address to fuzzing.
    -w, -wordlist      Path to Wordlist
    -h, -help       Show this message.
    Example:
    fuzzing -a https://example.com/FZZK -w /home/user/wordlist/wordlist.txt
    """
except IndexDefect:
    echo """Fuzzking 1.0 (https://github.com/infernoidpl4y/fuzzking)
    Uso: fuzzking <opcion> [datos]
    -d, -direccion  Direccion a realizar fuzzing.
    -l, -lista      Direccion del archivo(Wordlist)
    -h, -help       Muestra este mensaje
    Ejemplo:
    fuzzing -d https://example.com/FZK -l /home/user/wordlist/wordlist.txt
    """
