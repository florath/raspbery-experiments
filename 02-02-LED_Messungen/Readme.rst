LED Messungen
+++++++++++++

In diesem Versuchsaufbau wird die LED zwischen Masse und Vcc
geschaltet um einige Kenngrößen zu messen.


Video Transscript
-----------------

[Schaltplan LED_generic]

In diesem Video zeigt ich, wie eine LED angesteuert wird und auf
welche Dinge zu achten ist.

Der entsprechende Schaltplan ist hier zu sehen.  Bevor es an die GPIOs
geht, baue ich den Versuch erst einmal 'trocken' auf, d.h. wie hier zu
sehen zwichen Masse und Vcc.  Im Schaltplan ist ein Messpunkt B
eingetragen, an dem ich die Spannung messen werde.

Mir sind keine exakten Spezifikationen bekannt, wie stark ein GPIO Pin
belastet werden kann.  Unterschiedlichen Quellen ist aber zu
entnehmen, dass der Stom für einen einzelnen GPIO nicht höher als 15mA
sein darf.  Weiterhin darf der Gesamtstrom aller GPIO Ausgänge nicht
mehr als 50mA betragen.

[Video: Zeigen LED]

Die Anode (der Plus-Pol) ist etwas länger; an der Kathode (Minus-Pol)
ist die LED abgeflacht.

Eine 'Standard-' LED darf mit maximal 20mA belastet werden; sie
leuchtet aber auch schon bei weniger Strom recht hell.

Aus diesen Überlegungen entscheide ich mich hier in diesem Versuch
erstmal für eine Ziel-Stromstärke von ca. 5mA.  Der daraus
resultierende Vorwiderstand beträgt 220 Ohm.  Für die Berechnung
möchte ich hier auf verschiedene Quellen im Internet verweisen.

Für meinen Versuchsaufbau ist das:

[Video: zeigen Messung Widerstand]

R = 218 Ohm

[Video: zeigen Messung Spannung]

B = 1.87 V

[Video: zeigen Messung Stromstärke]

I = 5.9 mA

[Kommentar:
D.h. am Widerstand fallen 3.25V - 1.87V = 1.38V ab,
und an der LED 1.87V.

Gegenrechnung: nach dem Ohm-schen Gesetz gilt: R = U / I.

U / I sind hier 1.38V / 0.0059 mA = 233 Ohm

Also passen theroretischer Wert und gemessener ziemlich gut überein.]


Testweise tausche ich nun den Widerstand aus und ersetze ihn durch
1kOhm.  Auch hier leuchtet die LED noch erkennbar hell.

[Video: zeigen Messung Widerstand]

R = 998 Ohm

[Video: zeigen Messung Spannung]

B = 1.79 V

I = 1.3 mA

[Video: zeigen Messung Stromstärke]

Bei 26 GPIOs und einer (möglichen) Entnahme aller GPIOs von maximal
50mA ist man mit 1kOhm Vorwiederstand für derartige Versuche auf jeden
Fall auf der sicherern Seite.  Daher werde ich zukünftig bei LED
Vorwiderständen, die ich mit dem Raspberry Pi ansteuere auf 1kOhm
zurückgreifen.
