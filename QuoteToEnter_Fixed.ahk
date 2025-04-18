; ================================================================
; SCRIPT ADI: QuoteToEnter_Fixed.ahk
; TANIM: Çift tırnak (") tuşunu Enter tuşuna dönüştüren script
; YAZAR: GitHub Copilot
; TARIH: 2025-04-18
; ================================================================

#NoEnv                      ; Çevre değişkenleriyle çakışmaları önler
#SingleInstance Force       ; Scriptin birden fazla çalışmasını engeller
SendMode Input              ; En güvenilir giriş metodunu kullanır
SetWorkingDir %A_ScriptDir% ; Çalışma dizinini script dizini olarak ayarlar

; DOĞRUDAN ÇİFT TIRNAK TUŞUNU YENİDEN EŞLEŞTİRİR - DAHA FAZLA KLAVYE UYUMLULUĞU
"::Send {Enter}             ; Çift tırnak tuşuna basıldığında Enter tuşu davranışı gösterir

; ALTERNATİF YÖNTEM - TARAMA KODU (SC) KULLANARAK TÜRKÇE KLAVYEDE DE ÇALIŞIR
; SC-DE::Send {Enter}       ; SC-DE pek çok klavyede çift tırnak tuşunun tarama kodudur

; BİR BAŞKA ALTERNATİF - SANAL TUŞ KODU İLE (BAZI KLAVYELERDE İŞE YARAR)
; vk00DE::Send {Enter}      ; vk00DE bazı klavyelerde çift tırnak tuşunun sanal kodudur

; SCRİPTİ GEÇİCİ OLARAK DEVRE DIŞI BIRAKMA KISAYOLU
^+q::                       ; CTRL+Shift+Q tuş kombinasyonu
    Suspend                 ; Scripti askıya alır/devam ettirir
    if (A_IsSuspended) {    ; Eğer script askıya alındıysa
        ToolTip, Script devre dışı - Çift tırnak normal çalışıyor!, % A_ScreenWidth/2, % A_ScreenHeight/2
    } else {                ; Eğer script devam ettirildiyse
        ToolTip, Script aktif - Çift tırnak şimdi Enter tuşu gibi!, % A_ScreenWidth/2, % A_ScreenHeight/2
    }
    SetTimer, RemoveToolTip, 2000  ; 2 saniye sonra ipucu metnini kaldır
    return

RemoveToolTip:              ; İpucu metnini kaldıran fonksiyon
    SetTimer, RemoveToolTip, Off
    ToolTip
    return

; SİSTEM TEPSİSİNDE GÖSTERİLECEK İKON VE BİLGİ AYARLARI
Menu, Tray, Tip, QuoteToEnter Aktif - " = Enter  ; Tepsi simgesi üzerine gelindiğinde gösterilecek metin
Menu, Tray, Icon, Shell32.dll, 138               ; Yeşil ok simgesi kullanır

; SCRİPT İLK ÇALIŞTIĞINDA TEST MESAJI GÖSTEREREK ÇALIŞTIĞINI DOĞRULAR
MsgBox, 64, QuoteToEnter Test, Scriptin çalışıp çalışmadığını test edelim!`n`nBu pencereyi kapatmak için çift tırnak (") tuşuna basın... 
