# Формируем переменные с путями и заголовками
$NameGetPhoneFile = ".\WhereFIndFIle.csv"
$WhereGetPhoneFile = ".\WhereGetPhoneFile.CSV"

# Забираем данные из CSV 
$getData = Import-Csv -Delimiter ';' -Encoding UTF8 -Path $NameGetPhoneFile -Header Contract,Phone
$FindText = Import-Csv -Delimiter ';' -Encoding UTF8 -Path $WhereGetPhoneFile -Header phone,submission_date,gate_status

# Получаем данные на основе которых будем осуществлять поиск 
$Phones = $getData.phone

# Проходим циклом для поиска данных и записываем все найденное в $data  
$data = foreach ($Filter in $Phones){
    $FindText | where {$_.phone -like "*$Filter*"}
}