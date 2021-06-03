#!/bin/bash

vboxmanage setextradata global GUI/MaxGuestResolution any &&
vboxmanage setextradata "Windows 7 Ultimate" "CustomVideoMode1" "1366x786x32" &&
vboxmanage controlvm "Windows 7 Ultimate" setvideomodehint 1366 768 32 &&
sudo systemctl restart vboxservice.service
