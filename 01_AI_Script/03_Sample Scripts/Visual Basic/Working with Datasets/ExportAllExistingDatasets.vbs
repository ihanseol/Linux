'*************************************************************
' 
' ADOBE SYSTEMS INCORPORATED 
' Copyright 2005-2010 Adobe Systems Incorporated 
' All Rights Reserved 

' NOTICE:  Adobe permits you to use, modify, and 
' distribute this file in accordance with the terms
' of the Adobe license agreement accompanying it.  
' If you have received this file from a source 
' other than Adobe, then your use, modification,
' or distribution of it requires the prior 
' written permission of Adobe. 
' 
'*************************************************************

' ExportAllExistingDatasets.vbs

' DESCRIPTION

' This sample exports all Datasets existing in the current 
' document and creates separate Illustrator files for each
' dataset.
'
'*************************************************************

Set appRef = CreateObject("Illustrator.Application")

const DESKTOP = &H0&
set myShell = CreateObject("Shell.Application")
set myDesktopFolder = myShell.Namespace(DESKTOP)
set myDesktopFolderItem = myDesktopFolder.Self

If (appRef.Documents.Count > 0) Then
	Set docRef = appRef.Documents(1)
	'loop thru datasets
	If docRef.DataSets.Count > 0 Then
	
		' Create folder object for path and save the dataset files.
		Set fileSysRef = CreateObject( "Scripting.FileSystemObject" )
		Set desktopFolder = fileSysRef.GetFolder(myDesktopFolderItem.Path)
		If (fileSysRef.FolderExists(desktopFolder & "\ExportedDatasets")) Then
			Set folderRef = fileSysRef.GetFolder( desktopFolder & "\ExportedDatasets")
		Else
			Set folderRef = desktopFolder.Subfolders.Add("ExportedDatasets")
		End If
				
		For i = 1 To docRef.DataSets.Count
			myPath = folderRef & "\" & i & ".pdf"
			docRef.DataSets(i).Display
			docRef.SaveAs (myPath)
		Next
		appRef.DoJavaScript "alert('Exported all datasets to the ExportedDatasets folder on the desktop.')"
		
	Else 
		appRef.DoJavaScript "alert('No datasets in this document!')"
	End If
Else
	appRef.DoJavaScript "alert('No document open. Please open a document with datasets.')"
End If

