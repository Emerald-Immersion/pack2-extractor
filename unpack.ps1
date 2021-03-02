mkdir output

gci "input\*.pack2" | % {
    $dest = "output\$($_.BaseName)"
	if (-not [IO.Directory]::Exists($dest)) {
        mkdir $dest
        & .\offzip\offzip.exe -z 15 -a "$($_.FullName)" "$dest" 2>&1 | out-null
    }
}
