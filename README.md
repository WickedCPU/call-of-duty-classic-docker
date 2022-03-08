# Call of Duty 'Classic' Docker Image!

Here you get a Docker Image for the Game Call of Duty & Call of Duty: United Offensive. You can host easily multiple gameserver instances with one gamedir! 

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/keinnerd/codclassic?style=flat-square) ![Docker Pulls](https://img.shields.io/docker/pulls/keinnerd/codclassic?style=flat-square)

## 📦 What you get
 - Well documented Game Configurations
 - Multiple Versions (Classic CoD: `1.4`, `1.5`, `1.5b` | CoD:UO `1.51`)
 - Multiple Servers with one install
 - Download latest Serverfiles
 - Also "cracked" binaries so any user can join!

## 🚀 How to start
For a fast start simply 

    docker create \
      --name codclassic \
      -p 28960:28960 \
      -p 28960:28960/udp \
      -v <your/path/to/game/>:/gameserver \
      -v <your/path/to/game/>:/config \
      -e COD_VERSION="1_5b" \
      -e COD_GAME="main" \
      -e STARTUP="+set fs_homepath config/default +set dedicated 2 +exec dedicated.cfg" \
    keinnerd/codclassic:latest

## 🔧 Envs

|Env             |ASCII                          |HTML                         |
|----------------|-------------------------------|-----------------------------|
|COD_VERSION     | CoD: `1_4` or `1_5` or `1_5b` / UO: `1_51` |For cracked add a `_cracked` behind the Version|
|COD_GAME        |`main` or `uo` |`main` = Call of Duty / `uo` = Call of Duty: UO|
|STARTUP         | "`+set fs_homepath config/default +set dedicated 2 +exec dedicated.cfg`" | Adjust your Start command (fs_basepath is hardcoded to /gameserver)

## 📁 Multiple Servers

If you want to host multiple servers, create a new container then create inside your config folder different dirs and change `+set fs_homepath config/default` to `config/server1` the next to `config/server2`. Create Configs inside the dirs and spin up the container. 

```
── /config
 ├──> server1 (e.g call of duty)
 ├──────> dedicated.cfg
 ├──────> punkbuster.cfg
 ├──> server2 (e.g call of duty UO)
 ├──────> dedicateduo.cfg
 ├──────> punkbuster.cfg
 ├──> server3 (e.g AWEMod)
 ├──────> dedicated.cfg & aweconfig.cfg
 └──────> punkbuster.cfg
```

To enable comment the Punkbuster vars in your dedicated(uo).cfg out!

Open needed Ports in your firewall! Default Ports: 20500/udp 20510/udp 28960/tcp 28960/udp

## 👾 Mods

If you want to play a Modification you need to upload your mod in the `gamedir` and adjust some ENV's

- Change `COD_GAME` to `mod`
- Change `STARTUP` to `cod{uo}_lnxded_VERSION +set fs_basepath /gameserver +set fs_game YOURMOD +set fs_homepath config/YOURMOD/ +set dedicated 2 +exec YOURMODCONFIG.cfg` 


## 📝 ToDo

- nothing today

## 👐 Contribution

Feel free to fork and make pull requests. This are my first attempts with creating docker images so please give me feedback. 