'' SIG '' Begin signature block
'' SIG '' MIIeWQYJKoZIhvcNAQcCoIIeSjCCHkYCAQExDzANBglg
'' SIG '' hkgBZQMEAgEFADB3BgorBgEEAYI3AgEEoGkwZzAyBgor
'' SIG '' BgEEAYI3AgEeMCQCAQEEEE7wKRaZJ7VNj+Ws4Q8X66sC
'' SIG '' AQACAQACAQACAQACAQAwMTANBglghkgBZQMEAgEFAAQg
'' SIG '' SPy0KGD9a461+ezTcg5ycXpmxVENciq6DJ1w7dvxgFmg
'' SIG '' ggyUMIIF0DCCBLigAwIBAgIQB3XcWt35KITbGdVVTAfs
'' SIG '' STANBgkqhkiG9w0BAQsFADBsMQswCQYDVQQGEwJVUzEV
'' SIG '' MBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
'' SIG '' d3cuZGlnaWNlcnQuY29tMSswKQYDVQQDEyJEaWdpQ2Vy
'' SIG '' dCBFViBDb2RlIFNpZ25pbmcgQ0EgKFNIQTIpMB4XDTE5
'' SIG '' MDEzMTAwMDAwMFoXDTIxMDIwMzEyMDAwMFowgeYxEzAR
'' SIG '' BgsrBgEEAYI3PAIBAxMCVVMxGTAXBgsrBgEEAYI3PAIB
'' SIG '' AhMIRGVsYXdhcmUxHTAbBgNVBA8MFFByaXZhdGUgT3Jn
'' SIG '' YW5pemF0aW9uMRAwDgYDVQQFEwcyNzQ4MTI5MQswCQYD
'' SIG '' VQQGEwJVUzELMAkGA1UECBMCY2ExETAPBgNVBAcTCFNh
'' SIG '' biBKb3NlMRMwEQYDVQQKEwpBZG9iZSBJbmMuMSwwKgYD
'' SIG '' VQQLEyNJbGx1c3RyYXRvciwgSW5EZXNpZ24sIEluQ29w
'' SIG '' eSwgTXVzZTETMBEGA1UEAxMKQWRvYmUgSW5jLjCCASIw
'' SIG '' DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAIiKXEE3
'' SIG '' 5FJAWPRPxAu4g1GRRZmzrPW3SZL40s8opqkFWksx2dBE
'' SIG '' yP6+N6visRXUyDy+I979oO9tEtHBeYKx1XHy4NOLPl3u
'' SIG '' Lr8rWv5E3hrNw+QRwJvsMJLzBTS44811Rym8ddkt8lpj
'' SIG '' dG1PmC2aZQ73miR88+46IaZDtuabo3corXvrG0wmLFZb
'' SIG '' SrB80HAigwQiwHgh33cI2pPIYA2VdmEv5V3iI+AuYybL
'' SIG '' BPJ32YPqdvcoR3Ml/oYFcFlUb1sliNdngwqEeUTKBWVu
'' SIG '' OTeuRo2gOioizpUxR3cce25eoH8wONWUozkjPwcUEY8I
'' SIG '' RCePRf21c4kjjLGFSmpwEVQVQJcCAwEAAaOCAfEwggHt
'' SIG '' MB8GA1UdIwQYMBaAFI/ofvBtMmoABSPHcJdqOpD/a+rU
'' SIG '' MB0GA1UdDgQWBBSVoz2+cIajBhNjiGb0VJBYxDX9vzAu
'' SIG '' BgNVHREEJzAloCMGCCsGAQUFBwgDoBcwFQwTVVMtREVM
'' SIG '' QVdBUkUtMjc0ODEyOTAOBgNVHQ8BAf8EBAMCB4AwEwYD
'' SIG '' VR0lBAwwCgYIKwYBBQUHAwMwewYDVR0fBHQwcjA3oDWg
'' SIG '' M4YxaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0VWQ29k
'' SIG '' ZVNpZ25pbmdTSEEyLWcxLmNybDA3oDWgM4YxaHR0cDov
'' SIG '' L2NybDQuZGlnaWNlcnQuY29tL0VWQ29kZVNpZ25pbmdT
'' SIG '' SEEyLWcxLmNybDBLBgNVHSAERDBCMDcGCWCGSAGG/WwD
'' SIG '' AjAqMCgGCCsGAQUFBwIBFhxodHRwczovL3d3dy5kaWdp
'' SIG '' Y2VydC5jb20vQ1BTMAcGBWeBDAEDMH4GCCsGAQUFBwEB
'' SIG '' BHIwcDAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGln
'' SIG '' aWNlcnQuY29tMEgGCCsGAQUFBzAChjxodHRwOi8vY2Fj
'' SIG '' ZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRFVkNvZGVT
'' SIG '' aWduaW5nQ0EtU0hBMi5jcnQwDAYDVR0TAQH/BAIwADAN
'' SIG '' BgkqhkiG9w0BAQsFAAOCAQEADtCQA7go0Xu2UKN6dFPe
'' SIG '' YJbS/OXx3n3IP0K9CGPDozeGV62MvbCp+DuptFa44FYR
'' SIG '' ZuljRXMxCjsjJmkJLD9Hhuik+a23iSwfOAnWK6AY/VoD
'' SIG '' ZatWvGG6mZzMRs/s5Whztt8IRxLMrLbA+ulDkDKTlqqf
'' SIG '' BWN8xAM23VX2IMmPYFXMf1TgyT3rCr2oontG6eWT0VYa
'' SIG '' j8DrYJuWtoNQaHIxSg3lGWyvqi1RwJc7GjVwJObnRCTH
'' SIG '' Faqmfxwry/5jEDjPNNUyDiMWIr2xxCbe5pu759mb9Hjl
'' SIG '' rSakmU9AhIxEURqKA3wmnF9Sw+OnazRGp4bvfkCeWDtK
'' SIG '' LdN4JKj5eh21hDCCBrwwggWkoAMCAQICEAPxtOFfOoLx
'' SIG '' FJZ4s9fYR1wwDQYJKoZIhvcNAQELBQAwbDELMAkGA1UE
'' SIG '' BhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0IEluYzEZMBcG
'' SIG '' A1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTErMCkGA1UEAxMi
'' SIG '' RGlnaUNlcnQgSGlnaCBBc3N1cmFuY2UgRVYgUm9vdCBD
'' SIG '' QTAeFw0xMjA0MTgxMjAwMDBaFw0yNzA0MTgxMjAwMDBa
'' SIG '' MGwxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2Vy
'' SIG '' dCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20x
'' SIG '' KzApBgNVBAMTIkRpZ2lDZXJ0IEVWIENvZGUgU2lnbmlu
'' SIG '' ZyBDQSAoU0hBMikwggEiMA0GCSqGSIb3DQEBAQUAA4IB
'' SIG '' DwAwggEKAoIBAQCnU/oPsrUT8WTPhID8roA10bbXx6Ms
'' SIG '' rBosrPGErDo1EjqSkbpX5MTJ8y+oSDy31m7clyK6UXlh
'' SIG '' r0MvDbebtEkxrkRYPqShlqeHTyN+w2xlJJBVPqHKI3zF
'' SIG '' QunEemJFm33eY3TLnmMl+ISamq1FT659H8gTy3WbyeHh
'' SIG '' ivgLDJj0yj7QRap6HqVYkzY0visuKzFYZrQyEJ+d8FKh
'' SIG '' 7+g+03byQFrc+mo9G0utdrCMXO42uoPqMKhM3vELKlhB
'' SIG '' iK4AiasD0RaCICJ2615UOBJi4dJwJNvtH3DSZAmALeK2
'' SIG '' nc4f8rsh82zb2LMZe4pQn+/sNgpcmrdK0wigOXn93b89
'' SIG '' OgklAgMBAAGjggNYMIIDVDASBgNVHRMBAf8ECDAGAQH/
'' SIG '' AgEAMA4GA1UdDwEB/wQEAwIBhjATBgNVHSUEDDAKBggr
'' SIG '' BgEFBQcDAzB/BggrBgEFBQcBAQRzMHEwJAYIKwYBBQUH
'' SIG '' MAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBJBggr
'' SIG '' BgEFBQcwAoY9aHR0cDovL2NhY2VydHMuZGlnaWNlcnQu
'' SIG '' Y29tL0RpZ2lDZXJ0SGlnaEFzc3VyYW5jZUVWUm9vdENB
'' SIG '' LmNydDCBjwYDVR0fBIGHMIGEMECgPqA8hjpodHRwOi8v
'' SIG '' Y3JsMy5kaWdpY2VydC5jb20vRGlnaUNlcnRIaWdoQXNz
'' SIG '' dXJhbmNlRVZSb290Q0EuY3JsMECgPqA8hjpodHRwOi8v
'' SIG '' Y3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRIaWdoQXNz
'' SIG '' dXJhbmNlRVZSb290Q0EuY3JsMIIBxAYDVR0gBIIBuzCC
'' SIG '' AbcwggGzBglghkgBhv1sAwIwggGkMDoGCCsGAQUFBwIB
'' SIG '' Fi5odHRwOi8vd3d3LmRpZ2ljZXJ0LmNvbS9zc2wtY3Bz
'' SIG '' LXJlcG9zaXRvcnkuaHRtMIIBZAYIKwYBBQUHAgIwggFW
'' SIG '' HoIBUgBBAG4AeQAgAHUAcwBlACAAbwBmACAAdABoAGkA
'' SIG '' cwAgAEMAZQByAHQAaQBmAGkAYwBhAHQAZQAgAGMAbwBu
'' SIG '' AHMAdABpAHQAdQB0AGUAcwAgAGEAYwBjAGUAcAB0AGEA
'' SIG '' bgBjAGUAIABvAGYAIAB0AGgAZQAgAEQAaQBnAGkAQwBl
'' SIG '' AHIAdAAgAEMAUAAvAEMAUABTACAAYQBuAGQAIAB0AGgA
'' SIG '' ZQAgAFIAZQBsAHkAaQBuAGcAIABQAGEAcgB0AHkAIABB
'' SIG '' AGcAcgBlAGUAbQBlAG4AdAAgAHcAaABpAGMAaAAgAGwA
'' SIG '' aQBtAGkAdAAgAGwAaQBhAGIAaQBsAGkAdAB5ACAAYQBu
'' SIG '' AGQAIABhAHIAZQAgAGkAbgBjAG8AcgBwAG8AcgBhAHQA
'' SIG '' ZQBkACAAaABlAHIAZQBpAG4AIABiAHkAIAByAGUAZgBl
'' SIG '' AHIAZQBuAGMAZQAuMB0GA1UdDgQWBBSP6H7wbTJqAAUj
'' SIG '' x3CXajqQ/2vq1DAfBgNVHSMEGDAWgBSxPsNpA/i/RwHU
'' SIG '' mCYaCALvY2QrwzANBgkqhkiG9w0BAQsFAAOCAQEAGTNK
'' SIG '' DIEzN9utNsnkyTq7tRsueqLi9ENCF56/TqFN4bHb6YHd
'' SIG '' nwHy5IjV6f4J/SHB7F2A0vDWwUPC/ncr2/nXkTPObNWy
'' SIG '' GTvmLtbJk0+IQI7N4fV+8Q/GWVZy6OtqQb0c1UbVfEnK
'' SIG '' ZjgVwb/gkXB3h9zJjTHJDCmiM+2N4ofNiY0/G//V4BqX
'' SIG '' i3zabfuoxrI6Zmt7AbPN2KY07BIBq5VYpcRTV6hg5ucC
'' SIG '' EqC5I2SiTbt8gSVkIb7P7kIYQ5e7pTcGr03/JqVNYUvs
'' SIG '' RkG4Zc64eZ4IlguBjIo7j8eZjKMqbphtXmHGlreKuWEt
'' SIG '' k7jrDgRD1/X+pvBi1JlqpcHB8GSUgDGCER0wghEZAgEB
'' SIG '' MIGAMGwxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdp
'' SIG '' Q2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5j
'' SIG '' b20xKzApBgNVBAMTIkRpZ2lDZXJ0IEVWIENvZGUgU2ln
'' SIG '' bmluZyBDQSAoU0hBMikCEAd13Frd+SiE2xnVVUwH7Ekw
'' SIG '' DQYJYIZIAWUDBAIBBQCggaIwGQYJKoZIhvcNAQkDMQwG
'' SIG '' CisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwGCisG
'' SIG '' AQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIMHFtqoQmkQH
'' SIG '' J+iq55hem8ljCVeMgnSFe2KLkiL3BS3iMDYGCisGAQQB
'' SIG '' gjcCAQwxKDAmoCSAIgBBAGQAbwBiAGUAIABJAGwAbAB1
'' SIG '' AHMAdAByAGEAdABvAHIwDQYJKoZIhvcNAQEBBQAEggEA
'' SIG '' BGt+5aziFld7YzSp5BD0ZFZ5Hh3edep1dlEL2XHqVred
'' SIG '' ykeES298oCBnW722pw3e1QSaSYoI39Sh4zx61FNOOZKk
'' SIG '' +pqfJZhpJeNn1Jww0xAriYs9WrbkcxJU/dWnBANYHz7S
'' SIG '' FnrLg1U/sBceQaaYeyRFrwf48gJn6ZbBQ99+4dyFyJtX
'' SIG '' 5CB7zp+euKK0ZjL6F1U1/lhUhXfYWPUd1qF8ETnbo2U6
'' SIG '' S7OdNWtPKx+wcSN5+e9JIIrcQcSmlEFD9aBrbJPgLxFQ
'' SIG '' f78jJvhwoU1fQnXuAY+R7LJZB2kv88FaOczng3RKy8K/
'' SIG '' m8/JMnVj+Vzb9/ArNPGi4AH34rXbmHn3AqGCDsgwgg7E
'' SIG '' BgorBgEEAYI3AwMBMYIOtDCCDrAGCSqGSIb3DQEHAqCC
'' SIG '' DqEwgg6dAgEDMQ8wDQYJYIZIAWUDBAIBBQAwdwYLKoZI
'' SIG '' hvcNAQkQAQSgaARmMGQCAQEGCWCGSAGG/WwHATAxMA0G
'' SIG '' CWCGSAFlAwQCAQUABCC6bsVJGa1ucqKbLpzNuculLCbO
'' SIG '' /1ADe+R0Olz2zFvrvgIQce6RbW3iboepOwaFRpXd3BgP
'' SIG '' MjAyMDA0MDYyMDIyMzFaoIILuzCCBoIwggVqoAMCAQIC
'' SIG '' EATNP4VornbGG7D+cWDMp20wDQYJKoZIhvcNAQELBQAw
'' SIG '' cjELMAkGA1UEBhMCVVMxFTATBgNVBAoTDERpZ2lDZXJ0
'' SIG '' IEluYzEZMBcGA1UECxMQd3d3LmRpZ2ljZXJ0LmNvbTEx
'' SIG '' MC8GA1UEAxMoRGlnaUNlcnQgU0hBMiBBc3N1cmVkIElE
'' SIG '' IFRpbWVzdGFtcGluZyBDQTAeFw0xOTEwMDEwMDAwMDBa
'' SIG '' Fw0zMDEwMTcwMDAwMDBaMEwxCzAJBgNVBAYTAlVTMRcw
'' SIG '' FQYDVQQKEw5EaWdpQ2VydCwgSW5jLjEkMCIGA1UEAxMb
'' SIG '' VElNRVNUQU1QLVNIQTI1Ni0yMDE5LTEwLTE1MIIBIjAN
'' SIG '' BgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6WQ1nPqp
'' SIG '' mGVkG+QX3LgpNsxnCViFTTDgyf/lOzwRKFCvBzHiXQkY
'' SIG '' wvaJjGkIBCPgdy2dFeW46KFqjv/UrtJ6Fu/4QbUdOXXB
'' SIG '' zy+nrEV+lG2sAwGZPGI+fnr9RZcxtPq32UI+p1Wb31pP
'' SIG '' WAKoMmkiE76Lgi3GmKtrm7TJ8mURDHQNsvAIlnTE6LJI
'' SIG '' oqEUpfj64YlwRDuN7/uk9MO5vRQs6wwoJyWAqxBLFhJg
'' SIG '' C2kijE7NxtWyZVkh4HwsEo1wDo+KyuDT17M5d1DQQiwu
'' SIG '' es6cZ3o4d1RA/0+VBCDU68jOhxQI/h2A3dDnK3jqvx9w
'' SIG '' xu5CFlM2RZtTGUlinXoCm5UUowIDAQABo4IDODCCAzQw
'' SIG '' DgYDVR0PAQH/BAQDAgeAMAwGA1UdEwEB/wQCMAAwFgYD
'' SIG '' VR0lAQH/BAwwCgYIKwYBBQUHAwgwggG/BgNVHSAEggG2
'' SIG '' MIIBsjCCAaEGCWCGSAGG/WwHATCCAZIwKAYIKwYBBQUH
'' SIG '' AgEWHGh0dHBzOi8vd3d3LmRpZ2ljZXJ0LmNvbS9DUFMw
'' SIG '' ggFkBggrBgEFBQcCAjCCAVYeggFSAEEAbgB5ACAAdQBz
'' SIG '' AGUAIABvAGYAIAB0AGgAaQBzACAAQwBlAHIAdABpAGYA
'' SIG '' aQBjAGEAdABlACAAYwBvAG4AcwB0AGkAdAB1AHQAZQBz
'' SIG '' ACAAYQBjAGMAZQBwAHQAYQBuAGMAZQAgAG8AZgAgAHQA
'' SIG '' aABlACAARABpAGcAaQBDAGUAcgB0ACAAQwBQAC8AQwBQ
'' SIG '' AFMAIABhAG4AZAAgAHQAaABlACAAUgBlAGwAeQBpAG4A
'' SIG '' ZwAgAFAAYQByAHQAeQAgAEEAZwByAGUAZQBtAGUAbgB0
'' SIG '' ACAAdwBoAGkAYwBoACAAbABpAG0AaQB0ACAAbABpAGEA
'' SIG '' YgBpAGwAaQB0AHkAIABhAG4AZAAgAGEAcgBlACAAaQBu
'' SIG '' AGMAbwByAHAAbwByAGEAdABlAGQAIABoAGUAcgBlAGkA
'' SIG '' bgAgAGIAeQAgAHIAZQBmAGUAcgBlAG4AYwBlAC4wCwYJ
'' SIG '' YIZIAYb9bAMVMB8GA1UdIwQYMBaAFPS24SAd/imu0uRh
'' SIG '' pbKiJbLIFzVuMB0GA1UdDgQWBBRWUw/BxgenTdfYbldy
'' SIG '' gFBM5OyewTBxBgNVHR8EajBoMDKgMKAuhixodHRwOi8v
'' SIG '' Y3JsMy5kaWdpY2VydC5jb20vc2hhMi1hc3N1cmVkLXRz
'' SIG '' LmNybDAyoDCgLoYsaHR0cDovL2NybDQuZGlnaWNlcnQu
'' SIG '' Y29tL3NoYTItYXNzdXJlZC10cy5jcmwwgYUGCCsGAQUF
'' SIG '' BwEBBHkwdzAkBggrBgEFBQcwAYYYaHR0cDovL29jc3Au
'' SIG '' ZGlnaWNlcnQuY29tME8GCCsGAQUFBzAChkNodHRwOi8v
'' SIG '' Y2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRTSEEy
'' SIG '' QXNzdXJlZElEVGltZXN0YW1waW5nQ0EuY3J0MA0GCSqG
'' SIG '' SIb3DQEBCwUAA4IBAQAug6FEBUoE47kyUvrZgfAau/gJ
'' SIG '' jSO5PdiSoeZGHEovbno8Y243F6Mav1gjskOclINOOQmw
'' SIG '' LOjH4eLM7ct5a87eIwFH7ZVUgeCAexKxrwKGqTpzav74
'' SIG '' n8GN0SGM5CmCw4oLYAACnR9HxJ+0CmhTf1oQpvgi5vhT
'' SIG '' kjFf2IKDLW0TQq6DwRBOpCT0R5zeDyJyd1x/T+k5mCtX
'' SIG '' kkTX726T2UPHBDNjUTdWnkcEEcOjWFQh2OKOVtdJP1f8
'' SIG '' Cp8jXnv0lI3dnRq733oqptJFplUMj/ZMivKWz4lG3DGy
'' SIG '' kZCjXzMwYFX1/GswrKHt5EdOM55naii1TcLtW5eC+Mup
'' SIG '' CGxTCbT3MIIFMTCCBBmgAwIBAgIQCqEl1tYyG35B5AXa
'' SIG '' NpfCFTANBgkqhkiG9w0BAQsFADBlMQswCQYDVQQGEwJV
'' SIG '' UzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQL
'' SIG '' ExB3d3cuZGlnaWNlcnQuY29tMSQwIgYDVQQDExtEaWdp
'' SIG '' Q2VydCBBc3N1cmVkIElEIFJvb3QgQ0EwHhcNMTYwMTA3
'' SIG '' MTIwMDAwWhcNMzEwMTA3MTIwMDAwWjByMQswCQYDVQQG
'' SIG '' EwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYD
'' SIG '' VQQLExB3d3cuZGlnaWNlcnQuY29tMTEwLwYDVQQDEyhE
'' SIG '' aWdpQ2VydCBTSEEyIEFzc3VyZWQgSUQgVGltZXN0YW1w
'' SIG '' aW5nIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
'' SIG '' CgKCAQEAvdAy7kvNj3/dqbqCmcU5VChXtiNKxA4HRTNR
'' SIG '' EH3Q+X1NaH7ntqD0jbOI5Je/YyGQmL8TvFfTw+F+CNZq
'' SIG '' FAA49y4eO+7MpvYyWf5fZT/gm+vjRkcGGlV+Cyd+wKL1
'' SIG '' oODeIj8O/36V+/OjuiI+GKwR5PCZA207hXwJ0+5dyJoL
'' SIG '' VOOoCXFr4M8iEA91z3FyTgqt30A6XLdR4aF5FMZNJCMw
'' SIG '' XbzsPGBqrC8HzP3w6kfZiFBe/WZuVmEnKYmEUeaC50ZQ
'' SIG '' /ZQqLKfkdT66mA+Ef58xFNat1fJky3seBdCEGXIX8RcG
'' SIG '' 7z3N1k3vBkL9olMqT4UdxB08r8/arBD13ays6Vb/kwID
'' SIG '' AQABo4IBzjCCAcowHQYDVR0OBBYEFPS24SAd/imu0uRh
'' SIG '' pbKiJbLIFzVuMB8GA1UdIwQYMBaAFEXroq/0ksuCMS1R
'' SIG '' i6enIZ3zbcgPMBIGA1UdEwEB/wQIMAYBAf8CAQAwDgYD
'' SIG '' VR0PAQH/BAQDAgGGMBMGA1UdJQQMMAoGCCsGAQUFBwMI
'' SIG '' MHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0
'' SIG '' cDovL29jc3AuZGlnaWNlcnQuY29tMEMGCCsGAQUFBzAC
'' SIG '' hjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGln
'' SIG '' aUNlcnRBc3N1cmVkSURSb290Q0EuY3J0MIGBBgNVHR8E
'' SIG '' ejB4MDqgOKA2hjRodHRwOi8vY3JsNC5kaWdpY2VydC5j
'' SIG '' b20vRGlnaUNlcnRBc3N1cmVkSURSb290Q0EuY3JsMDqg
'' SIG '' OKA2hjRodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vRGln
'' SIG '' aUNlcnRBc3N1cmVkSURSb290Q0EuY3JsMFAGA1UdIARJ
'' SIG '' MEcwOAYKYIZIAYb9bAACBDAqMCgGCCsGAQUFBwIBFhxo
'' SIG '' dHRwczovL3d3dy5kaWdpY2VydC5jb20vQ1BTMAsGCWCG
'' SIG '' SAGG/WwHATANBgkqhkiG9w0BAQsFAAOCAQEAcZUS6VGH
'' SIG '' VmnN793afKpjerN4zwY3QITvS4S/ys8DAv3Fp8MOIEIs
'' SIG '' r3fzKx8MIVoqtwU0HWqumfgnoma/Capg33akOpMP+LLR
'' SIG '' 2HwZYuhegiUexLoceywh4tZbLBQ1QwRostt1AuByx5jW
'' SIG '' PGTlH0gQGF+JOGFNYkYkh2OMkVIsrymJ5Xgf1gsUpYDX
'' SIG '' Ekdws3XVk4WTfraSZ/tTYYmo9WuWwPRYaQ18yAGxuSh1
'' SIG '' t5ljhSKMYcp5lH5Z/IwP42+1ASa2bKXuh1Eh5Fhgm7oM
'' SIG '' LSttosR+u8QlK0cCCHxJrhO24XxCQijGGFbPQTS2Zl22
'' SIG '' dHv1VjMiLyI2skuiSpXY9aaOUjGCAk0wggJJAgEBMIGG
'' SIG '' MHIxCzAJBgNVBAYTAlVTMRUwEwYDVQQKEwxEaWdpQ2Vy
'' SIG '' dCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20x
'' SIG '' MTAvBgNVBAMTKERpZ2lDZXJ0IFNIQTIgQXNzdXJlZCBJ
'' SIG '' RCBUaW1lc3RhbXBpbmcgQ0ECEATNP4VornbGG7D+cWDM
'' SIG '' p20wDQYJYIZIAWUDBAIBBQCggZgwGgYJKoZIhvcNAQkD
'' SIG '' MQ0GCyqGSIb3DQEJEAEEMBwGCSqGSIb3DQEJBTEPFw0y
'' SIG '' MDA0MDYyMDIyMzFaMCsGCyqGSIb3DQEJEAIMMRwwGjAY
'' SIG '' MBYEFAMlvVBe2pYwLcIvT6AeTCi+KDTFMC8GCSqGSIb3
'' SIG '' DQEJBDEiBCDYcaR4i7ITgTLvL3KIXqalAy/lg71izjyM
'' SIG '' dhaPqgiCRjANBgkqhkiG9w0BAQEFAASCAQDnRXrJYXpV
'' SIG '' lcrnqjZhWp3An4rYeoLHGVz2bJcLkFEhm2SGCtCX+7af
'' SIG '' hqFXDETr1siKRsk0HzQwjtFidmLr7VfW8t5Z55iJ9ijP
'' SIG '' Am+aLIw0EZGhFfsbo8ZF9LaA/0A705CWhurs1bWoRzHm
'' SIG '' oaxCNbAuixmWMfZeDr9cwZfwpofZqAC92i0V/hVog7kD
'' SIG '' cYBDv6NPVlvV6mrssIrJgksr88+5DufjQbjJLOGefLa9
'' SIG '' OBneq9X4ckrAO1k347/e3GKEtTw1KjBxq4kBCr2TaKYC
'' SIG '' eAcKsXYIeqSe1lX7XVnOwip1qUt3de+et37Rfz24Fuz6
'' SIG '' vgJh0uUFXKK8vL1FAZmEvyFg
'' SIG '' End signature block
