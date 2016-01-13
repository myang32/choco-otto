$url = 'https://releases.hashicorp.com/otto/0.2.0/otto_0.2.0_windows_386.zip'
$checksum = 'E7015130C661E2648F3FEA4B99AAE5D8C0433D31'
$url64bit = 'https://releases.hashicorp.com/otto/0.2.0/otto_0.2.0_windows_amd64.zip'
$checksum64 = '5FA3A068A5AAA4A4BB9324D4CEEEB474D8466252'
$unzipLocation = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-ChocolateyZipPackage "otto" "$url" "$unzipLocation" "$url64bit" `
 -checksum $checksum -checksumType 'sha1' -checksum64 $checksum64
