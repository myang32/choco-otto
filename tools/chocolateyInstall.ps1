$url = 'https://releases.hashicorp.com/otto/0.1.2/otto_0.1.2_windows_386.zip'
$checksum = '4efba7abd264f88d9a6f61f8ae041640c7f089c6'
$url64bit = 'https://releases.hashicorp.com/otto/0.1.2/otto_0.1.2_windows_amd64.zip'
$checksum64 = '10cbda39a202e4ca0bb4942a8cd32ec8bc36f4fa'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "otto" "$url" "$unzipLocation" "$url64bit" `
 -checksum $checksum -checksumType 'sha1' -checksum64 $checksum64
