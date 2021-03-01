$ps2 = "<your ps2 folder>"

mkdir output

gci "$ps2\Resources\Assets\assets*" | % {
    $dest = "output\$($_.BaseName)"
    mkdir $dest
    & .\offzip\offzip.exe -z 15 -a "$($_.FullName)" "$dest"
}
