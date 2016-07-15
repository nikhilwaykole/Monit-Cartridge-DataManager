# OpenShift Monit cartridge

This GIT repository contains a downloadable  [monit](http://mmonit.com/monit)
cartridge than OpenShift users can use to monitor various metrics in their
applications, like memory usage, quota usage, etc.

Users can configure alert email to receive notifications. To do so, you need
to set `MONIT_ALERT_EMAIL` before installing the cartridge:

```
rhc env set MONIT_ALERT_EMAIL=my@email.com -a YOUR_APP
```

```
rhc env set MMONIT_SERVER_URL=mmonit-ulr -a YOUR_APP
```

```
rhc env set MMONIT_USER_PASSWORD=m/monit-Username:Passoword -a YOUR_APP
```


After this, you can add this cartridge to your application:


```
rhc cartridge-add Monit-Cartridge-ULR -a YOUR_APP
```
