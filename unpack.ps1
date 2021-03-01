mkdir output

gci "input\*.pack2" | % {
    $dest = "output\$($_.BaseName)"
    mkdir $dest
    & .\offzip\offzip.exe -z 15 -a "$($_.FullName)" "$dest"
}
