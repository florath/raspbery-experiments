LED gegen Vcc
+++++++++++++

In diesem Versuchsaufbau wird die LED so angesteuert, dass sie
leuchtet, wenn der GPIO LOW ist. D.h. der Strom fließt von Vcc (sollte
3.3V) über den Vorwiederstand zur LED die dann mit den GPIO verbunden
ist.

Video Transscript
-----------------

[Schaltplan LED_Vcc]

In diesem Video zeigt ich, wie mit Hilfe eines GPIO Ausgangs eine LED
angesteuert wird.

Der Versuchsaufbau ist sehr ähnlich dem aus dem letzten Video: die
Schaltpläne unterscheiden sich nur an einer Stelle: hier wird
Masse durch einen GPIO ersetzt.

Zur Ansteuerung wird hier das schon vorgestellte sysfs genutzt.

[Screencast: Editor mit lib/bash/GPIO.sh]

Die in einem der letzten Videos vorgestellten Befehle zur Ansteuerung
der GPIOs mit Hilfe des sysfs habe ich in eine kleine bash-Bibliothek
ausgelagert.  Das macht das Programmieren einfacher - man kann sich so
auf das Wesentliche konzentrieren.

Die in diesem Video benötigen Funktionen sind:

GPIO_init <pin_num>: Initialisiert einen GPIO

GPIO_cleanup <pin_num>: Deinitialisiert einen GPIO und setzt ihn in
den Ausgangszustand zurück.

GPIO_set_output <pin_num>: Schaltet einen GPIO auf Ausgang

GPIO_set <pin_num> [0|1]: Setzt einen GPIO auf den angegebenen Wert

GPIO_set_high <pin_num>: Setzt einen GPIO auf HIGH

GPIO_set_low <pin_num>: Setzt einen GPIO auf LOW


[Screencast: Editor mit led_switch.sh]

Die Nutzung dieser Funktionen funktioniert so, dass zuerst die Datei
GPIO.sh eingelesen werden muss, damit die Funktionen zur Verfügung
stehen.

Eine typische Sequenz: GPIO_init, GPIO_set_output, GPIO_set

Diese Sequenz habe ich in das bash-Skript led_switch.sh hinterlegt, so
kann mit

* gpio_switch.sh -g 17 off
  Der GPIO ausgeschaltet (d.h. auf LOW gesetzt) werden

* gpio_switch.sh -g 17 on
  Der GPIO eingeschaltet (d.h. auf HIGH gesetzt) werden

[Hintergrund: Terminal auf den Raspberry Pi
 Vordergrund: Versuchsaufbau mit Vcc und Masse
 Vor-Vordergrund: Schaltplan mit Vcc und Masse]

Dies ist der Versuchsaufbau wie im letzten Video gezeigt: es wird Vcc
und Masse genutzt.  Als Vorwiderstand kommt 1kOhm zum Einsatz.

[Vor-Vordergrund: Überblenden zum neuen Schaltplan mit GPIO]

Dies ist der Versuchsaufbau für die Ansteuerung mit einem GPIO.

[Screencast: Aufruf von gpio_switch.sh -g 17 on
[Video: Umstecken Masse auf Pin 17]

Die Leuchtdiode leuchtet nun nicht.  Der Versuchsaufbau ist so
gewählt, dass die LED leuchtet, wenn der GPIO auf LOW liegt.

Dann werde ich jetzt den GPIO auf LOW schalten...

[Screencast: Aufruf von gpio_switch.sh -g 17 off]

und man sieht, dass die LED nun leuchtet.

[Screencast / Video: einmalige Widerholung von aus und an.]


[Video: komplett Versuchsaufbau mit Messinstrument - LED leuchtet]

Abschließend werde ich nun die beiden Messpunkte und den Strom messen:

A = 0.047V

B = 1.847V

I = 1.287mA

bei R = 1kOhm


Berechnungen
------------

Gegenrechnung: nach dem Ohm-schen Gesetz gilt: R = U / I.

Am Widerstand fällt ab: 1.45V

1.45V / 0.001287 mA = 1126 Ohm

Widerstand gemessen: 998 Ohm.

Recht großer Unterschied. Erklärung?
