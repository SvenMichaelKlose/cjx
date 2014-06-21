<?php
// Author: Sven Michael Klose <pixel@copei.de>

header ("Content-Type: text/xml; charset=utf-8");

$xmlstr = <<<XML
<client version="0"
        xresolution="800"
        yresolution="640"
        color="#ff0000"
        is_blocked="no">
    <location latitude="0" longitude="0"/>
    <address>
         <name>Feelgood Apotheke</name>
         <street>Breite Str. 5</street>
         <city>Berlin</city>
         <zip>10245</zip>
         <tel>030/110824</tel>
    </address>
    <!-- Werbung bei Anwendungsstart -->
    <media src="http://copei.de/pi/start-ad.jpg"
           duration="6"/>
    <!-- Modul "Loop" bei inaktivität -->
    <loop>
        <medialist is_interruptable="yes">
            <media src="http://copei.de/pi/start-ad.jpg"/>
        </medialist>
    </loop>
    <!-- Position und Größe des Pucks beim Start -->
    <pi x="400" y="320" size="50%"/>
    <!-- Die Module und ihre Konfigurationen --> 
    <modules>
        <dashboard>
            <medialist>
                <item x="100" y="40" size="100%" rotation="350">
                    <media src="http://copei.de/pi/mediaviewer0.jpg"/>
                    <media src="http://copei.de/pi/mediaviewer.webm"/>
                </item>
                <item x="300" y="40" size="100%" rotation="370">
                    <media src="http://copei.de/pi/mediaviewer1.jpg"/>
                </item>
            </medialist>
        </dashboard>

        <mediaviewer>
            <medialist>
                <item x="100" y="40" size="100%" rotation="350">
                    <media src="http://copei.de/pi/mediaviewer0.jpg"/>
                    <media src="http://copei.de/pi/mediaviewer.webm"/>
                </item>
                <item>
                    <media src="http://copei.de/pi/mediaviewer1.jpg"/>
                </item>
            </medialist>
        </mediaviewer>

        <flippic>
             <medialist>
                <item x="100" y="40" size="100%" rotation="350">
                    <media src="http://copei.de/pi/flippic-front.jpg"/>
                    <media src="http://copei.de/pi/flippic-back.jpg"/>
                    <media src="http://copei.de/pi/flippic.webm"/>
                </item>
            </medialist>
        </flippic>

        <flipbook>
             <medialist>
                <item x="100" y="40" size="100%" rotation="350">
                    <media src="http://copei.de/pi/flipbook.webm"/>
                </item>
            </medialist>
        </flipbook>

        <coverflow>
             <medialist>
                <item>
                    <media src="http://copei.de/pi/coverflow-front.jpg"/>
                    <media src="http://copei.de/pi/coverflow-back.jpg"/>
                    <media src="http://copei.de/pi/coverflow.pdf"/>
                </item>
            </medialist>
        </coverflow>

        <slidebook>
             <medialist>
                <item>
                    <media src="http://copei.de/pi/slidebook.jpg"/>
                    <media src="http://copei.de/pi/slidebook.pdf"/>
                </item>
            </medialist>
        </slidebook>

        <memorie>
            <media src="http://copei.de/pi/memorie-back.jpg"/>
            <media src="http://copei.de/pi/memorie-1.jpg"/>
            <media src="http://copei.de/pi/memorie-2.jpg"/>
            <media src="http://copei.de/pi/memorie-3.jpg"/>
            <media src="http://copei.de/pi/memorie-4.jpg"/>
            <media src="http://copei.de/pi/memorie-5.jpg"/>
            <media src="http://copei.de/pi/memorie-6.jpg"/>
            <media src="http://copei.de/pi/memorie-7.jpg"/>
            <media src="http://copei.de/pi/memorie-8.jpg"/>
            <media src="http://copei.de/pi/memorie-9.jpg"/>
            <media src="http://copei.de/pi/memorie-10.jpg"/>
            <media src="http://copei.de/pi/memorie-11.jpg"/>
            <media src="http://copei.de/pi/memorie-12.jpg"/>
        </memorie>

        <map type="normal" zoom="1">
            <!-- Mitte der Karte -->
            <location latitude="0" longitude="0">Feelgood Apotheke</location>
            <!-- Pins -->
            <location latitude="0" longitude="0">Doc Holiday</location>
            <location latitude="0" longitude="0">Bioladen</location>
        </map>

        <pinboard>
            <item>Suche Tapedeck für Compact-Cassetten! 015736385044</item>
            <item>Wo is der Doc? 017134375773</item>
        </pinboard>

        <browser has_address_field="yes" has_keyboard="yes">
            <blacklist>
                <url>http://facebook.com</url>
            </blacklist>
            <whitelist>
                <url>http://soma.fm</url>
            </whitelist>
        </browser>

        <wall lines="4">
            <media src="http://copei.de/pi/wall-1.jpg"/>
            <media src="http://copei.de/pi/wall-2.jpg"/>
            <media src="http://copei.de/pi/wall-3.jpg"/>
            <media src="http://copei.de/pi/wall-4.jpg"/>
        </wall>
    </modules>
</client>
XML;

$xml = new SimpleXMLElement ($xmlstr);
echo $xml->asXML ();
?>
