"Running tests"
$ErrorActionPreference = "Stop"
$version = $env:APPVEYOR_BUILD_VERSION -replace('\.[^.\\/]+$')

"TEST: Version $version in otto.nuspec file should match"
[xml]$spec = Get-Content otto.nuspec
if ($spec.package.metadata.version.CompareTo($version)) {
  Write-Error "FAIL: rong version in nuspec file!"
}

"TEST: Package should contain only install script"
Add-Type -assembly "system.io.compression.filesystem"
$zip = [IO.Compression.ZipFile]::OpenRead("$pwd\otto.$version.nupkg")
if ($zip.Entries.Count -ne 5) {
  Write-Error "FAIL: Wrong count in nupkg!"
}
$zip.Dispose()

"TEST: Installation of package should work"
. choco install -y otto -source .

"TEST: Version of binary should match"
. otto --version
if (-Not $(otto --version).Contains("Otto v$version")) {
  Write-Error "FAIL: Wrong version of otto installed!"
}

"TEST: Uninstall show remove the binary"
. choco uninstall otto
try {
  . otto
  Write-Error "FAIL: otto binary still found"
} catch {
  Write-Host "PASS: otto not found"
}

"TEST: Finished"
