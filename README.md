# pajackconnect
Make JACK Work With PulseAudio

This script is intended to be invoked via QjackCtl to start up and
shut down JACK on a system running PulseAudio. It handles the
necessary setup to make the two work together, so PulseAudio clients
get transparently routed through JACK while the latter is running, or
if pulseaudio is suspend by pasuspender, do nothing

Usage: in QjackCtl’s Settings window, in the “Options” tab, enter
the command

pajackconnect start &

in the field labelled “Execute script after Startup”, and put

pajackconnect stop &

in the field labelled “Execute script on Shutdown”.

pajackconnect reset &

in the field labelled “Execute script after Shutdown”.

for use jack without pulseaudio, add in Qjackctl setting window 
in the serverpath field 'pasuspender -- ' before 'jackd', save settings 
as "No Pulse" for example. Remove 'pasuspender -- ', 
and save settings as 'Pulse'. Now you can select from the 
Qjackctl setting window, if you would start jack with or without pulse.

To make it work after suspend, the file resume-fix-pulseaudio.service needs to be installed and enabled. 
If you use the debian package, the package installer handle that for you, 
on other distributions you need to first edit the file resume-fix-pulseaudio.service
and replace USERNAME with your User name (logname) and USERID with your users ID (id -u $(logname))

after install you need to run (as root)

systemctl enable resume-fix-pulseaudio.service

systemctl daemon-reload

to enable the service.
