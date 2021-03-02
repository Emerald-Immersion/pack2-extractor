Get-ChildItem "input\*.pack2" | ForEach-Object {
    $dest = "output\$($_.BaseName)"

	if (-not [IO.Directory]::Exists($dest)) {
        mkdir $dest
        mkdir "$($dest)\fsb_extract" | out-null
        & .\bin\offzip\offzip.exe -z 15 -a "$($_.FullName)" "$dest" 2>&1 | out-null
    }
}

Get-ChildItem "output\*\*.fsb" | ForEach-Object {
    $dest = "$($_.Directory)\fsb_extract"
    if (-not [IO.Directory]::Exists($dest)) {
        mkdir $dest 2>&1 | out-null
    }
    & .\bin\fsbext\fsbext.exe -d $dest $_.FullName 2>&1 | out-null
}
