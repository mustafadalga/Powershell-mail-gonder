$smtpSunucusu = "smtp.gmail.com"
$smtpPort = "587" 

$gmail = new-object System.Net.Mail.SmtpClient($smtpSunucusu, $smtpPort)
$gmail.EnableSsl = $true
echo " "
echo "Gmail E-posta ayarlar�n�z yap�lacak."
echo " "
echo "Kulland���n�z Gmail adresini giriniz."
$Global:kullanici =  read-host

echo "Bu Gmail adresi i�in �ifrenizi giriniz."
$sifre = $host.UI.ReadLineAsSecureString()
$gmail.credentials = new-object System.Net.NetworkCredential($kullanici, $sifre)
add-member -InputObject $gmail -MemberType ScriptMethod -Name "gonder" -Value {param($kime, $konu, $govde); $gmail.send($kullanici, $kime, $konu, $govde); echo "Mail g�nderildi"; }

$Global:gmail = $gmail
echo " "
echo 'Mail ayarlar�n�z yap�ld�. Mail gondermek i�in $gmail.gonder() komutunu kullanabilirsiniz.'
echo " "
echo '�rnek:'
echo '$gmail.gonder("alici@adre.si", "konu", "govdemetni")'
echo " "