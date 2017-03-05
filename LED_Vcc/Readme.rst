LED gegen Vcc
+++++++++++++

In diesem Versuchsaufbau wird die LED so angesteuert, dass sie
leuchtet, wenn der GPIO LOW ist. D.h. der Strom fließt von Vcc (sollte
3.3V) über den Vorwiederstand zur LED die dann mit den GPIO verbunden
ist.

Messungen
+++++++++

Bei einem Widerstand von 220 Ohm.

LED aus
-------

Wenn LED aus, d.h. GPIO Ausgang auf HIGH.

* Messpunkt A: 3.25 V
* Messpunkt B: 3.25 V
* Strom: 0.00 mA


LED an
------

Wenn LED an, d.h. GPIO Ausgang auf LOW.

* Messpunkt A: 0.17 V
* Messpunkt B: 2.05 V
* Strom: 5.18 mA

