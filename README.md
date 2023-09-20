# pajackconnect
Make JACK Work With PulseAudio

This script is intended to be invoked via QjackCtl to start up and
shut down JACK on a system running PulseAudio. It handles the
necessary setup to make the two work together, so PulseAudio clients
get transparently routed through JACK while the latter is running, or
if PulseAudio is suspend by `pasuspender`, do nothing.

If you are using jack-dbus, and have `pulseaudio-module-jack` installed, 
you already have a similar functionality and this script is not required.

Usage: in QjackCtl’s “Setup” window, in the “Options” tab, enter
the command

`pajackconnect start &`

in the field labelled “Execute script after Startup”, and put

`pajackconnect stop &`

in the field labelled “Execute script on Shutdown”.

`pajackconnect reset &`

in the field labelled “Execute script after Shutdown”.

For use JACK without PulseAudio: In QjackCtl's “Setup” window in the “Settings” tab 
in the serverpath field  add `pasuspender -- ` before `jackd`, save settings 
as “No Pulse” for example. Remove `pasuspender -- `, 
and save settings as “Pulse”. Now you can select from the 
QjackCtl Setup window, if you would start JACK with or without PulseAudio.

To make it work after suspend, the file `resume-fix-pulseaudio.service` needs to be installed and enabled. 
If you use the debian package, the package installer handle that for you.

## DEBIAN:

Build package with:
```
dpkg-buildpackage -rfakeroot -uc -us -b
```
On other distributions you need to first edit the file resume-fix-pulseaudio.service
and replace `USERNAME` with your User name (logname) and `USERID` with your users ID (`id -u $(logname)`)

after install you need to run (as root)
```
systemctl enable resume-fix-pulseaudio.service
systemctl daemon-reload
```
to enable the service.
