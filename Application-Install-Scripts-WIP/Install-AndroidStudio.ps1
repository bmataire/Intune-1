# Test code to figure out latest version and download url of Android Studio for Windows
# https://developer.android.com/studio

$xml = Invoke-WebRequest -UseBasicParsing -Uri "https://dl.google.com/android/studio/patches/updates.xml"

$release = "AI-2-release"
$node = ([xml]$xml.Content).products.product.channel | Where-Object { $_.id -eq $release  }

$version = ($node.build.version)
$shortBuildNumber = ($node.build.number).Split('.')[0].Split('-')[1]
$longBuildNumber = ($node.build.number).Split('.')[-1]

$downloadUrl = "https://dl.google.com/dl/android/studio/install/$($version).0/android-studio-ide-$($shortBuildNumber).$($longBuildNumber)-windows.exe"

Write-Host $downloadUrl