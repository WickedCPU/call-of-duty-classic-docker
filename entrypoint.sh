#!/bin/bash

# Download linux serverfiles for Call of Duty and Call of Duty: United Offensive
if [ ! -d "/gameserver/main/" ] || [ ! -d "/gameserver/uo/" ]; then
    echo "---| Download Serverfiles for Call of Duty"
    echo "---| This can take some minutes so be patient"
    wait 3
    cd /gameserver
    if wget -nv --show-progress --progress=bar:force:noscroll "https://dl.forgotten-games.net/cod/codclassic_lnxded.tar.gz" ; then
                 echo "---| Successfully downloaded, now extracting |---"
         wait 2
         tar xzvf codclassic_lnxded.tar.gz -C /gameserver/
         rm codclassic_lnxded.tar.gz
         echo "---| Download finished |---"
         wait 3
            else
                 echo "---| Can't download 'codclassic_lnxded.tar.gz', putting server into sleep mode... |---"
         sleep infinity
        fi
fi

# Start a Vanilla Call of Duty Server
if [ "${COD_GAME}" == "main" ]; then
    echo "---| Checking if the config file 'dedicated.cfg' for Call of Duty is present"
      if [ ! -f "/config/main/dedicated.cfg" ]; then
          echo "---|  No 'dedicated.cfg' for Call of Duty found, copying default dedicated.cfg"
          mkdir /config/main
          cp /opt/config/dedicated.cfg /config/main/dedicated.cfg
          cp /opt/config/punkbuster.cfg /config/main/punkbuster.cfg
          echo "---|  Change 'dedicated.cfg to your needs and restart the container"
          sleep infinity
        else
          echo "---| Call of Duty config 'dedicated.cfg' found, continuing"
          echo "---| Start Call of Duty Server with Version ${COD_VERSION}"
          cd /gameserver/
          /gameserver/cod_lnxded_${COD_VERSION} +set fs_basepath /gameserver +set fs_game main ${STARTUP}
    fi
fi

# Start a Vanilla United Offensive Call of Duty Server
if [ "${COD_GAME}" == "uo" ]; then
    echo "---| Checking if the config file 'dedicated.cfg' for Call of Duty United Offensive is present"
      if [ ! -f "/config/uo/dedicated.cfg" ]; then
          echo "---|  No 'dedicated.cfg' for Call of Duty United Offensive found, copying default dedicated.cfg"
          mkdir /config/uo
          cp /opt/config/dedicated.cfg /config/uo/dedicated.cfg
          cp /opt/config/punkbuster.cfg /config/uo/punkbuster.cfg
          echo "---|  Change 'dedicated.cfg to your needs and restart the container"
          sleep infinity
        else
          echo "---| Call of Duty config 'dedicated.cfg' found, continuing"
          echo "---| Start Call of Duty Server with Version ${COD_VERSION}"
          cd /gameserver/
          /gameserver/coduo_lnxded_${COD_VERSION} +set fs_basepath /gameserver +set fs_game uo ${STARTUP}
    fi
fi

# Start a Modded Call of Duty Server
if [ "${COD_GAME}" == "mod" ]; then
     echo "---| Please be sure you upload all needed mod files and create the configs."
     echo "---| Change the Startup ENV to your mods's needings."
     echo "---| Server will start in 3 Seconds."
     wait 3
    /gameserver/${STARTUP}

fi


