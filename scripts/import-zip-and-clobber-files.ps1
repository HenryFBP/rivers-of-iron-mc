$destination = "./"

Write-Output "This script will copy and overwrite all files from 'input/*.zip' INTO the folder '$destination'."

New-Item -Type Directory -Path input -Force

$filenum = Get-ChildItem input/*.zip -Recurse -File | Measure-Object | ForEach-Object{$_.Count}

Write-Output "$filenum files in 'input/*.zip' "

if ( "1" -ne $filenum )
{
	Write-Output "Less or more than 1 zip file in 'input/*.zip'. Halting."
	Exit(1)
} else {
	Write-Output "1 File detected in 'input/*.zip'... Extracting..."
}

$filepath = Get-ChildItem input/*.zip


Expand-Archive -LiteralPath $filepath -DestinationPath $destination -Force